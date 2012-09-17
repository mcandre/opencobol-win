       IDENTIFICATION DIVISION.
       PROGRAM-ID.    WINSYSTEM.
      *****************************************************************
      ** This is an OpenCOBOL subroutine that will submit a Windows  **
      ** command to the Windows "cmd.exe" command shell for proces-  **
      ** sing.  This is needed if your OpenCOBOL version was built   **
      ** using Cygwin because the "SYSTEM" built-in subroutine will  **
      ** submit commands to the Cygwin shell rather than the Windows **
      ** shell.  By using this subroutine, you don't need to include **
      ** "cmd.exe" syntax in your commands.                          **
      **                                                             **
      ** CALL "WINSYSTEM" USING <cmd>                                **
      **                                                             **
      ** >>> Note that the subroutine name MUST be specified in  <<< **
      ** >>> upper-case                                          <<< **
      *****************************************************************
      **  DATE  CHANGE DESCRIPTION                                   **
      ** ====== ==================================================== **
      ** GC0909 Initial coding                                       **
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  Cmd-Len                     USAGE BINARY-LONG.
       01  Shell-Cmd                   PIC X(1024).
       LINKAGE SECTION.
       01  Cmd                         PIC X(1) ANY LENGTH.
       PROCEDURE DIVISION USING Cmd.
       000-WINSYSTEM.
           CALL "C$PARAMSIZE" USING 1.
           MOVE RETURN-CODE TO Cmd-Len.
           MOVE SPACES TO Shell-Cmd.
           STRING "cmd.exe /C " *> Force the command to be executed by Windows
                  Cmd(1:Cmd-Len)
                  INTO Shell-Cmd
           END-STRING
           DISPLAY Shell-Cmd UPON SYSERR
           CALL "SYSTEM"
               USING TRIM(Shell-Cmd)
           END-CALL
           GOBACK
           .

