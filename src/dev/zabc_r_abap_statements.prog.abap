*&---------------------------------------------------------------------*
*& Report ZABC_R_ABAP_STATEMENTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABC_R_ABAP_STATEMENTS.

PARAMETERS:
  p_num_1 TYPE i,
  p_num_2 TYPE i.

DATA:
  gv_num_1 TYPE string,
  gv_num_2 TYPE string,
  gv_sum   TYPE i,
  gv_res   TYPE char5.

gv_sum = p_num_1 + p_num_2.

CALL FUNCTION 'Z_ABC_SUM'
  EXPORTING
    iv_number_1 = p_num_1
    iv_number_2 = p_num_2
  IMPORTING
    ev_result   = gv_sum.


gv_num_1 = p_num_1.
CONDENSE gv_num_1.
WRITE gv_num_1.

WRITE ' + '.

gv_num_2 = p_num_2.
CONDENSE gv_num_2.
WRITE gv_num_2.

WRITE ' = '.

gv_res = gv_sum.
WRITE gv_res.
