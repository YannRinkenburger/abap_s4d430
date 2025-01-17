@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

define view entity ZI_10_BookingStatusVH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: '/DMO/BOOK_STATUS' )

{
      @UI.hidden: true
  key domain_name,
      @UI.hidden: true
  key value_position,
      @UI.hidden: true
  key language,
      @EndUserText: { label: 'Booking Status', quickInfo: 'Booking Status' }
      value_low as BookingStatus,
      @EndUserText: { label: 'Booking Status Text', quickInfo: 'Booking Status Text' }
      text      as BookingStatusText
}
where language = $session.system_language
