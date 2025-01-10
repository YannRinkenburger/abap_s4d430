CLASS zcl_01_abap_cds_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_abap_cds_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA connections TYPE TABLE OF /DMO/C_Booking_Approver_M.

    SELECT FROM /DMO/C_Booking_Approver_M
      FIELDS *
      WHERE carrierId = 'LH' AND ConnectionID = '0400'
      INTO TABLE @connections.
    IF sy-subrc <> 0.
      out->write( 'no flights found' ).
    ENDIF.

    out->write( connections ).
  ENDMETHOD.
ENDCLASS.
