      ******************************************************************
      * Author: MOSTAPHA A
      * Purpose: Define a data structure for student records
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STUDENT-REPORT-PGM.
       AUTHOR. MOSTAPHA ABDELAZIZ.
       DATE-WRITTEN. 01/17/2023.
       SECURITY. NON CONFIDENTIAL.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENTS-FILE
           ASSIGN TO "..\STUDENT.TXT"
           ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD STUDENTS-FILE.
       01 STUDENT-RECORD.
           05 STUDENT-NUMBER PIC X(10).
           05 STUDENT-PROGRAM PIC X(8).
           05 STUDENT-YEAR PIC 9(6).
           05 STUDENT-DATA.
               10 STUDENT-NAME.
                    15 TITLE PIC A(6).
                    15 FIRST-NAME PIC A(15).
                    15 INITIALS PIC A(2).
                    15 LAST-NAME PIC A(28).
               10 STUDENT-ADDRESS.
                    15 STREET-ADDRESS PIC X(25).
                    15 CITY-NAME PIC X(15).
                    15 PROVINCE PIC X(15).
                    15 POSTAL-CODE PIC X(7).

       WORKING-STORAGE SECTION.

       01 WS-EOF PIC A(1).

       PROCEDURE DIVISION.
           MAIN_PROGRAM.
               PERFORM OPEN_ROUTINE.
               PERFORM READ_ROUTINE UNTIL WS-EOF='Y'.
               PERFORM CLOSE_ROUTINE.
               STOP RUN.

           OPEN_ROUTINE.
               OPEN INPUT STUDENTS-FILE.

           READ_ROUTINE.
               READ STUDENTS-FILE
                   AT END MOVE 'Y' TO WS-EOF
                       NOT AT END DISPLAY STUDENT-RECORD.

           CLOSE_ROUTINE.
               CLOSE STUDENTS-FILE.

       END PROGRAM STUDENT-REPORT-PGM.
