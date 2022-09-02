*----------------------------------------------------------------------*
***INCLUDE ZABC_R_DYNPRO_STATUS_0100O01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS '0100'.
  SET TITLEBAR '0100'.
  LOOP AT SCREEN.
    CASE screen-group1.
      WHEN 'RB1'.
        IF gs_scr_0100-reader_rb = abap_true.
          screen-active = 1.
        ELSE.
          screen-active = 0.
        ENDIF.
        MODIFY SCREEN.
      WHEN 'RB2'.
        IF gs_scr_0100-book_rb = abap_true.
          screen-active = 1.
        ELSE.
          screen-active = 0.
        ENDIF.
        MODIFY SCREEN.
    ENDCASE.
    CASE screen-name.
      WHEN 'ZABC_S_DYNPRO-PERSON_FIRST_NAME'
        OR 'ZABC_S_DYNPRO-PERSON_LAST_NAME'.
          IF zabc_s_dynpro-show_name = abap_true.
            screen-active = 1.
          ELSE.
            screen-active = 0.
          ENDIF.
      MODIFY SCREEN.
    ENDCASE.
  ENDLOOP.
ENDMODULE.
