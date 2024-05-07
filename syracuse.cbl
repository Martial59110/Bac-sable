       IDENTIFICATION DIVISION.
       PROGRAM-ID. SYRACUSE.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM PIC 9(8) VALUE ZEROS.
       01 COUNTER PIC 9(3) VALUE ZEROS.
       
       PROCEDURE DIVISION.
       START-PROGRAM.
           DISPLAY "Enter a positive integer number: ".
           ACCEPT NUM.
       
           PERFORM UNTIL NUM = 1
               COMPUTE COUNTER = COUNTER + 1
               IF FUNCTION MOD(NUM, 2) = 0
                   DIVIDE NUM BY 2 GIVING NUM
               ELSE
                   MULTIPLY NUM BY 3 GIVING NUM
                   ADD 1 TO NUM
               END-IF
           END-PERFORM.
       
           DISPLAY "Nombre d'étapes pour obtenir 1 : " COUNTER.
       
           STOP RUN.