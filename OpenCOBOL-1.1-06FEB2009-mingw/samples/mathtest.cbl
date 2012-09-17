       IDENTIFICATION DIVISION.
       PROGRAM-ID. mathtest.
      *****************************************************************
      ** This compares the performance of performing arithmetic op-  **
      ** Erations against USAGE DISPLAY, COMP and COMP-5 numeric     **
      ** data.                                                       **
      **                                                             **
      ** Each data item will have 7 added to it ten million times.   **
      ** The time (to one-one-hundtredth of a second will be         **
      ** retrieved before and after each test and the difference     **
      ** between the two will be DISPLAYed.                          **
      **                                                             **
      ** Compile (and execute) this program twice - once with binary **
      ** truncation turned off (-fnotrunc) and once with it turned   **
      ** on (the default); you'll see some AMAZING differences in    **
      ** execution times!                                            **
      **                                                             **
      ** Remember that COBOL is retrieving wall-clock time, not      **
      ** actual CPU-used time, so other activities taking place on   **
      ** your PC may influence the timings - run the program multi-  **
      ** ple times to get your best view of the relative timings.    **
      **                                                             **
      ** AUTHOR:       GARY L. CUTLER                                **
      **               CutlerGL@gmail.com                            **
      **                                                             **
      ** DATE-WRITTEN: June 10, 2009                                 **
      **                                                             **
      *****************************************************************
      **  DATE  CHANGE DESCRIPTION                                   **
      ** ====== ==================================================== **
      ** GC0609 INITIAL CODING.                                      **
      *****************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  Binary-Item         COMP    PIC S9(9) VALUE 0.

       01  Comp-Item           COMP    PIC S9(9) VALUE 0.

       01  Comp-5-Item         COMP-5  PIC S9(9) VALUE 0.

       01  Display-Item        DISPLAY PIC S9(9) VALUE 0.

       01  Old-Time.
           05 OT-Hours                 PIC 9(2).
           05 OT-Minutes               PIC 9(2).
           05 OT-Seconds               PIC 9(2).
           05 OT-Hundredths            PIC 9(2).

       78  Repeat-Count                VALUE 10000000.

       01  The-Time.
           05 TT-Hours                 PIC 9(2).
           05 TT-Minutes               PIC 9(2).
           05 TT-Seconds               PIC 9(2).
           05 TT-Hundredths            PIC 9(2).

       01  Time-Diff                   PIC ZZ9.99.
       PROCEDURE DIVISION.

       010-Test-Usage-DISPLAY.
           ACCEPT Old-Time FROM TIME.
           PERFORM Repeat-Count TIMES
               ADD 7 TO Display-Item
           END-PERFORM.
      D    DISPLAY 'Display-Item=' Display-Item.
           PERFORM 100-Determine-Time-Diff.
           DISPLAY 'USAGE DISPLAY: ' Time-Diff ' SECONDS'.

       020-Test-Usage-COMP.
           ACCEPT Old-Time FROM TIME.
           PERFORM Repeat-Count TIMES
               ADD 7 TO Comp-Item
           END-PERFORM.
      D    DISPLAY 'Comp-Item=' Comp-Item.
           PERFORM 100-Determine-Time-Diff.
           DISPLAY 'USAGE COMP:    ' Time-Diff ' SECONDS'.

       030-Test-Usage-COMP-5.
           ACCEPT Old-Time FROM TIME.
           PERFORM Repeat-Count TIMES
               ADD 7 TO Comp-5-Item
           END-PERFORM.
      D    DISPLAY 'Comp-5-Item=' Comp-5-Item.
           PERFORM 100-Determine-Time-Diff.
           DISPLAY 'USAGE COMP-5:  ' Time-Diff ' SECONDS'.

       040-Test-Usage-BINARY.
           ACCEPT Old-Time FROM TIME.
           PERFORM Repeat-Count TIMES
               ADD 7 TO Binary-Item
           END-PERFORM.
      D    DISPLAY 'Binary-Item=' Comp-5-Item.
           PERFORM 100-Determine-Time-Diff.
           DISPLAY 'USAGE BINARY:  ' Time-Diff ' SECONDS'.

       099-Done.
           STOP RUN.
           
       100-Determine-Time-Diff.
           ACCEPT The-Time FROM TIME.
           COMPUTE Time-Diff =
              ((  TT-Hours * 360000 
                + TT-Minutes * 6000
                + TT-Seconds * 100
                + TT-Hundredths)
              -
               (  OT-Hours * 360000 
                + OT-Minutes * 6000
                + OT-Seconds * 100
                + OT-Hundredths)) / 100.
               
