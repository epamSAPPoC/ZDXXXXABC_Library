*&---------------------------------------------------------------------*
*& Include          ZABC_R_MODULARF01
*&---------------------------------------------------------------------*
FORM get_from_spfli_order_by_fltime
  USING
    ut_from  TYPE ANY TABLE
    ut_to    TYPE ANY TABLE
    ut_afrom TYPE ANY TABLE
    ut_ato   TYPE ANY TABLE
    uv_max   TYPE int2
  CHANGING
    ct_spfli_time TYPE tt_spfli.

  SELECT *
    FROM spfli
    WHERE cityfrom IN @ut_from
      AND cityto   IN @ut_to
      AND airpfrom IN @ut_afrom
      AND airpto   IN @ut_ato
    ORDER BY fltime
    INTO TABLE @ct_spfli_time
    UP TO @uv_max ROWS.
ENDFORM.

FORM get_from_spfli_order_by_dist
  USING
    ut_from  TYPE ANY TABLE
    ut_to    TYPE ANY TABLE
    ut_afrom TYPE ANY TABLE
    ut_ato   TYPE ANY TABLE
    uv_max   TYPE int2
  CHANGING
    ct_spfli_distance TYPE tt_spfli.

  SELECT *
    FROM spfli
    WHERE cityfrom IN @ut_from
      AND cityto   IN @ut_to
      AND airpfrom IN @ut_afrom
      AND airpto   IN @ut_ato
    ORDER BY distance
    INTO TABLE @ct_spfli_distance
    UP TO @uv_max ROWS.
ENDFORM.


FORM display_data
  USING
    ut_data TYPE ANY TABLE.

  cl_salv_table=>factory(
    IMPORTING r_salv_table = DATA(go_salv)
    CHANGING  t_table = ut_data ).

  go_salv->display( ).

ENDFORM.
