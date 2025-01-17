@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

define view entity ZI_10_BOOKING
  as select from ZR_10_BOOKING                         as Booking

    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name : '/DMO/BOOK_STATUS') as Status
      on  Booking.BookingStatus = Status.value_low
      and Status.language       = $session.system_language

  association to parent ZI_10_Flight as _Flight
    on  $projection.CarrierId    = _Flight.CarrierId
    and $projection.FlightDate   = _Flight.FlightDate
    and $projection.ConnectionId = _Flight.ConnectionId

{
  key Booking.TravelId,
  key Booking.BookingId,

      Booking.BookingDate,
      Booking.CustomerId,
      Booking.CarrierId,
      Booking.ConnectionId,
      Booking.FlightDate,
      Booking.FlightPrice,
      Booking.CurrencyCode,
      Booking.LastChangedAt,
      Status.text            as BookingStatus,

      _Flight
}
