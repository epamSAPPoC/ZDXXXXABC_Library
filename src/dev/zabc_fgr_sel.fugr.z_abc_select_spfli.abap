FUNCTION z_abc_select_spfli.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_MAX) TYPE  INT2 DEFAULT 20
*"     REFERENCE(IT_FROM) TYPE  ANY TABLE
*"     REFERENCE(IT_TO) TYPE  ANY TABLE
*"  EXPORTING
*"     REFERENCE(ET_FLIGHT) TYPE  ANY TABLE
*"  EXCEPTIONS
*"      NO_DATA
*"----------------------------------------------------------------------

  SELECT *
      FROM spfli
      WHERE cityfrom IN @it_from
        AND cityto   IN @it_to
      ORDER BY fltime
      INTO TABLE @et_flight
      UP TO @iv_max ROWS.

  IF sy-subrc <> 0.
    RAISE no_data.
  ENDIF.

ENDFUNCTION.
