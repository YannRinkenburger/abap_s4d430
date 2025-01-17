@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

define root view entity ZI_10_Flight
  as select from ZR_10_FLIGHT

  composition [0..*] of ZI_10_BOOKING as _Booking

{
  key CarrierId,
  key ConnectionId,
  key FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => Price,
                          source_currency    => CurrencyCode,
                          target_currency    => $projection.CurrencyCode,
                          exchange_rate_date => FlightDate,
                          error_handling     => 'KEEP_UNCONVERTED') as Price,

      cast('EUR' as abap.cuky)                                      as CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied,

      @EndUserText.label: 'Seat Percentage'
      @EndUserText.quickInfo: 'Seat Percentage'
      cast(100 * (SeatsOccupied / SeatsMax) as abap.dec(16,2))      as SeatPercentage,

      _Booking
}
