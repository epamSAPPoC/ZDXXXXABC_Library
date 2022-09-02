*&---------------------------------------------------------------------*
*& Report ZABC_R_INSERT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABC_R_INSERT.

DATA(gs_person) = VALUE zabc_d_person(
                          person_id  = '0101'
                          first_name = 'Ostap'
                          last_name  = 'Bender'
                          age        = 27 ).

DATA(gt_person) = VALUE zabc_t_person(
                        ( person_id  = '0103'
                          first_name = 'Sherlock'
                          last_name  = 'Holmes'
                          age        = 60 )
                        ( person_id  = '0104'
                          first_name = 'James'
                          last_name  = 'Bond'
                          age        = 35 ) ).

**************************************************

*INSERT INTO zabc_d_person VALUES gs_person.

**************************************************

*INSERT zabc_d_person FROM TABLE gt_person.

**************************************************

*gs_person-age = 30.
*UPDATE zabc_d_person FROM gs_person.

**************************************************

*gt_person[ 2 ]-first_name = 'James'.
*gt_person[ 2 ]-last_name  = 'Bond'.
*UPDATE zabc_d_person FROM TABLE gt_person.

**************************************************

*gs_person-person_id = 0100.
*gs_person-person_id = 0101.
*DELETE zabc_d_person FROM gs_person.

**************************************************

*DELETE zabc_d_person FROM TABLE gt_person.
