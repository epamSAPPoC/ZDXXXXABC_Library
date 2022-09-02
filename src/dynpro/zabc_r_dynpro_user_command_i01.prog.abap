*----------------------------------------------------------------------*
***INCLUDE ZABC_R_DYNPRO_USER_COMMAND_I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE gv_0100_ucomm.
    WHEN 'BACK' OR 'CANCEL'.
      LEAVE TO SCREEN 0.
    WHEN 'EXIT'.
      LEAVE PROGRAM.
    WHEN 'PRESS'.

      CALL SCREEN 200
        STARTING AT 5 5
        ENDING AT 50 10.
    WHEN 'HELLO'.
      MESSAGE 'Hello button!' TYPE 'S'.
    WHEN 'DONOTPRESS'.
      MESSAGE 'Do not press this button!!!'
        TYPE 'I'
        DISPLAY LIKE 'E'.
    WHEN 'READ'.
      CASE abap_true.
        WHEN gs_scr_0100-reader_rb.
          SELECT SINGLE r~person_id
                        r~birth_date
                        r~phone_number
                        t~person_first_name
                        t~person_last_name
            FROM zabc_d_reader   AS r
            JOIN zabc_d_reader_t AS t
            ON  t~person_id = r~person_id
            AND t~langu     = sy-langu
            INTO CORRESPONDING FIELDS OF zabc_s_dynpro
            WHERE r~person_id = zabc_s_dynpro-person_id.
          IF sy-subrc <> 0.
            MESSAGE 'Reader not found'
              TYPE 'I'
              DISPLAY LIKE 'E'.
          ENDIF.
        WHEN gs_scr_0100-book_rb.
          SELECT SINGLE book_id
                        book_name
            FROM zabc_d_book
            INTO CORRESPONDING FIELDS OF zabc_s_dynpro
            WHERE book_id = zabc_s_dynpro-book_id.
          IF sy-subrc <> 0.
            MESSAGE 'Book not found'
              TYPE 'I'
              DISPLAY LIKE 'E'.
          ENDIF.
      ENDCASE.
  ENDCASE.
  CLEAR gv_0100_ucomm.
ENDMODULE.
