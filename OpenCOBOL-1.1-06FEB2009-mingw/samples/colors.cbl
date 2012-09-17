       IDENTIFICATION DIVISION.
       PROGRAM-ID. colors.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY screenio.
       01  Dummy                       PIC X(1).
       SCREEN SECTION.
       >>SOURCE FREE
       01  Blank-Screen.
           05 FILLER                   LINE 1 BLANK SCREEN
                                       BACKGROUND-COLOR COB-COLOR-BLACK.

       01  The-Screen BACKGROUND-COLOR COB-COLOR-BLACK FOREGROUND-COLOR COB-COLOR-WHITE.
           05 LINE 01     COLUMN 1 PIC X(1) USING Dummy.
           05                      VALUE ' (Press ENTER when done)'.

           05 LINE PLUS 1 COLUMN 1 VALUE 'Non-Blinking...'.

           05 LINE PLUS 1 COLUMN 1 VALUE '<---LOWLIGHT---><---HIGHLIGHT--><----LOW,REV---><---HIGH,REV--->'.

           05 LINE PLUS 1 COLUMN 1                         BACKGROUND-COLOR 0 FOREGROUND-COLOR 0 VALUE '00'.
           05                                              BACKGROUND-COLOR 0 FOREGROUND-COLOR 1 VALUE '10'.
           05                                              BACKGROUND-COLOR 0 FOREGROUND-COLOR 2 VALUE '20'.
           05                                              BACKGROUND-COLOR 0 FOREGROUND-COLOR 3 VALUE '30'.
           05                                              BACKGROUND-COLOR 0 FOREGROUND-COLOR 4 VALUE '40'.
           05                                              BACKGROUND-COLOR 0 FOREGROUND-COLOR 5 VALUE '50'.
           05                                              BACKGROUND-COLOR 0 FOREGROUND-COLOR 6 VALUE '60'.
           05                                              BACKGROUND-COLOR 0 FOREGROUND-COLOR 7 VALUE '70'.

           05                      HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 0 VALUE '00'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 1 VALUE '10'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 2 VALUE '20'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 3 VALUE '30'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 4 VALUE '40'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 5 VALUE '50'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 6 VALUE '60'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 7 VALUE '70'.

           05                                REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 0 VALUE '00'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 1 VALUE '10'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 2 VALUE '20'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 3 VALUE '30'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 4 VALUE '40'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 5 VALUE '50'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 6 VALUE '60'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 7 VALUE '70'.

           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 0 VALUE '00'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 1 VALUE '10'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 2 VALUE '20'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 3 VALUE '30'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 4 VALUE '40'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 5 VALUE '50'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 6 VALUE '60'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 7 VALUE '70'.

           05 LINE PLUS 1 COLUMN 1                         BACKGROUND-COLOR 1 FOREGROUND-COLOR 0 VALUE '01'.
           05                                              BACKGROUND-COLOR 1 FOREGROUND-COLOR 1 VALUE '11'.
           05                                              BACKGROUND-COLOR 1 FOREGROUND-COLOR 2 VALUE '21'.
           05                                              BACKGROUND-COLOR 1 FOREGROUND-COLOR 3 VALUE '31'.
           05                                              BACKGROUND-COLOR 1 FOREGROUND-COLOR 4 VALUE '41'.
           05                                              BACKGROUND-COLOR 1 FOREGROUND-COLOR 5 VALUE '51'.
           05                                              BACKGROUND-COLOR 1 FOREGROUND-COLOR 6 VALUE '61'.
           05                                              BACKGROUND-COLOR 1 FOREGROUND-COLOR 7 VALUE '71'.

           05                      HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 0 VALUE '01'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 1 VALUE '11'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 2 VALUE '21'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 3 VALUE '31'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 4 VALUE '41'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 5 VALUE '51'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 6 VALUE '61'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 7 VALUE '71'.

           05                                REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 0 VALUE '01'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 1 VALUE '11'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 2 VALUE '21'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 3 VALUE '31'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 4 VALUE '41'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 5 VALUE '51'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 6 VALUE '61'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 7 VALUE '71'.

           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 0 VALUE '01'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 1 VALUE '11'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 2 VALUE '21'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 3 VALUE '31'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 4 VALUE '41'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 5 VALUE '51'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 6 VALUE '61'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 7 VALUE '71'.

           05 LINE PLUS 1 COLUMN 1                         BACKGROUND-COLOR 2 FOREGROUND-COLOR 0 VALUE '02'.
           05                                              BACKGROUND-COLOR 2 FOREGROUND-COLOR 1 VALUE '12'.
           05                                              BACKGROUND-COLOR 2 FOREGROUND-COLOR 2 VALUE '22'.
           05                                              BACKGROUND-COLOR 2 FOREGROUND-COLOR 3 VALUE '32'.
           05                                              BACKGROUND-COLOR 2 FOREGROUND-COLOR 4 VALUE '42'.
           05                                              BACKGROUND-COLOR 2 FOREGROUND-COLOR 5 VALUE '52'.
           05                                              BACKGROUND-COLOR 2 FOREGROUND-COLOR 6 VALUE '62'.
           05                                              BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 VALUE '72'.

           05                      HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 0 VALUE '02'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 1 VALUE '12'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 2 VALUE '22'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 3 VALUE '32'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 4 VALUE '42'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 5 VALUE '52'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 6 VALUE '62'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 VALUE '72'.

           05                                REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 0 VALUE '02'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 1 VALUE '12'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 2 VALUE '22'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 3 VALUE '32'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 4 VALUE '42'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 5 VALUE '52'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 6 VALUE '62'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 VALUE '72'.

           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 0 VALUE '02'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 1 VALUE '12'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 2 VALUE '22'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 3 VALUE '32'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 4 VALUE '42'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 5 VALUE '52'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 6 VALUE '62'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 VALUE '72'.

           05 LINE PLUS 1 COLUMN 1                         BACKGROUND-COLOR 3 FOREGROUND-COLOR 0 VALUE '03'.
           05                                              BACKGROUND-COLOR 3 FOREGROUND-COLOR 1 VALUE '13'.
           05                                              BACKGROUND-COLOR 3 FOREGROUND-COLOR 2 VALUE '23'.
           05                                              BACKGROUND-COLOR 3 FOREGROUND-COLOR 3 VALUE '33'.
           05                                              BACKGROUND-COLOR 3 FOREGROUND-COLOR 4 VALUE '43'.
           05                                              BACKGROUND-COLOR 3 FOREGROUND-COLOR 5 VALUE '53'.
           05                                              BACKGROUND-COLOR 3 FOREGROUND-COLOR 6 VALUE '63'.
           05                                              BACKGROUND-COLOR 3 FOREGROUND-COLOR 7 VALUE '73'.

           05                      HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 0 VALUE '03'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 1 VALUE '13'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 2 VALUE '23'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 3 VALUE '33'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 4 VALUE '43'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 5 VALUE '53'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 6 VALUE '63'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 7 VALUE '73'.

           05                                REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 0 VALUE '03'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 1 VALUE '13'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 2 VALUE '23'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 3 VALUE '33'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 4 VALUE '43'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 5 VALUE '53'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 6 VALUE '63'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 7 VALUE '73'.

           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 0 VALUE '03'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 1 VALUE '13'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 2 VALUE '23'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 3 VALUE '33'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 4 VALUE '43'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 5 VALUE '53'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 6 VALUE '63'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 7 VALUE '73'.

           05 LINE PLUS 1 COLUMN 1                         BACKGROUND-COLOR 4 FOREGROUND-COLOR 0 VALUE '04'.
           05                                              BACKGROUND-COLOR 4 FOREGROUND-COLOR 1 VALUE '14'.
           05                                              BACKGROUND-COLOR 4 FOREGROUND-COLOR 2 VALUE '24'.
           05                                              BACKGROUND-COLOR 4 FOREGROUND-COLOR 3 VALUE '34'.
           05                                              BACKGROUND-COLOR 4 FOREGROUND-COLOR 4 VALUE '44'.
           05                                              BACKGROUND-COLOR 4 FOREGROUND-COLOR 5 VALUE '54'.
           05                                              BACKGROUND-COLOR 4 FOREGROUND-COLOR 6 VALUE '64'.
           05                                              BACKGROUND-COLOR 4 FOREGROUND-COLOR 7 VALUE '74'.

           05                      HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 0 VALUE '04'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 1 VALUE '14'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 2 VALUE '24'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 3 VALUE '34'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 4 VALUE '44'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 5 VALUE '54'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 6 VALUE '64'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 7 VALUE '74'.

           05                                REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 0 VALUE '04'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 1 VALUE '14'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 2 VALUE '24'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 3 VALUE '34'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 4 VALUE '44'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 5 VALUE '54'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 6 VALUE '64'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 7 VALUE '74'.

           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 0 VALUE '04'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 1 VALUE '14'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 2 VALUE '24'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 3 VALUE '34'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 4 VALUE '44'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 5 VALUE '54'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 6 VALUE '64'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 7 VALUE '74'.

           05 LINE PLUS 1 COLUMN 1                         BACKGROUND-COLOR 5 FOREGROUND-COLOR 0 VALUE '05'.
           05                                              BACKGROUND-COLOR 5 FOREGROUND-COLOR 1 VALUE '15'.
           05                                              BACKGROUND-COLOR 5 FOREGROUND-COLOR 2 VALUE '25'.
           05                                              BACKGROUND-COLOR 5 FOREGROUND-COLOR 3 VALUE '35'.
           05                                              BACKGROUND-COLOR 5 FOREGROUND-COLOR 4 VALUE '45'.
           05                                              BACKGROUND-COLOR 5 FOREGROUND-COLOR 5 VALUE '55'.
           05                                              BACKGROUND-COLOR 5 FOREGROUND-COLOR 6 VALUE '65'.
           05                                              BACKGROUND-COLOR 5 FOREGROUND-COLOR 7 VALUE '75'.

           05                      HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 0 VALUE '05'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 1 VALUE '15'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 2 VALUE '25'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 3 VALUE '35'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 4 VALUE '45'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 5 VALUE '55'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 6 VALUE '65'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 7 VALUE '75'.

           05                                REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 0 VALUE '05'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 1 VALUE '15'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 2 VALUE '25'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 3 VALUE '35'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 4 VALUE '45'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 5 VALUE '55'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 6 VALUE '65'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 7 VALUE '75'.

           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 0 VALUE '05'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 1 VALUE '15'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 2 VALUE '25'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 3 VALUE '35'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 4 VALUE '45'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 5 VALUE '55'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 6 VALUE '65'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 7 VALUE '75'.

           05 LINE PLUS 1 COLUMN 1                         BACKGROUND-COLOR 6 FOREGROUND-COLOR 0 VALUE '06'.
           05                                              BACKGROUND-COLOR 6 FOREGROUND-COLOR 1 VALUE '16'.
           05                                              BACKGROUND-COLOR 6 FOREGROUND-COLOR 2 VALUE '26'.
           05                                              BACKGROUND-COLOR 6 FOREGROUND-COLOR 3 VALUE '36'.
           05                                              BACKGROUND-COLOR 6 FOREGROUND-COLOR 4 VALUE '46'.
           05                                              BACKGROUND-COLOR 6 FOREGROUND-COLOR 5 VALUE '56'.
           05                                              BACKGROUND-COLOR 6 FOREGROUND-COLOR 6 VALUE '66'.
           05                                              BACKGROUND-COLOR 6 FOREGROUND-COLOR 7 VALUE '76'.

           05                      HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 0 VALUE '06'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 1 VALUE '16'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 2 VALUE '26'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 3 VALUE '36'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 4 VALUE '46'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 5 VALUE '56'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 6 VALUE '66'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 7 VALUE '76'.

           05                                REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 0 VALUE '06'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 1 VALUE '16'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 2 VALUE '26'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 3 VALUE '36'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 4 VALUE '46'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 5 VALUE '56'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 6 VALUE '66'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 7 VALUE '76'.

           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 0 VALUE '06'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 1 VALUE '16'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 2 VALUE '26'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 3 VALUE '36'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 4 VALUE '46'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 5 VALUE '56'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 6 VALUE '66'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 7 VALUE '76'.

           05 LINE PLUS 1 COLUMN 1                         BACKGROUND-COLOR 7 FOREGROUND-COLOR 0 VALUE '07'.
           05                                              BACKGROUND-COLOR 7 FOREGROUND-COLOR 1 VALUE '17'.
           05                                              BACKGROUND-COLOR 7 FOREGROUND-COLOR 2 VALUE '27'.
           05                                              BACKGROUND-COLOR 7 FOREGROUND-COLOR 3 VALUE '37'.
           05                                              BACKGROUND-COLOR 7 FOREGROUND-COLOR 4 VALUE '47'.
           05                                              BACKGROUND-COLOR 7 FOREGROUND-COLOR 5 VALUE '57'.
           05                                              BACKGROUND-COLOR 7 FOREGROUND-COLOR 6 VALUE '67'.
           05                                              BACKGROUND-COLOR 7 FOREGROUND-COLOR 7 VALUE '77'.

           05                      HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 0 VALUE '07'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 1 VALUE '17'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 2 VALUE '27'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 3 VALUE '37'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 4 VALUE '47'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 5 VALUE '57'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 6 VALUE '67'.
           05                      HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 7 VALUE '77'.

           05                                REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0 VALUE '07'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 1 VALUE '17'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 2 VALUE '27'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 3 VALUE '37'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 4 VALUE '47'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 5 VALUE '57'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 6 VALUE '67'.
           05                                REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 7 VALUE '77'.

           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0 VALUE '07'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 1 VALUE '17'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 2 VALUE '27'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 3 VALUE '37'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 4 VALUE '47'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 5 VALUE '57'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 6 VALUE '67'.
           05                      HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 7 VALUE '77'.

           05 LINE PLUS 1 COLUMN 1 VALUE 'Blinking...'.

           05 LINE PLUS 1 COLUMN 1 VALUE '<---LOWLIGHT---><---HIGHLIGHT--><----LOW,REV---><---HIGH,REV--->'.

           05 LINE PLUS 1 COLUMN 1 BLINK                         BACKGROUND-COLOR 0 FOREGROUND-COLOR 0 VALUE '00'.
           05                      BLINK                         BACKGROUND-COLOR 0 FOREGROUND-COLOR 1 VALUE '10'.
           05                      BLINK                         BACKGROUND-COLOR 0 FOREGROUND-COLOR 2 VALUE '20'.
           05                      BLINK                         BACKGROUND-COLOR 0 FOREGROUND-COLOR 3 VALUE '30'.
           05                      BLINK                         BACKGROUND-COLOR 0 FOREGROUND-COLOR 4 VALUE '40'.
           05                      BLINK                         BACKGROUND-COLOR 0 FOREGROUND-COLOR 5 VALUE '50'.
           05                      BLINK                         BACKGROUND-COLOR 0 FOREGROUND-COLOR 6 VALUE '60'.
           05                      BLINK                         BACKGROUND-COLOR 0 FOREGROUND-COLOR 7 VALUE '70'.

           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 0 VALUE '00'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 1 VALUE '10'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 2 VALUE '20'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 3 VALUE '30'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 4 VALUE '40'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 5 VALUE '50'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 6 VALUE '60'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 0 FOREGROUND-COLOR 7 VALUE '70'.

           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 0 VALUE '00'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 1 VALUE '10'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 2 VALUE '20'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 3 VALUE '30'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 4 VALUE '40'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 5 VALUE '50'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 6 VALUE '60'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 7 VALUE '70'.

           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 0 VALUE '00'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 1 VALUE '10'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 2 VALUE '20'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 3 VALUE '30'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 4 VALUE '40'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 5 VALUE '50'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 6 VALUE '60'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 0 FOREGROUND-COLOR 7 VALUE '70'.

           05 LINE PLUS 1 COLUMN 1 BLINK                         BACKGROUND-COLOR 1 FOREGROUND-COLOR 0 VALUE '01'.
           05                      BLINK                         BACKGROUND-COLOR 1 FOREGROUND-COLOR 1 VALUE '11'.
           05                      BLINK                         BACKGROUND-COLOR 1 FOREGROUND-COLOR 2 VALUE '21'.
           05                      BLINK                         BACKGROUND-COLOR 1 FOREGROUND-COLOR 3 VALUE '31'.
           05                      BLINK                         BACKGROUND-COLOR 1 FOREGROUND-COLOR 4 VALUE '41'.
           05                      BLINK                         BACKGROUND-COLOR 1 FOREGROUND-COLOR 5 VALUE '51'.
           05                      BLINK                         BACKGROUND-COLOR 1 FOREGROUND-COLOR 6 VALUE '61'.
           05                      BLINK                         BACKGROUND-COLOR 1 FOREGROUND-COLOR 7 VALUE '71'.

           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 0 VALUE '01'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 1 VALUE '11'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 2 VALUE '21'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 3 VALUE '31'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 4 VALUE '41'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 5 VALUE '51'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 6 VALUE '61'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 1 FOREGROUND-COLOR 7 VALUE '71'.

           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 0 VALUE '01'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 1 VALUE '11'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 2 VALUE '21'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 3 VALUE '31'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 4 VALUE '41'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 5 VALUE '51'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 6 VALUE '61'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 7 VALUE '71'.

           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 0 VALUE '01'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 1 VALUE '11'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 2 VALUE '21'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 3 VALUE '31'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 4 VALUE '41'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 5 VALUE '51'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 6 VALUE '61'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 1 FOREGROUND-COLOR 7 VALUE '71'.

           05 LINE PLUS 1 COLUMN 1 BLINK                         BACKGROUND-COLOR 2 FOREGROUND-COLOR 0 VALUE '02'.
           05                      BLINK                         BACKGROUND-COLOR 2 FOREGROUND-COLOR 1 VALUE '12'.
           05                      BLINK                         BACKGROUND-COLOR 2 FOREGROUND-COLOR 2 VALUE '22'.
           05                      BLINK                         BACKGROUND-COLOR 2 FOREGROUND-COLOR 3 VALUE '32'.
           05                      BLINK                         BACKGROUND-COLOR 2 FOREGROUND-COLOR 4 VALUE '42'.
           05                      BLINK                         BACKGROUND-COLOR 2 FOREGROUND-COLOR 5 VALUE '52'.
           05                      BLINK                         BACKGROUND-COLOR 2 FOREGROUND-COLOR 6 VALUE '62'.
           05                      BLINK                         BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 VALUE '72'.

           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 0 VALUE '02'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 1 VALUE '12'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 2 VALUE '22'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 3 VALUE '32'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 4 VALUE '42'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 5 VALUE '52'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 6 VALUE '62'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 VALUE '72'.

           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 0 VALUE '02'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 1 VALUE '12'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 2 VALUE '22'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 3 VALUE '32'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 4 VALUE '42'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 5 VALUE '52'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 6 VALUE '62'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 VALUE '72'.

           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 0 VALUE '02'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 1 VALUE '12'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 2 VALUE '22'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 3 VALUE '32'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 4 VALUE '42'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 5 VALUE '52'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 6 VALUE '62'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 VALUE '72'.

           05 LINE PLUS 1 COLUMN 1 BLINK                         BACKGROUND-COLOR 3 FOREGROUND-COLOR 0 VALUE '03'.
           05                      BLINK                         BACKGROUND-COLOR 3 FOREGROUND-COLOR 1 VALUE '13'.
           05                      BLINK                         BACKGROUND-COLOR 3 FOREGROUND-COLOR 2 VALUE '23'.
           05                      BLINK                         BACKGROUND-COLOR 3 FOREGROUND-COLOR 3 VALUE '33'.
           05                      BLINK                         BACKGROUND-COLOR 3 FOREGROUND-COLOR 4 VALUE '43'.
           05                      BLINK                         BACKGROUND-COLOR 3 FOREGROUND-COLOR 5 VALUE '53'.
           05                      BLINK                         BACKGROUND-COLOR 3 FOREGROUND-COLOR 6 VALUE '63'.
           05                      BLINK                         BACKGROUND-COLOR 3 FOREGROUND-COLOR 7 VALUE '73'.

           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 0 VALUE '03'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 1 VALUE '13'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 2 VALUE '23'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 3 VALUE '33'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 4 VALUE '43'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 5 VALUE '53'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 6 VALUE '63'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 3 FOREGROUND-COLOR 7 VALUE '73'.

           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 0 VALUE '03'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 1 VALUE '13'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 2 VALUE '23'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 3 VALUE '33'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 4 VALUE '43'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 5 VALUE '53'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 6 VALUE '63'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 7 VALUE '73'.

           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 0 VALUE '03'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 1 VALUE '13'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 2 VALUE '23'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 3 VALUE '33'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 4 VALUE '43'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 5 VALUE '53'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 6 VALUE '63'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 3 FOREGROUND-COLOR 7 VALUE '73'.

           05 LINE PLUS 1 COLUMN 1 BLINK                         BACKGROUND-COLOR 4 FOREGROUND-COLOR 0 VALUE '04'.
           05                      BLINK                         BACKGROUND-COLOR 4 FOREGROUND-COLOR 1 VALUE '14'.
           05                      BLINK                         BACKGROUND-COLOR 4 FOREGROUND-COLOR 2 VALUE '24'.
           05                      BLINK                         BACKGROUND-COLOR 4 FOREGROUND-COLOR 3 VALUE '34'.
           05                      BLINK                         BACKGROUND-COLOR 4 FOREGROUND-COLOR 4 VALUE '44'.
           05                      BLINK                         BACKGROUND-COLOR 4 FOREGROUND-COLOR 5 VALUE '54'.
           05                      BLINK                         BACKGROUND-COLOR 4 FOREGROUND-COLOR 6 VALUE '64'.
           05                      BLINK                         BACKGROUND-COLOR 4 FOREGROUND-COLOR 7 VALUE '74'.

           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 0 VALUE '04'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 1 VALUE '14'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 2 VALUE '24'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 3 VALUE '34'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 4 VALUE '44'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 5 VALUE '54'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 6 VALUE '64'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 4 FOREGROUND-COLOR 7 VALUE '74'.

           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 0 VALUE '04'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 1 VALUE '14'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 2 VALUE '24'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 3 VALUE '34'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 4 VALUE '44'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 5 VALUE '54'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 6 VALUE '64'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 7 VALUE '74'.

           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 0 VALUE '04'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 1 VALUE '14'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 2 VALUE '24'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 3 VALUE '34'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 4 VALUE '44'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 5 VALUE '54'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 6 VALUE '64'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 4 FOREGROUND-COLOR 7 VALUE '74'.

           05 LINE PLUS 1 COLUMN 1 BLINK                         BACKGROUND-COLOR 5 FOREGROUND-COLOR 0 VALUE '05'.
           05                      BLINK                         BACKGROUND-COLOR 5 FOREGROUND-COLOR 1 VALUE '15'.
           05                      BLINK                         BACKGROUND-COLOR 5 FOREGROUND-COLOR 2 VALUE '25'.
           05                      BLINK                         BACKGROUND-COLOR 5 FOREGROUND-COLOR 3 VALUE '35'.
           05                      BLINK                         BACKGROUND-COLOR 5 FOREGROUND-COLOR 4 VALUE '45'.
           05                      BLINK                         BACKGROUND-COLOR 5 FOREGROUND-COLOR 5 VALUE '55'.
           05                      BLINK                         BACKGROUND-COLOR 5 FOREGROUND-COLOR 6 VALUE '65'.
           05                      BLINK                         BACKGROUND-COLOR 5 FOREGROUND-COLOR 7 VALUE '75'.

           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 0 VALUE '05'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 1 VALUE '15'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 2 VALUE '25'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 3 VALUE '35'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 4 VALUE '45'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 5 VALUE '55'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 6 VALUE '65'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 5 FOREGROUND-COLOR 7 VALUE '75'.

           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 0 VALUE '05'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 1 VALUE '15'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 2 VALUE '25'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 3 VALUE '35'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 4 VALUE '45'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 5 VALUE '55'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 6 VALUE '65'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 7 VALUE '75'.

           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 0 VALUE '05'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 1 VALUE '15'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 2 VALUE '25'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 3 VALUE '35'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 4 VALUE '45'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 5 VALUE '55'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 6 VALUE '65'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 5 FOREGROUND-COLOR 7 VALUE '75'.

           05 LINE PLUS 1 COLUMN 1 BLINK                         BACKGROUND-COLOR 6 FOREGROUND-COLOR 0 VALUE '06'.
           05                      BLINK                         BACKGROUND-COLOR 6 FOREGROUND-COLOR 1 VALUE '16'.
           05                      BLINK                         BACKGROUND-COLOR 6 FOREGROUND-COLOR 2 VALUE '26'.
           05                      BLINK                         BACKGROUND-COLOR 6 FOREGROUND-COLOR 3 VALUE '36'.
           05                      BLINK                         BACKGROUND-COLOR 6 FOREGROUND-COLOR 4 VALUE '46'.
           05                      BLINK                         BACKGROUND-COLOR 6 FOREGROUND-COLOR 5 VALUE '56'.
           05                      BLINK                         BACKGROUND-COLOR 6 FOREGROUND-COLOR 6 VALUE '66'.
           05                      BLINK                         BACKGROUND-COLOR 6 FOREGROUND-COLOR 7 VALUE '76'.

           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 0 VALUE '06'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 1 VALUE '16'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 2 VALUE '26'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 3 VALUE '36'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 4 VALUE '46'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 5 VALUE '56'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 6 VALUE '66'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 6 FOREGROUND-COLOR 7 VALUE '76'.

           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 0 VALUE '06'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 1 VALUE '16'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 2 VALUE '26'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 3 VALUE '36'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 4 VALUE '46'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 5 VALUE '56'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 6 VALUE '66'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 7 VALUE '76'.

           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 0 VALUE '06'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 1 VALUE '16'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 2 VALUE '26'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 3 VALUE '36'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 4 VALUE '46'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 5 VALUE '56'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 6 VALUE '66'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 6 FOREGROUND-COLOR 7 VALUE '76'.

           05 LINE PLUS 1 COLUMN 1 BLINK                         BACKGROUND-COLOR 7 FOREGROUND-COLOR 0 VALUE '07'.
           05                      BLINK                         BACKGROUND-COLOR 7 FOREGROUND-COLOR 1 VALUE '17'.
           05                      BLINK                         BACKGROUND-COLOR 7 FOREGROUND-COLOR 2 VALUE '27'.
           05                      BLINK                         BACKGROUND-COLOR 7 FOREGROUND-COLOR 3 VALUE '37'.
           05                      BLINK                         BACKGROUND-COLOR 7 FOREGROUND-COLOR 4 VALUE '47'.
           05                      BLINK                         BACKGROUND-COLOR 7 FOREGROUND-COLOR 5 VALUE '57'.
           05                      BLINK                         BACKGROUND-COLOR 7 FOREGROUND-COLOR 6 VALUE '67'.
           05                      BLINK                         BACKGROUND-COLOR 7 FOREGROUND-COLOR 7 VALUE '77'.

           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 0 VALUE '07'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 1 VALUE '17'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 2 VALUE '27'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 3 VALUE '37'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 4 VALUE '47'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 5 VALUE '57'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 6 VALUE '67'.
           05                      BLINK HIGHLIGHT               BACKGROUND-COLOR 7 FOREGROUND-COLOR 7 VALUE '77'.

           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0 VALUE '07'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 1 VALUE '17'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 2 VALUE '27'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 3 VALUE '37'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 4 VALUE '47'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 5 VALUE '57'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 6 VALUE '67'.
           05                      BLINK           REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 7 VALUE '77'.

           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 0 VALUE '07'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 1 VALUE '17'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 2 VALUE '27'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 3 VALUE '37'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 4 VALUE '47'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 5 VALUE '57'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 6 VALUE '67'.
           05                      BLINK HIGHLIGHT REVERSE-VIDEO BACKGROUND-COLOR 7 FOREGROUND-COLOR 7 VALUE '77'.

       >>SOURCE FIXED
       PROCEDURE DIVISION.
       000-MAIN.
           ACCEPT The-Screen.
           STOP RUN.
