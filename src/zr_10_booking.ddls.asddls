@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'
define view entity ZR_10_BOOKING
  as select from /dmo/booking_m

{
  key travel_id     as TravelId,
  key booking_id    as BookingId,

      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
      last_changed_at as LastChangedAt,
      booking_status as BookingStatus
}
