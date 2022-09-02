CLASS lhc_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    CONSTANTS: mc_available_status TYPE zabc_d_booking_a-booking_status VALUE '1',
               mc_taken_status     TYPE zabc_d_booking_a-booking_status VALUE '2'.

  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR booking RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR booking RESULT result.

    METHODS returnthebook FOR MODIFY
      IMPORTING keys FOR ACTION booking~returnthebook RESULT result.

    METHODS bookthebook FOR DETERMINE ON SAVE
      IMPORTING keys FOR booking~bookthebook.

    METHODS validatebookavailability FOR VALIDATE ON SAVE
      IMPORTING keys FOR booking~validatebookavailability.
ENDCLASS.

CLASS lhc_booking IMPLEMENTATION.
   METHOD get_instance_features.

    READ ENTITIES OF zabc_i_booking IN LOCAL MODE

      ENTITY Booking

         FIELDS (  BookingStatus )

         WITH CORRESPONDING #( keys )

       RESULT DATA(lt_bookings)

       FAILED failed.

    result = VALUE #( FOR ls_booking IN lt_bookings

                       ( %tky                           = ls_booking-%tky

                         %features-%action-returnTheBook = COND #( WHEN ls_booking-BookingStatus = mc_taken_status

                                                                   THEN if_abap_behv=>fc-o-enabled ELSE if_abap_behv=>fc-o-disabled  )

                      ) ).

  ENDMETHOD.

  METHOD get_instance_authorizations.
    AUTHORITY-CHECK OBJECT '/ACCGO/ORG'
    ID 'ACTVT' FIELD '03'.
  ENDMETHOD.

  METHOD returnthebook.
    MODIFY ENTITIES OF zabc_i_booking IN LOCAL MODE
           ENTITY booking
           UPDATE FROM VALUE #( FOR ls_key IN keys ( %tky = ls_key-%tky
                                                        bookingstatus = mc_available_status
                                                        bookingenddate  = cl_abap_context_info=>get_system_date( )
                                                        bookingendtime  = cl_abap_context_info=>get_system_time( )
                                                        %control-bookingstatus = if_abap_behv=>mk-on
                                                        %control-bookingenddate  = if_abap_behv=>mk-on
                                                        %control-bookingendtime  = if_abap_behv=>mk-on ) )
           FAILED   failed
           REPORTED reported.

    READ ENTITIES OF zabc_i_booking IN LOCAL MODE
        ENTITY booking
          ALL FIELDS
            WITH VALUE #( FOR ls_key IN keys ( %tky = ls_key-%tky ) )
        RESULT DATA(lt_bookings).

    result = VALUE #( FOR ls_booking IN lt_bookings ( %tky      = ls_booking-%tky
                                                      %param    = ls_booking ) ).
  ENDMETHOD.

    METHOD bookthebook.

    MODIFY ENTITIES OF zabc_i_booking IN LOCAL MODE

    ENTITY Booking

    UPDATE FROM VALUE #( FOR ls_key IN keys ( %tky = ls_key-%tky

                                                 BookingStatus = mc_taken_status

                                                 BookingBegDate  =  cl_abap_context_info=>get_system_date( )

                                                 BookingBegTime  = cl_abap_context_info=>get_system_time( )

                                                 %control-BookingStatus = if_abap_behv=>mk-on

                                                 %control-BookingBegDate  = if_abap_behv=>mk-on

                                                 %control-BookingBegTime  = if_abap_behv=>mk-on ) )

           FAILED   DATA(lt_failed)

           REPORTED DATA(lt_reported).

    reported = CORRESPONDING #( DEEP lt_reported ).

  ENDMETHOD.

 METHOD validatebookavailability.

    DATA     lv_coun_taken TYPE i.



    READ ENTITIES OF zabc_i_booking IN LOCAL MODE

     ENTITY booking

     FIELDS ( bookid )

     WITH CORRESPONDING #( keys )

    RESULT DATA(lt_bookings).



    SELECT  bookid, COUNT( bookinguuid ) AS count_taken

         FROM zabc_i_booking

         WHERE bookingstatus = @mc_taken_status

         GROUP BY bookid

         INTO TABLE @DATA(lt_book_reserved).



    LOOP AT lt_bookings ASSIGNING FIELD-SYMBOL(<ls_booking>).



      SELECT bookname, copyqty

        FROM zabc_i_book

        WHERE bookid = @<ls_booking>-bookid

        INTO TABLE @DATA(lt_books).



      DATA(lv_book_qty) = lt_books[ 1 ]-copyqty.



      READ TABLE lt_book_reserved ASSIGNING FIELD-SYMBOL(<lv_book_reserved>) WITH KEY bookid =   <ls_booking>-bookid.

      IF sy-subrc = 0.

        lv_coun_taken = <lv_book_reserved>-count_taken.

      ELSE.

        lv_coun_taken = 0.

      ENDIF.



      IF lv_book_qty - lv_coun_taken < 0.

        APPEND VALUE #( %tky = <ls_booking>-%tky ) TO failed-booking.

        APPEND VALUE #( %tky = <ls_booking>-%tky

                         %msg = NEW zcm_abc_booking(

                              bookname = lt_books[ 1 ]-BookName

                              textid   = zcm_abc_booking=>book_unavailable

                              severity = if_abap_behv_message=>severity-error ) )

        TO reported-booking.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
