*&---------------------------------------------------------------------*
*& Report ZABC_R_DEBUG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABC_R_DEBUG.

SELECT *
  FROM sflight
  INTO TABLE @DATA(gt_sflight).

SELECT sc~carrid,
       sc~carrname,
       sf~connid,
       sf~planetype
  FROM scarr   AS sc
  JOIN sflight AS sf
  ON   sc~carrid = sf~carrid
  INTO TABLE @DATA(gt_scarr_sflight).

SELECT *
  FROM scarr
  INTO TABLE @DATA(gt_scarr).

DATA(lv_counter) = 0.

DO 10 TIMES.
  lv_counter = lv_counter + 1.
ENDDO.

BREAK-POINT.

DO 10 TIMES.
  lv_counter = lv_counter + 1.
ENDDO.

cl_salv_table=>factory(
  IMPORTING
    r_salv_table = DATA(go_salv)
  CHANGING
    t_table = gt_scarr_sflight ).

go_salv->display( ).
