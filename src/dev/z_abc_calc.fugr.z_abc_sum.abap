FUNCTION z_abc_sum.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_NUMBER_1) TYPE  I
*"     REFERENCE(IV_NUMBER_2) TYPE  I
*"  EXPORTING
*"     REFERENCE(EV_RESULT) TYPE  I
*"----------------------------------------------------------------------
  ev_result = iv_number_1 + iv_number_2.

ENDFUNCTION.
