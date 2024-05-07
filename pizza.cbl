        IDENTIFICATION DIVISION.
        PROGRAM-ID. PIZZA.
        
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 NUM-GUESTS PIC 9(3)V99 VALUE ZEROS.
        01 PIZZAS-NEEDED PIC 9(4)V99 VALUE ZEROS.
        01 PIZZAS-NEEDED-PR PIC 9(4) VALUE ZEROS.
        
        PROCEDURE DIVISION.
        START-PROGRAM.
            DISPLAY "Enter the number of guests: ".
            ACCEPT NUM-GUESTS.
        
            COMPUTE PIZZAS-NEEDED ROUNDED = NUM-GUESTS * 1.1 + 0.9.

            IF PIZZAS-NEEDED(5:2) NOT EQUAL TO ZERO
            ADD 1 TO PIZZAS-NEEDED
            END-IF
           MOVE PIZZAS-NEEDED TO PIZZAS-NEEDED-PR
            DISPLAY "You will need to order " PIZZAS-NEEDED-PR
             " pizzas.".
        
            STOP RUN.