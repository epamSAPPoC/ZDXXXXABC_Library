*&---------------------------------------------------------------------*
*& Report ZABC_R_RANGE_SELECT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABC_R_RANGE_SELECT.

TABLES: sflight.

SELECT-OPTIONS: s_fldate FOR sflight-fldate.

START-OF-SELECTION.

BREAK-POINT.

SELECT *
  FROM sflight
  INTO TABLE @DATA(gt_sflight)
  WHERE fldate IN @s_fldate
  ORDER BY fldate.

cl_salv_table=>factory(
  IMPORTING
    r_salv_table = DATA(go_salv)
  CHANGING
    t_table = gt_sflight ).

go_salv->display( ).
