       IDENTIFICATION DIVISION.
       PROGRAM-ID. STREAMIO.
      ******************************************************************
      ** Author: Gary L. Cutler                                       **
      **         CutlerGL@gmail.com                                   **
      **                                                              **
      ** This routine centralizes all bytestream file I/O  functions  **
      ** into one routine.  The manner in which this routine is       **
      ** CALLed is as follows:                                        **
      **                                                              **
      **           CALL "STREAMIO" USING control-block [ , arg2 ]     **
      **                                                              **
      ** where 'control-block' is defined by the "STREAMIOcb.cpy"     **
      ** copybook and 'arg2' will vary, depending upon the function   **
      ** specified in the control block.                              **
      **                                                              **
      ** The STREAMIO routine has an advantage over the various       **
      ** "CBL_xxxxxx_FILE" routines in that:                          **
      **                                                              **
      ** 1. It automates the establishment and on-going adjustment of **
      **    the file-offset value in such a way as to simply the      **
      **    sequential processing of a bytestream file (you may still **
      **    specify a file-offset manually on each read or write, if  **
      **    you wish)                                                 **
      **                                                              **
      ** 2. It auto-detects the size of the I/O buffer you supply to  **
      **    STREAMIO, using that as the byte-count of all read and    **
      **    write operations.                                         **
      **                                                              **
      ** 3. Not only does it support the raw input and output of data **
      **    that the CBL_READ_FILE and CBL_WRITE_FILE routines do,    **
      **    but on input it is also capable of delivering just a      **
      **    single newline-delimited or carriage-return/newline de-   **
      **    limited record to the caller.                             **
      **                                                              **
      ** 4. On output, STREAMIO can optionally append either a new-   **
      **    line or carriage-return/newline sequence (your choice) to **
      **    the end of every record it writes.                        **
      **                                                              **
      ** 5. STREAMIO can automatically generate filenames for output  **
      **    files if you wish, simplifying the process of creating    **
      **    scratch or work files.                                    **
      **                                                              **
      ** 6. The STREAMIO routine also allows you to (optionally) re-  **
      **    gister a general error-handling routine to be given con-  **
      **    trol should a fatal error be detected with STREAMIO.      **
      **                                                              **
      **    This routine can be "turned on" and "turned off" at will. **
      **                                                              **
      ** The control block format is as follows.  This structure      **
      ** should be INITIALIZEd before any items within it are used.   **
      **                                                              **
      ** 01  Streamio-CB.                                             **
      **     05 SCB-Handle                        PIC X(4) COMP-X.    **
      **     05 SCB-Mode                          PIC X(1).           **
      **        88 Streamio-MODE-Input            VALUE 'I', 'i'.     **
      **        88 Streamio-MODE-Output           VALUE 'O', 'o'.     **
      **        88 Streamio-MODE-Both             VALUE 'B', 'b'.     **
      **     05 SCB-Function                      PIC X(2).           **
      **        88 Streamio-FUNC-CLOSE            VALUE 'C ', 'c '.   **
      **        88 Streamio-FUNC-DELETE           VALUE 'D ', 'd '.   **
      **        88 Streamio-FUNC-OPEN             VALUE 'O ', 'o '.   **
      **        88 Streamio-FUNC-READ             VALUE 'R ', 'r '.   **
      **        88 Streamio-FUNC-READ-Delimited   VALUE 'RD', 'rd',   **
      **                                                'rD', 'Rd'.   **
      **        88 Streamio-FUNC-WRITE            VALUE 'W ', 'w '.   **
      **        88 Streamio-FUNC-WRITE-Delimited  VALUE 'WD', 'wd',   **
      **                                                'wD', 'Wd'.   **
      **     05 SCB-Delimiter-Mode                PIC X(1).           **
      **        88 Streamio-DELIM-Unix            VALUE 'U', 'u'.     **
      **        88 Streamio-DELIM-Windows         VALUE 'W', 'w'.     **
      **     05 SCB-Offset                        PIC X(8) COMP-X.    **
      **     05 SCB-Error-Routine                 USAGE               **
      **                                          PROGRAM-POINTER.    **
      **     05 SCB-Return-Code                   USAGE BINARY-LONG.  **
      **     05 SCB-Filename                      PIC X(256).         **
      **                                                              **
      ** Such a structure is defined for your use using the copybook  **
      ** "STREAMIOcb.cpy" (you may also define your own, provided it  **
      ** conforms to the above layout).                               **
      **--------------------------------------------------------------**
      ** SCB-Handle                                                   **
      **--------------------------------------------------------------**
      **                                                              **
      ** Serves as a file handle to the file once it has been opened  **
      ** (via the "Streamio-FUNC-OPEN" function).                     **
      **                                                              **
      **--------------------------------------------------------------**
      ** SCB-Mode                                                     **
      **--------------------------------------------------------------**
      **                                                              **
      ** Prior to calling "STREAMIO" for the first time for a file,   **
      ** the appropriate subordinate level-88 must be set to TRUE to  **
      ** select an I/O mode.  You may also simply move one of the     **
      ** string values listed on the level-88 items to "SCB-Mode".    **
      **                                                              **
      **--------------------------------------------------------------**
      ** SCB-Function                                                 **
      **--------------------------------------------------------------**
      **                                                              **
      ** The appropriate subordinate level-88 must be set to TRUE to  **
      ** select a function you'd like to execute against a file.  You **
      ** may also simply move one of the string values listed on the  **
      ** level-88 items to "SCB-Function".                            **
      **                                                              **
      ** Available functions are as follows:                          **
      **                                                              **
      ** Streamio-FUNC-OPEN                                           **
      **                                                              **
      **      This must be the function specified the first time you  **
      **      call STREAMIO for any given file.  It opens the file &  **
      **      makes it available for use according to the "SCB-Mode"  **
      **      specification.                                          **
      **                                                              **
      **      The filename being opened must be specified in the      **
      **      "SCB-Filename" field.                                   **
      **                                                              **
      **      The SCB-Offset field will be initialized to ZERO.       **
      **                                                              **
      **      If "arg2" is specified in conjunction with this funct-  **
      **      ion, it will be ignored.                                **
      **                                                              **
      ** Streamio-FUNC-CLOSE                                          **
      **                                                              **
      **      This function should be the one specified the LAST time **
      **      you call STREAMIO against a specific file.  After this  **
      **      function has been executed, you'll have to re-open the  **
      **      file if you wish to use it with STREAMIO again.         **
      **                                                              **
      **      The SCB-Handle item will be reset to ZERO.              **
      **                                                              **
      **      If "arg2" is specified in conjunction with this funct-  **
      **      ion, it will be ignored.                                **
      **                                                              **
      ** Streamio-FUNC-DELETE                                         **
      **                                                              **
      **      This function will delete the file specified in the     **
      **      control block (see SCB-Filename).                       **
      **                                                              **
      **      This function should not be performed against a file    **
      **      that is open.                                           **
      **                                                              **
      **      If "arg2" is specified in conjunction with this funct-  **
      **      ion, it will be ignored.                                **
      **                                                              **
      ** Streamio-FUNC-READ                                           **
      **                                                              **
      **      This function invokes a standard CBL_READ_FILE against  **
      **      the file specified in the control block (see            **
      **      SCB-Filename).                                          **
      **                                                              **
      **      The buffer into which you wish to read data must be     **
      **      supplied as "arg2".  The size of that buffer, in bytes, **
      **      will define the "byte-count" value supplied to the      **
      **      CBL_READ_FILE subroutine.  The buffer data item will be **
      **      set to SPACES before the read takes place.              **
      **                                                              **
      **      If the file-offset value (SCB-Offset) is greater than   **
      **      the size of the file, a "no more data" return code (01) **
      **      will be passed back in SCB-Return-Code and the buffer   **
      **      will have been set to SPACES.                           **
      **                                                              **
      **      At the conclusion of a successful Streamio-FUNC-READ,   **
      **      the value of SCB-Offset will have been automatically    **
      **      incremented by the byte-count size of "arg2".           **
      **                                                              **
      ** Streamio-FUNC-WRITE                                          **
      **                                                              **
      **      This function invokes a standard CBL_WRITE_FILE against **
      **      the file specified in the control block (see            **
      **      SCB-Filename).                                          **
      **                                                              **
      **      The buffer from which data will be written to the file  **
      **      must be supplied as "arg2".  The size of that buffer,   **
      **      in bytes, will define the "byte-count" value supplied   **
      **      CBL_WRITE_FILE subroutine.  The buffer data will be     **
      **      written to the file-offset position defined by the      **
      **      SCB-Offset value.  You may specify "arg2" either as an  **
      **      actual alphanumeric data item or as an alphanumeric     **
      **      literal.                                                **
      **                                                              **
      **      If the file-offset value (SCB-Offset) is greater than   **
      **      the size of the file, a "no more data" return code will **
      **      be passed back in SCB-Return-Code and the buffer will   **
      **      have been set to SPACES.                                **
      **                                                              **
      **      At the conclusion of a successful Streamio-FUNC-WRITE,  **
      **      the value of SCB-Offset will have been automatically    **
      **      incremented by the byte-count size of "arg2".           **
      **                                                              **
      ** Streamio-FUNC-READ-Delimited                                 **
      **                                                              **
      **      Streamio-FUNC-READ-Delimited bahaves like the Streamio- **
      **      FUNC-READ function, with the following behavioral dif-  **
      **      ferences:                                               **
      **                                                              **
      **      1. When data is read from the file, only that data read **
      **         up to BUT NOT INCLUDING an end-of-line delimiter     **
      **         sequence (either a LF or CRLF) will be retained in   **
      **         the buffer - the remainder of the buffer from the    **
      **         end-of-line sequence onward will be reset to SPACES. **
      **         The file-offset value (SCB-Offset) will be incre-    **
      **         mented ONLY by the amount of data transferred up to  **
      **         AND INCLUDING the end-of-line sequence.              **
      **                                                              **
      **      2. When data is read from the file and an end-of-line   **
      **         delimiter sequence (either a LF or a CRLF) cannot be **
      **         found within the buffer, the assumption is made that **
      **         the record is too long to fit within the buffer.  In **
      **         these instances, an SCB-Return-Code value of 02 will **
      **         be returned and the SCB-Offset value will be incre-  **
      **         mented past the next end-of-line sequence in the     **
      **         file (this will involve at least one additional call **
      **         to CBL_READ_FILE to locate that eol sequence, but    **
      **         any additional such reads will be done internally to **
      **         STREAMIO and will be entirely transparent to the     **
      **         caller of STREAMIO.                                  **
      **                                                              **
      **      DO NOT USE the Streamio-READ-Delimited function if the  **
      **      possibility exists that linefeed (X"0A") or carriage-   **
      **      return (X"0D") characters could exist as actual data    **
      **      characters in the file.                                 **
      **                                                              **
      ** Streamio-FUNC-WRITE-Delimited                                **
      **                                                              **
      **      Streamio-FUNC-WRITE-Delimited acts like the Streamio-   **
      **      FUNC-WRITE function, with the following difference:     **
      **                                                              **
      **      After the specified data is written to the file, an     **
      **      end-of-line sequence will also be written to the file.  **
      **      The file-offset value (SCB-Value) will be incremented   **
      **      by the byte-count size of the data PLUS the size of the **
      **      end-of-line sequence.  One of two possible end-of-line  **
      **      sequences must be specified using the value of SCB-     **
      **      Delimter-Mode.                                          **
      **                                                              **
      **--------------------------------------------------------------**
      ** SCB-Delimiter-Mode                                           **
      **--------------------------------------------------------------**
      **                                                              **
      ** This data item is needed only when issuing the Streamio-     **
      ** FUNC-WRITE-Delimited function.  In those circumstances, this **
      ** item defines what end-of-line delimiter sequence is to be    **
      ** written:                                                     **
      **                                                              **
      ** If Streamio-DELIM-Unix is true, a linefeed character will be **
      ** written.                                                     **
      **                                                              **
      ** If Streamio-DELIM-Windows is true, a carriage-return and     **
      ** linefeed sequence will be written.                           **
      **                                                              **
      **--------------------------------------------------------------**
      ** SCB-Offset                                                   **
      **--------------------------------------------------------------**
      **                                                              **
      ** This data item specifies the next relative byte number with- **
      ** in the file where the next read or write will start.         **
      **                                                              **
      ** SCB-Offset is automatically set to 0 (the first byte) when   **
      ** the file is opened, and is automatically incremented as the  **
      ** file is read or written via STREAMIO.                        **
      **                                                              **
      ** You may also manually set this value as desired before any   **
      ** call to STREAMIO.                                            **
      **                                                              **
      **--------------------------------------------------------------**
      ** SCB-Error-Routine                                            **
      **--------------------------------------------------------------**
      **                                                              **
      ** To specify a general error-handling routine for handling     **
      ** STREAMIO failures, Create the routine and define an entry-   **
      ** name for it via the ENTRY statement.  Then use the following **
      ** to set that routine up as the error handler:                 **
      **                                                              **
      **    SET SCB-Error-Routine TO ENTRY "entry-name"               **
      **                                                              **
      ** To "turn off" the error-routine:                             **
      **                                                              **
      **    SET SCB-Error-Routine TO NULL                             **
      **                                                              **
      ** If a fatal error occurs (any error not marked with a ">" in  **
      ** the SCB-Return-Code discussion), the error routine you spe-  **
      ** cified (if any) will be set up as an exit routine via the    **
      ** CBL_EXIT_PROC subroutine; the STREAMIO routine will then is- **
      ** sue a STOP RUN to intentionally trigger your error routine.  **
      ** You will not be able to recover your program once your error **
      ** routine triggers.  If you wish to be able to recover from    **
      ** fatal STREAMIO errors, you should NOT use the SCB-Error-     **
      ** Routine feature but instead you should explicitly test the   **
      ** SCB-Return-Code value after every call to STREAMIO.          **
      **                                                              **
      ** A default error routine is defined by the "STREAMIOError.cpy"**
      ** copybook.                                                    **
      **                                                              **
      **--------------------------------------------------------------**
      ** SCB-Return-Code                                              **
      **--------------------------------------------------------------**
      **                                                              **
      ** The following are the possible SCB-Return-Code values.  The  **
      ** ones marked with a ">" will NOT trigger an error-routine, if **
      ** one is currently registered via SCB-Error-Routine.           **
      **                                                              **
      **   12 I/O error writing to file                               **
      **   11 File does not exist                                     **
      **   10 File already OPEN or already CLOSEd                     **
      ** > 02 READ-Delimited was truncated                            **
      ** > 01 No more data is available from the current SCB-Offset   **
      ** > 00 OK - the operation was successful                       **
      **   -1 Invalid SCB-Function                                    **
      **   -2 Invalid SCB-Mode                                        **
      **   -3 CBL_xxxxx_FILE routine rejected operation               **
      **   -4 Invalid delimiter mode specified (Not U/W)              **
      **                                                              **
      **--------------------------------------------------------------**
      ** SCB-Filename                                                 **
      **--------------------------------------------------------------**
      **                                                              **
      ** This is the name of the file you wish to access.             **
      **                                                              **
      ** If you are planning on reading the file, the file MUST exist **
      ** at the time the Streamio-FUNC-OPEN is executed.              **
      **                                                              **
      ** If you are planning on writing to the file, the file need    **
      ** exist when the Streamio-FUNC-OPEN is issued.                 **
      **                                                              **
      ** In general, the contents of SCB-Filename should reflect the  **
      ** complete path to the file as well as the name of the file    **
      ** itself, unless the file is contained in whatever directory   **
      ** is current at the time the Streamio-FUNC-OPEN is executed.   **
      **                                                              **
      ** The following special values may be used for SCB-Filename:   **
      **                                                              **
      ** SPACES If the filename is SPACES, a filename will be created **
      **        automatically for you in whatever directory is de-    **
      **        fined by the TEMP environment variable.  If there IS  **
      **        no TEMP variable defined, the "/tmp" folder will be   **
      **        assumed.  The filename will be STREAMIO-nnnnnnnn.dat  **
      **        where "nnnnnnnn" is a random number.                  **
      **                                                              **
      ** .      If you specify only a dot (period) as the filename,   **
      **        the behavior will be the same as with a value of      **
      **        SPACES except there will be no ".dat" at the end of   **
      **        the generated filename.                               **
      **                                                              **
      ** .ext   If you specify a filename extension prefixed with a   **
      **        dot (period), the behavior will be the same as if a   **
      **        value of SPACES were specified, except that the given **
      **        extension will be used instead of ".dat".  Note that  **
      **        if you are using a Unix/Cygwin implementation of      **
      **        OpenCOBOL and you'd like to specify a hidden file in  **
      **        the current directory as the SCB-Filename, you MUST   **
      **        code the filename as "./.xxxxx" to avoid having it    **
      **        treated as this special name.                         **
      **                                                              **
      ******************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  Access-Mode                 PIC X(1) COMP-X.
       01  Arg-Length                  PIC X(4) COMP-X.
       01  Buffer                      PIC X(256).
       01  Delimiter-Buffer            PIC X(2).
       01  Env-Temp                    PIC X(256).
       01  Slash                       PIC X(1).
       01  Tally                       USAGE BINARY-LONG.
       01  Temp-9-8                    PIC 9(8).
       01  Temp-X-256                  PIC X(256).
       LINKAGE SECTION.
       COPY STREAMIOcb.
       01  Arg2                        PIC X ANY LENGTH.
       PROCEDURE DIVISION USING Streamio-CB, Arg2.
       010-Main.
           MOVE 00 TO SCB-Return-Code
           EVALUATE TRUE
               WHEN Streamio-FUNC-CLOSE
                   PERFORM 030-Validate-Handle-NonZero
                   PERFORM 200-CLOSE
               WHEN Streamio-FUNC-DELETE
                   CALL "CBL_DELETE_FILE"
                       USING SCB-Filename
                   END-CALL
               WHEN Streamio-FUNC-OPEN
                   PERFORM 020-Validate-Handle-Zero
                   PERFORM 100-OPEN
               WHEN Streamio-FUNC-READ
                   PERFORM 030-Validate-Handle-NonZero
                   PERFORM 400-READ
               WHEN Streamio-FUNC-READ-Delimited
                   PERFORM 030-Validate-Handle-NonZero
                   PERFORM 500-READ-Delimited
               WHEN Streamio-FUNC-WRITE
                   PERFORM 030-Validate-Handle-NonZero
                   PERFORM 300-WRITE
               WHEN Streamio-FUNC-WRITE-Delimited
                   EVALUATE TRUE
                       WHEN Streamio-DELIM-Unix
                           PERFORM 030-Validate-Handle-NonZero
                           PERFORM 300-WRITE
                           MOVE 1 TO Arg-Length
                           MOVE X"0A" TO Delimiter-Buffer
                       WHEN Streamio-DELIM-Windows
                           PERFORM 030-Validate-Handle-NonZero
                           PERFORM 300-WRITE
                           MOVE 2 TO Arg-Length
                           MOVE X"0D0A" TO Delimiter-Buffer
                      WHEN OTHER
                           MOVE -4 TO SCB-Return-Code
                           PERFORM 099-ERROR-Return
                   END-EVALUATE
                   CALL "CBL_WRITE_FILE"
                       USING SCB-Handle
                             SCB-Offset
                             Arg-Length
                             0
                             Delimiter-Buffer
                   END-CALL
                   PERFORM 040-Check-WRITE-SCB-Return-Code
                   ADD Arg-Length TO SCB-Offset
               WHEN OTHER
                   MOVE -1 TO SCB-Return-Code
                   PERFORM 099-ERROR-Return
           END-EVALUATE
           GOBACK
           .
       020-Validate-Handle-Zero.
           IF SCB-Handle NOT = ZERO
               MOVE 10 TO SCB-Return-Code
               PERFORM 099-ERROR-Return
           END-IF
           .
       030-Validate-Handle-NonZero.
           IF SCB-Handle = ZERO
               MOVE 10 TO SCB-Return-Code
               PERFORM 099-ERROR-Return
           END-IF
           .
       040-Check-WRITE-SCB-Return-Code.
           IF RETURN-CODE < 0
               MOVE -3 TO SCB-Return-Code
               PERFORM 099-ERROR-Return
           END-IF
           IF RETURN-CODE = 30
               MOVE 12 TO SCB-Return-Code
               PERFORM 099-ERROR-Return
           END-IF
           MOVE 00 TO SCB-Return-Code
           .
       050-Check-READ-SCB-Return-Code.
           IF RETURN-CODE < 0
               MOVE -3 TO SCB-Return-Code
               PERFORM 099-ERROR-Return
           END-IF
           IF RETURN-CODE = 10
               MOVE 01 TO SCB-Return-Code
               GOBACK
           END-IF
           MOVE 00 TO SCB-Return-Code
           .
       060-Identify-TEMP.
           ACCEPT Env-TEMP FROM ENVIRONMENT "TEMP"
           EVALUATE TRUE
               WHEN Env-TEMP (1:1) = "/"
                   MOVE "/"    TO Slash
               WHEN Env-TEMP (2:1) = ":"
                   MOVE "\"    TO Slash
               WHEN OTHER
                   MOVE "/tmp" TO Env-TEMP
                   MOVE "/"    TO Slash
           END-EVALUATE
           .
       099-ERROR-Return.
           IF SCB-Error-Routine-Num NOT = 0
               CALL "CBL_EXIT_PROC" USING 0, SCB-Error-Routine
               END-CALL
               STOP RUN
           END-IF
           GOBACK
           .
       100-OPEN.
           IF  (Streamio-MODE-Input OR Streamio-MODE-Both)
           AND (SCB-Filename = SPACES OR LOW-VALUES)
               MOVE 11 TO SCB-Return-Code
               PERFORM 099-ERROR-Return
           END-IF
           EVALUATE TRUE
               WHEN SCB-Filename = SPACES OR LOW-VALUES
                   PERFORM 060-Identify-TEMP
                   MOVE SPACES TO SCB-Filename
                   COMPUTE
                       TEMP-9-8 = RANDOM(SECONDS-PAST-MIDNIGHT) * 100000000
                   END-COMPUTE
                   STRING
                       TRIM(Env-TEMP,TRAILING)
                       Slash
                       "STREAMIO-"
                       Temp-9-8
                       ".dat"
                       DELIMITED BY SIZE
                       INTO SCB-Filename
                   END-STRING
               WHEN SCB-Filename(1:1) = "."
                   PERFORM 060-Identify-TEMP
                   IF SCB-Filename(2:1) = SPACE
                       MOVE SPACES TO Temp-X-256
                   ELSE
                       MOVE SCB-Filename TO Temp-X-256
                   END-IF
                   MOVE SPACES TO SCB-Filename
                   COMPUTE
                       TEMP-9-8 = RANDOM(SECONDS-PAST-MIDNIGHT) * 100000000
                   END-COMPUTE
                   STRING
                       TRIM(Env-TEMP,TRAILING)
                       Slash
                       "STREAMIO-"
                       Temp-9-8
                       TRIM(Temp-X-256,TRAILING)
                       DELIMITED BY SIZE
                       INTO SCB-Filename
                   END-STRING
           END-EVALUATE
           EVALUATE TRUE
               WHEN Streamio-MODE-Input
                   MOVE 1 TO Access-Mode
               WHEN Streamio-MODE-Output
                   MOVE 2 TO Access-Mode
               WHEN Streamio-MODE-Both
                   MOVE 3 TO Access-Mode
               WHEN OTHER
                   MOVE -2 TO SCB-Return-Code
                   PERFORM 099-ERROR-Return
           END-EVALUATE
           CALL "CBL_OPEN_FILE"
               USING TRIM(SCB-Filename,TRAILING)
                     Access-Mode
                     0
                     0
                     SCB-Handle
           END-CALL
           IF RETURN-CODE = 35
               MOVE 11 TO SCB-Return-Code
               PERFORM 099-ERROR-Return
           END-IF
           IF RETURN-CODE < 0
               MOVE -2 TO SCB-Return-Code
               PERFORM 099-ERROR-Return
           END-IF
           MOVE 00 TO SCB-Return-Code
           MOVE 0 TO SCB-Offset
           .
       200-CLOSE.
           CALL "CBL_CLOSE_FILE"
               USING SCB-Handle
           END-CALL
           IF RETURN-CODE < 0
               MOVE -2 TO SCB-Return-Code
               PERFORM 099-ERROR-Return
           END-IF
           MOVE 00 TO SCB-Return-Code
           MOVE 0 TO SCB-Handle
           .
       300-WRITE.
           CALL "C$PARAMSIZE"
               USING 2
           END-CALL
           MOVE RETURN-CODE TO Arg-Length
           CALL "CBL_WRITE_FILE"
               USING SCB-Handle
                     SCB-Offset
                     Arg-Length
                     0
                     Arg2
           END-CALL
           PERFORM 040-Check-WRITE-SCB-Return-Code
           ADD Arg-Length TO SCB-Offset
           .
       400-READ.
           CALL "C$PARAMSIZE"
               USING 2
           END-CALL
           MOVE RETURN-CODE TO Arg-Length
           MOVE SPACES TO Arg2(1:Arg-Length)
           CALL "CBL_READ_FILE"
               USING SCB-Handle
                     SCB-Offset
                     Arg-Length
                     0
                     Arg2
           END-CALL
           PERFORM 050-Check-READ-SCB-Return-Code
           ADD Arg-Length TO SCB-Offset
           .
       500-READ-Delimited.
           CALL "C$PARAMSIZE"
               USING 2
           END-CALL
           MOVE RETURN-CODE TO Arg-Length
           MOVE SPACES TO Arg2(1:Arg-Length)
           CALL "CBL_READ_FILE"
               USING SCB-Handle
                     SCB-Offset
                     Arg-Length
                     0
                     Arg2
           END-CALL
           PERFORM 050-Check-READ-SCB-Return-Code
           MOVE 0 TO Tally
           INSPECT Arg2(1:Arg-Length)
               TALLYING Tally FOR ALL X"0A"
           IF Tally = 0 *> No LF found - return truncated data and position past next LF (if any)
               IF Arg2(Arg-Length:1) = X"0D"
                   MOVE SPACE TO Arg2(Arg-Length:1)
               END-IF
               ADD Arg-Length TO SCB-Offset
               MOVE 02 TO SCB-Return-Code
               MOVE 256 TO Arg-Length
               PERFORM UNTIL 0 = 1
                   MOVE SPACES TO Buffer
                   CALL "CBL_READ_FILE" USING SCB-Handle
                                              SCB-Offset
                                              Arg-Length
                                              0
                                              Buffer
                   END-CALL
                   IF RETURN-CODE < 0
                       MOVE -3 TO SCB-Return-Code
                       PERFORM 099-ERROR-Return
                   END-IF
                   IF RETURN-CODE = 10
                       GOBACK
                   END-IF
                   MOVE 0 TO TALLY
                   INSPECT Buffer
                       TALLYING Tally FOR ALL X"0A"
                   IF Tally = 0
                       ADD 256 TO SCB-Offset
                   ELSE
                       MOVE 0 TO Tally
                       INSPECT Buffer
                           TALLYING Tally FOR CHARACTERS
                                          BEFORE INITIAL X"0A"
                       ADD Tally, 1 TO SCB-Offset
                       GOBACK
                   END-IF
               END-PERFORM
           ELSE         *> There is (at least) one LF in the buffer
               MOVE 0 TO Tally
               INSPECT Arg2(1:Arg-Length)
                   TALLYING Tally FOR CHARACTERS BEFORE INITIAL X"0A"
               ADD Tally, 1 TO SCB-Offset
               IF Tally > 1
                   IF Arg2(Tally:1) = X"0D"
                       COMPUTE Arg-Length = Arg-Length - Tally + 1
                   ELSE
                       COMPUTE Arg-Length = Arg-Length - Tally
                       ADD 1 TO Tally
                   END-IF
                   MOVE SPACES TO Arg2(Tally:Arg-Length)
               ELSE
                   MOVE SPACES TO Arg2(1:Arg-Length)
               END-IF
           END-IF
           .
