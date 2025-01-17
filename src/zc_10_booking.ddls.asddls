@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

@Metadata.allowExtensions: true
define view entity ZC_10_Booking
  as projection on ZI_10_BOOKING

{
  key TravelId,
  key BookingId,

      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      LastChangedAt,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_10_BookingStatusVH', element: 'BookingStatus' } }]
      BookingStatus,
      
      /* Associations */
      _Flight: redirected to parent ZC_10_Flight
}
