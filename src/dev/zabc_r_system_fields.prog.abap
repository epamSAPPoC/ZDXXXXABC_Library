*&---------------------------------------------------------------------*
*& Report ZABC_R_SYSTEM_FIELDS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABC_R_SYSTEM_FIELDS.

DATA: gv_value TYPE p DECIMALS 3 VALUE 1.

WRITE: / 'Client   (sy-mandt) : ', sy-mandt.
WRITE: / 'User     (sy-uname) : ', sy-uname.
WRITE: / 'Language (sy-langu) : ', sy-langu.
WRITE: / 'Date     (sy-datum) : ', sy-datum.
WRITE: / 'Time     (sy-uzeit) : ', sy-uzeit.
WRITE: / 'T-code   (sy-tcode) : ', sy-tcode.
WRITE: / 'Program  (sy-repid) : ', sy-repid.

ULINE.
WRITE: / 'DO loop '.

DO 3 TIMES.
  WRITE: / 'sy-index = ', sy-index.
ENDDO.

ULINE.
WRITE: / 'WHILE loop '.

WHILE gv_value < 13.
  gv_value = gv_value + ( gv_value / 3 ).
  WRITE: / 'sy-index = ', sy-index, '|  value = ', gv_value.
ENDWHILE.

ULINE.
WRITE: / 'Select data from SFLIGHT for flight date ', sy-datum.

SELECT COUNT(*)
  FROM sflight
  INTO @DATA(gv_count)
  WHERE fldate = @sy-datum.

WRITE: / 'sy-subrc = ', sy-subrc.
WRITE: / 'Number of records = ', gv_count.

ULINE.
WRITE: / 'Select data from SFLIGHT for price > 1000 EUR '.

SELECT *
  FROM sflight
  INTO TABLE @DATA(gt_flight_price)
  WHERE price > 1000
  AND currency = 'EUR'.

WRITE: / 'sy-subrc = ', sy-subrc, /.

LOOP AT gt_flight_price ASSIGNING FIELD-SYMBOL(<gs_flight_price>).
  WRITE: / 'sy-tabix = ', sy-tabix.
  WRITE: '|  ', <gs_flight_price>-carrid.
  WRITE: '|  ', <gs_flight_price>-connid.
  WRITE: '|  ', <gs_flight_price>-fldate.
  WRITE: '|  ', <gs_flight_price>-price.
  WRITE: '|  ', <gs_flight_price>-currency.
ENDLOOP.
