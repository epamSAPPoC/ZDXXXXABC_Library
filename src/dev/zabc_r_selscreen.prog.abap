*&---------------------------------------------------------------------*
*& Report ZABC_R_SELSCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABC_R_SELSCREEN.

TABLES: spfli.
TABLES: sscrfields.

SELECTION-SCREEN PUSHBUTTON 1(20) TEXT-t02 USER-COMMAND trz VISIBLE LENGTH 20.

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

AT SELECTION-SCREEN.
  IF sscrfields-ucomm = 'TRZ'.
    CALL TRANSACTION 'SE16N'.
  ENDIF.

START-OF-SELECTION.

  CASE abap_true.

    WHEN p_time.

      SELECT countryfr, cityfrom, airpfrom, countryto, cityto, airpto, fltime
      FROM spfli
      WHERE cityfrom IN @s_from
        AND cityto   IN @s_to
        AND airpfrom IN @s_afrom
        AND airpto   IN @s_ato
      ORDER BY fltime
      INTO TABLE @DATA(gt_spfli_time)
      UP TO @p_max ROWS.

      cl_salv_table=>factory(
        IMPORTING r_salv_table = DATA(go_salv)
        CHANGING  t_table = gt_spfli_time ).

      go_salv->display( ).

    WHEN p_dist.

      SELECT countryfr, cityfrom, airpfrom, countryto, cityto, airpto, distance
      FROM spfli
      WHERE cityfrom IN @s_from
        AND cityto   IN @s_to
        AND airpfrom IN @s_afrom
         AND airpto   IN @s_ato
      ORDER BY distance
      INTO TABLE @DATA(gt_spfli_distance)
      UP TO @p_max ROWS.

      cl_salv_table=>factory(
        IMPORTING r_salv_table = go_salv
        CHANGING  t_table = gt_spfli_distance ).

      go_salv->display( ).

  ENDCASE.
