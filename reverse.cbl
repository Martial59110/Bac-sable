       IDENTIFICATION DIVISION.
       PROGRAM-ID. REVERSE.
   
   
       
       DATA DIVISION.
    
       
       WORKING-STORAGE SECTION.
       
       01 input-word pic x(20) value spaces.
       01 reversed-word pic x(20) value spaces.
       01 counter pic 9(4) value 1.
       01 indexs pic 9(4) value 20.
       01 char-count pic 9(4) value 0.
       01 proceeds pic x.
       procedure division.
           display "Entrez un mot: ".
           accept input-word.
           perform until proceeds = 'n'
               if char-count > function length(input-word)
                   exit perform
               end-if
               subtract 1 from indexs
               move input-word(char-count:1) to reversed-word(indexs:1)
               add 1 to char-count
           end-perform.
           display "Mot inversé: " reversed-word.
         