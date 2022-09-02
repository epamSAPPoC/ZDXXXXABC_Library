*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZABC_D_BOOK.....................................*
DATA:  BEGIN OF STATUS_ZABC_D_BOOK                   .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZABC_D_BOOK                   .
CONTROLS: TCTRL_ZABC_D_BOOK
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZABC_D_BOOK                   .
TABLES: ZABC_D_BOOK                    .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
