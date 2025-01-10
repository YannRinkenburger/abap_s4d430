@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 3: Literals and Cases'

define view entity Z_01_Demo3 as select from /dmo/travel
{ 
  key travel_id as TravelId,
  status as Status
}
