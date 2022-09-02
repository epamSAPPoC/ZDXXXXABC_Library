*&---------------------------------------------------------------------*
*& Report ZABC_R_USERFM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabc_r_userfm.

TABLES: spfli.

TYPES: tt_spfli TYPE STANDARD TABLE OF spfli.

DATA: gt_data TYPE tt_spfli.

SELECT-OPTIONS: s_from FOR spfli-cityfrom,
                s_to   FOR spfli-cityto.

PARAMETERS p_max TYPE int2.

START-OF-SELECTION.

  CALL FUNCTION 'Z_ABC_SELECT_SPFLI'
    EXPORTING
      iv_max    = p_max
      it_from   = s_from[]
      it_to     = s_to[]
    IMPORTING
      et_flight = gt_data
    EXCEPTIONS
      no_data   = 1.

  IF sy-subrc <> 0.
    MESSAGE 'No data found.' TYPE 'I'.
  ENDIF.

  cl_salv_table=>factory(
    IMPORTING r_salv_table = DATA(go_salv)
    CHANGING  t_table = gt_data ).

  go_salv->display( ).
