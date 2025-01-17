CLASS lhc_Flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Flight RESULT result.

ENDCLASS.

CLASS lhc_Flight IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Booking RESULT result.

    METHODS CancelBooking FOR MODIFY
      IMPORTING keys FOR ACTION Booking~CancelBooking RESULT result.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD CancelBooking.
    " Read Travels
    READ ENTITY IN LOCAL MODE zi_10_booking
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(bookings).

    " Process Travels
    LOOP AT bookings REFERENCE INTO DATA(booking).
      " Set Status to Cancelled
      booking->BookingStatus = 'X'.
    ENDLOOP.

    " Modify Bookings
    MODIFY ENTITY IN LOCAL MODE zi_10_booking
      UPDATE FIELDS ( BookingStatus )
      WITH VALUE #( FOR t IN bookings
        ( %tky = t-%tky BookingStatus = t-BookingStatus ) ).

     " Set Result
     result = VALUE #( FOR t IN bookings ( %tky   = t-%tky %param = t ) ).
  ENDMETHOD.

ENDCLASS.
