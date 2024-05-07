       IDENTIFICATION DIVISION.
         PROGRAM-ID. SALARY-MAX-MIN.
          ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHIERCLIENT ASSIGN TO "FICHIERCLIENT.txt"
           ORGANIZATION IS LINE SEQUENTIAL 
           ACCESS MODE IS SEQUENTIAL.
           

         DATA DIVISION.
       FILE SECTION.
       FD  FICHIERCLIENT.
       01  CLIENT-RECORD.
          05  CLIENT-CODE PIC X(9).
          05  ALLdat     PIC X(62).
          05  SALARY     PIC 9(6).
       
       WORKING-STORAGE SECTION.
       01  MAX-SALARY   PIC 9(6) VALUE ZEROS.
       01  MIN-SALARY   PIC 9(6) VALUE ZEROS.
       01  END-OF-FILE  PIC X VALUE 'N'.
       01  WS-CLIENT-CODE PIC X(11).
       01  WS-SALARY     PIC 9(6).
       01  WS-TEMP-SALARY PIC 9(6).
       01  COUNTER PIC 9 VALUE ZEROS.
       
       PROCEDURE DIVISION.
           OPEN INPUT FICHIERCLIENT.
       READ-FILE.
           READ FICHIERCLIENT
               AT END MOVE 'Y' TO END-OF-FILE
               NOT AT END PERFORM PROCESS-RECORD
           END-READ
           IF END-OF-FILE = 'N' GO TO READ-FILE.
           CLOSE FICHIERCLIENT.
       
           DISPLAY "Maximum salary: " MAX-SALARY.
           DISPLAY "Minimum salary: " MIN-SALARY.
       
       PROCESS-RECORD.
           MOVE CLIENT-CODE TO WS-CLIENT-CODE.
           MOVE SALARY TO WS-SALARY.
           
           MOVE WS-SALARY TO WS-TEMP-SALARY
           IF COUNTER = 0
           MOVE WS-SALARY TO MIN-SALARY
           ADD 1 TO COUNTER
           END-IF
           IF WS-SALARY > MAX-SALARY
               MOVE WS-SALARY TO MAX-SALARY
           END-IF
           IF WS-SALARY < MIN-SALARY
            IF WS-SALARY NOT EQUAL TO SPACE
               MOVE WS-SALARY TO MIN-SALARY
              
               END-IF
           END-IF.
           
       