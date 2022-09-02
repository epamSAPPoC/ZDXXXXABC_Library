*&---------------------------------------------------------------------*
*& Include          ZABC_R_MODULARSEL
*&---------------------------------------------------------------------*
SELECT-OPTIONS: s_from FOR spfli-cityfrom,
                s_to   FOR spfli-cityto.

PARAMETERS p_max TYPE int2.

SELECTION-SCREEN BEGIN OF BLOCK bl1 WITH FRAME TITLE TEXT-t01.
PARAMETERS: p_time RADIOBUTTON GROUP gr1,
            p_dist RADIOBUTTON GROUP gr1.
SELECTION-SCREEN END OF BLOCK bl1.

PARAMETERS: p_add AS CHECKBOX USER-COMMAND p_add.

SELECT-OPTIONS: s_afrom FOR spfli-airpfrom MODIF ID gr2,
                s_ato   FOR spfli-airpto   MODIF ID gr2.

INITIALIZATION.
  p_max = 20.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF screen-group1 = 'GR2' AND p_add = 'X'.
      screen-active = '1'.
      MODIFY SCREEN.
    ELSEIF screen-group1 = 'GR2'.
      screen-active = '0'.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.
