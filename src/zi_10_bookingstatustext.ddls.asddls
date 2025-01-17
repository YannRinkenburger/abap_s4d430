@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

define view entity ZI_10_BookingStatusText
  as select from ZI_10_BookingStatusVH

{
  key domain_name,
  key value_position,
  key language,

      BookingStatus,
      BookingStatusText
}
