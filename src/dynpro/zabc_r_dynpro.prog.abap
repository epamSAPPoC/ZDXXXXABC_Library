*&---------------------------------------------------------------------*
*& Report ZABC_R_DYNPRO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABC_R_DYNPRO.

DATA: gv_0100_ucomm TYPE sy-ucomm.
DATA: gv_0200_ucomm TYPE sy-ucomm.
DATA: BEGIN OF gs_scr_0100,
        reader_rb TYPE flag VALUE 'X',
        book_rb   TYPE flag,
      END OF gs_scr_0100.

TABLES: zabc_s_dynpro.

INCLUDE zabc_r_dynpro_status_0100o01.

INCLUDE zabc_r_dynpro_user_command_i01.

START-OF-SELECTION.
  CALL SCREEN 0100.

INCLUDE zabc_r_dynpro_status_0200o01.

INCLUDE zabc_r_dynpro_user_command_i02.
