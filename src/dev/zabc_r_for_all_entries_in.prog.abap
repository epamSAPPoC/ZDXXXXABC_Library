*&---------------------------------------------------------------------*
*& Report ZABC_R_FOR_ALL_ENTRIES_IN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABC_R_FOR_ALL_ENTRIES_IN.

DATA:
  lt_sflight TYPE STANDARD TABLE OF sflight.

BREAK-POINT.

SELECT carrid, connid, fldate, price, currency, seatsocc
  FROM sflight
  INTO TABLE @DATA(gt_data_0).

SELECT carrid, connid, fldate, price, currency, seatsocc
  FROM sflight
  FOR ALL ENTRIES IN @lt_sflight
  WHERE carrid = @lt_sflight-carrid
    AND connid = @lt_sflight-connid
    AND seatsocc > 300
    AND fldate > '20180701'
  INTO TABLE @DATA(gt_data_1).

IF lt_sflight IS NOT INITIAL.
  SELECT carrid, connid, fldate, price, currency, seatsocc
    FROM sflight
    FOR ALL ENTRIES IN @lt_sflight
    WHERE carrid = @lt_sflight-carrid
      AND connid = @lt_sflight-connid
      AND seatsocc > 300
      AND fldate > '20180701'
    INTO TABLE @DATA(gt_data_2).
ENDIF.

APPEND INITIAL LINE TO lt_sflight ASSIGNING FIELD-SYMBOL(<ls_sflight>).
<ls_sflight>-carrid = 'AA'.
<ls_sflight>-connid = '0017'.

IF lt_sflight IS NOT INITIAL.
  SELECT carrid, connid, fldate, price, currency, seatsocc
    FROM sflight
    FOR ALL ENTRIES IN @lt_sflight
    WHERE carrid = @lt_sflight-carrid
      AND connid = @lt_sflight-connid
      AND seatsocc > 300
      AND fldate > '20180701'
    INTO TABLE @DATA(gt_data_3).
ENDIF.

cl_salv_table=>factory(
  IMPORTING
    r_salv_table = DATA(go_salv)
  CHANGING  t_table = gt_data_3 ).
go_salv->display( ).
