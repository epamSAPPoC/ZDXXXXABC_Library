*&---------------------------------------------------------------------*
*& Report ZABC_R_EVENTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABC_R_EVENTS.

PARAMETERS:
  p_date  TYPE syst_datum,
  p_uname TYPE zabc_first_name LOWER CASE,
  p_logic TYPE char4.

INITIALIZATION.
  p_uname = sy-uname.
  p_logic = 'INIT'.

*AT SELECTION-SCREEN OUTPUT.
*  p_logic = 'PBO'.
*  IF p_date IS NOT INITIAL.
*    p_date = p_date + 1.
*  ELSE.
*    p_date = '19700101'.
*  ENDIF.
*
*AT SELECTION-SCREEN.
*  p_logic = 'PAI'.
*  IF p_date < '20000101'.
*    MESSAGE 'Input date no earlier than 01.01.2000. ' TYPE 'I'.
*  ELSE.
*    MESSAGE 'Date is correct. ' TYPE 'I'.
*  ENDIF.
*
*START-OF-SELECTION.
*  WRITE: 'Date: ',  p_date, / 'User: ', sy-uname.
