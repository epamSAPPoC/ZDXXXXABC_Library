*&---------------------------------------------------------------------*
*& Report ZABC_R_FORMS_INCLUDES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabc_r_modular.

INCLUDE zabc_r_modulartop.
INCLUDE zabc_r_modularsel.
INCLUDE zabc_r_modularf01.

START-OF-SELECTION.

  CASE abap_true.

    WHEN p_time.

      PERFORM get_from_spfli_order_by_fltime
        USING s_from[] s_to[] s_afrom[] s_ato[] p_max
        CHANGING gt_data.

      PERFORM display_data
        USING gt_data.

    WHEN p_dist.

      PERFORM get_from_spfli_order_by_dist
        USING s_from[] s_to[] s_afrom[] s_ato[] p_max
        CHANGING gt_data.

      PERFORM display_data
        USING gt_data.

  ENDCASE.
