       IDENTIFICATION DIVISION.
       PROGRAM-ID.   COBDUMP.
      *****************************************************************
      ** This is an OpenCOBOL subroutine that will generate a        **
      ** formatted Hex/Char dump of a storage area.  To use this     **
      ** subroutine, simply CALL it as follows:                      **
      **                                                             **
      ** CALL "COBDUMP" USING <data-item>                            **
      **                    [ <length> ]                             **
      **                                                             **
      ** If specified, the <length> argument specifies how many      **
      ** bytes of <data-item> are to be dumped.  If absent, all of   **
      ** <data-item> will be dumped (i.e. LENGTH(<data-item>) will   **
      ** be assumed for <length>).                                   **
      **                                                             **
      ** >>> Note that the subroutine name MUST be specified in  <<< **
      ** >>> UPPERCASE                                           <<< **
      **                                                             **
      ** The dump is generated to STDERR, so you may pipe it to a    **
      ** file when you execute your program using "2> file".         **
      **                                                             **
      ** AUTHOR:       GARY L. CUTLER                                **
      **               CutlerGL@gmail.com                            **
      **                                                             **
      ** NOTE:         The author has a sentimental attachment to    **
      **               this subroutine - it's been around since 1971 **
      **               and it's been converted to and run on 10 dif- **
      **               ferent operating system/compiler environments **
      **                                                             **
      ** DATE-WRITTEN: October 14, 1971                              **
      **                                                             **
      *****************************************************************
      **  DATE  CHANGE DESCRIPTION                                   **
      ** ====== ==================================================== **
      ** GC1071 Initial coding - Univac Dept. of Defense COBOL '68   **
      ** GC0577 Converted to Univac ASCII COBOL (ACOB) - COBOL '74   **
      ** GC1182 Converted to Univac UTS4000 COBOL - COBOL '74 w/     **
      **        SCREEN SECTION enhancements                          **
      ** GC0883 Converted to Honeywell/Bull COBOL - COBOL '74        **
      ** GC0983 Converted to IBM VS COBOL - COBOL '74                **
      ** GC0887 Converted to IBM VS COBOL II - COBOL '85             **
      ** GC1294 Converted to Micro Focus COBOL V3.0 - COBOL '85 w/   **
      **        extensions                                           **
      ** GC0703 Converted to Unisys Universal Compiling System (UCS) **
      **        COBOL (UCOB) - COBOL '85                             **
      ** GC1204 Converted to Unisys Object COBOL (OCOB) - COBOL 2002 **
      ** GC0609 Converted to OpenCOBOL 1.1 - COBOL '85 w/ some COBOL **
      **        2002 features                                        **
      ** GC0410 Enhanced to make 2nd argument (buffer length)        **
      **        optional                                             **
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       78  Undisplayable-Char-Symbol   VALUE X'F9'.
       01  Addr-Pointer                USAGE POINTER.
       01  Addr-Number                 REDEFINES Addr-Pointer
                                       USAGE BINARY-LONG.

       01  Addr-Sub                    USAGE BINARY-CHAR.

       01  Addr-Value                  USAGE BINARY-LONG.

       01  Buffer-Length               USAGE BINARY-LONG.

       01  Buffer-Sub           COMP-5 PIC 9(4).

       01  Hex-Digits                  VALUE '0123456789ABCDEF'.
           05 Hex-Digit                OCCURS 16 TIMES PIC X(1).

       01  Left-Nibble          COMP-5 PIC 9(1).
       01  Nibble                      REDEFINES Left-Nibble
                                       BINARY-CHAR.

       01  Output-Detail.
           05 OD-Addr.
              10 OD-Addr-Hex           OCCURS 8 TIMES PIC X.
           05 FILLER                   PIC X(1).
           05 OD-Byte                  PIC Z(3)9.
           05 FILLER                   PIC X(1).
           05 OD-Hex                   OCCURS 16 TIMES.
              10 OD-Hex-1              PIC X.
              10 OD-Hex-2              PIC X.
              10 FILLER                PIC X.
           05 OD-ASCII                 OCCURS 16 TIMES
                                       PIC X.

       01  Output-Sub           COMP-5 PIC 9(2).

       01  Output-Header-1.
           05 FILLER                   PIC X(80) VALUE
              '<-Addr-> Byte ' &
              '<---------------- Hexadecimal ----------------> ' &
              '<---- Char ---->'.

       01  Output-Header-2.
           05 FILLER                   PIC X(80) VALUE
              '======== ==== ' &
              '=============================================== ' &
              '================'.

       01  PIC-XX.
           05 FILLER                   PIC X VALUE LOW-VALUES.
           05 PIC-X                    PIC X.
       01  PIC-Halfword                REDEFINES PIC-XX
                                       PIC 9(4) COMP-X.

       01  PIC-X10.
           05 FILLER                   PIC X(2).
           05 PIC-X8                   PIC X(8).

       01  Right-Nibble         COMP-5 PIC 9(1).

       LINKAGE SECTION.
       01  Buffer                      PIC X ANY LENGTH.

       01  Buffer-Len                  USAGE BINARY-LONG.

       PROCEDURE DIVISION USING Buffer, OPTIONAL Buffer-Len.
       000-COBDUMP.
           IF NUMBER-OF-CALL-PARAMETERS = 1
               MOVE LENGTH(Buffer) TO Buffer-Length
           ELSE
               MOVE Buffer-Len     TO Buffer-Length
           END-IF
           MOVE SPACES TO Output-Detail
           SET Addr-Pointer TO ADDRESS OF Buffer
           PERFORM 100-Generate-Address
           MOVE 0 TO Output-Sub
           DISPLAY
               Output-Header-1 UPON SYSERR
           END-DISPLAY
           DISPLAY
               Output-Header-2 UPON SYSERR
           END-DISPLAY
           PERFORM VARYING Buffer-Sub FROM 1 BY 1
                     UNTIL Buffer-Sub > Buffer-Length
               ADD 1
                   TO Output-Sub
               END-ADD
               IF Output-Sub = 1
                   MOVE Buffer-Sub TO OD-Byte
               END-IF
               MOVE Buffer (Buffer-Sub : 1) TO PIC-X
               IF (PIC-X < ' ')
               OR (PIC-X > '~')
                   MOVE Undisplayable-Char-Symbol
                     TO OD-ASCII (Output-Sub)
               ELSE
                   MOVE PIC-X
                     TO OD-ASCII (Output-Sub)
               END-IF
               DIVIDE PIC-Halfword BY 16
                   GIVING Left-Nibble
                   REMAINDER Right-Nibble
               END-DIVIDE
               ADD 1 TO Left-Nibble
                        Right-Nibble
               END-ADD
               MOVE Hex-Digit (Left-Nibble)
                 TO OD-Hex-1 (Output-Sub)
               MOVE Hex-Digit (Right-Nibble)
                 TO OD-Hex-2 (Output-Sub)
               IF Output-Sub = 16
                   DISPLAY
                       Output-Detail UPON SYSERR
                   END-DISPLAY
                   MOVE SPACES TO Output-Detail
                   MOVE 0 TO Output-Sub
                   SET Addr-Pointer UP BY 16
                   PERFORM 100-Generate-Address
               END-IF
           END-PERFORM
           IF Output-Sub > 0
               DISPLAY
                   Output-Detail UPON SYSERR
               END-DISPLAY
           END-IF
           EXIT PROGRAM
           .
       100-Generate-Address.
           MOVE 8 TO Addr-Sub
           MOVE Addr-Number TO Addr-Value
           MOVE ALL '0' TO OD-Addr
           PERFORM WITH TEST BEFORE UNTIL Addr-Value = 0
               DIVIDE Addr-Value BY 16
                   GIVING Addr-Value
                   REMAINDER Nibble
               END-DIVIDE
               ADD 1 TO Nibble
               MOVE Hex-Digit (Nibble)
                 TO OD-Addr-Hex (Addr-Sub)
               SUBTRACT 1 FROM Addr-Sub
           END-PERFORM
           .



