CLASS zcl_01_abap_cds_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_abap_cds_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM ZI_01_CustomerWithTravels
      FIELDS CustomerId, FirstName, LastName
      INTO TABLE @DATA(customer_with_travel).

    out->write( customer_with_travel ).

  ENDMETHOD.
ENDCLASS.
