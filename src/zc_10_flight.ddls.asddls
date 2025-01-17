@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

@Metadata.allowExtensions: true

define root view entity ZC_10_Flight
  provider contract transactional_query
  as projection on ZI_10_Flight

{
  key CarrierId,
  key ConnectionId,
  key FlightDate,

      Price,
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied,
      SeatPercentage,
      
      _Booking: redirected to composition child ZC_10_Booking
}
where FlightDate > $session.system_date 
