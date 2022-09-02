*&---------------------------------------------------------------------*
*& Report ZABC_R_SELECT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABC_R_SELECT.

DATA:
  gs_flight TYPE sflight,
  gt_flight TYPE STANDARD TABLE OF sflight.

START-OF-SELECTION.
*************************************************************************
SELECT SINGLE *
  FROM sflight
  INTO gs_flight.

WRITE: 'Structure gs_flight:'.
WRITE: / 'CARRID:',   gs_flight-CARRID,
       / 'CONNID:',   gs_flight-CONNID,
       / 'CURRENCY:', gs_flight-CURRENCY,
       / 'FLDATE:',   gs_flight-FLDATE,
       / '...'.
*************************************************************************
*SELECT *
*  FROM sflight
*  INTO gs_flight.
*WRITE: 'Structure gs_flight:'.
*WRITE: / 'CARRID:',   gs_flight-CARRID,
*       / 'CONNID:',   gs_flight-CONNID,
*       / 'CURRENCY:', gs_flight-CURRENCY,
*       / 'FLDATE:',   gs_flight-FLDATE,
*       / '...'.
*ULINE.
*ENDSELECT.
*************************************************************************
*SELECT *
*  FROM sflight
*  INTO TABLE gt_flight.
*
*  WRITE: 'Table gt_flight:'.
*  WRITE /1(10)    'CARRID'.
*  WRITE AT 11(10) 'CONNID'.
*  WRITE AT 21(10) 'CURRENCY'.
*  WRITE AT 31(10) 'FLDATE'.
*  WRITE AT 46(10) 'PAYMENTSUM'.
*  WRITE AT 61(10) 'PLANETYPE'.
*  WRITE AT 74(10) 'PRICE'.
*  WRITE AT 87(10) 'SEATSMAX'.
*  WRITE AT 97(10) '...'.
*LOOP AT gt_flight ASSIGNING FIELD-SYMBOL(<ls_flight>).
*  WRITE /1(10)    <ls_flight>-CARRID.
*  WRITE AT 11(10) <ls_flight>-CONNID.
*  WRITE AT 21(10) <ls_flight>-CURRENCY.
*  WRITE AT 31(10) <ls_flight>-FLDATE.
*  WRITE AT 46(10) <ls_flight>-PAYMENTSUM.
*  WRITE AT 61(10) <ls_flight>-PLANETYPE.
*  WRITE AT 71(10) <ls_flight>-PRICE.
*  WRITE AT 81(10) <ls_flight>-SEATSMAX.
*ENDLOOP.
