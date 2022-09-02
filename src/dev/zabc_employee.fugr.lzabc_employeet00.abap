*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZABC_D_EMPLOYEE.................................*
DATA:  BEGIN OF STATUS_ZABC_D_EMPLOYEE               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZABC_D_EMPLOYEE               .
CONTROLS: TCTRL_ZABC_D_EMPLOYEE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZABC_D_EMPLOYEE               .
TABLES: ZABC_D_EMPLOYEE                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
