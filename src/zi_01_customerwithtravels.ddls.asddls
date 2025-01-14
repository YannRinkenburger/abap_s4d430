@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer With Travels'

define view entity ZI_01_CustomerWithTravels
  as select from ZI_01_Customer

  association [0..*] to ZI_01_Travel as _Travels on $projection.CustomerId = _Travels.CustomerId

{
  key CustomerId,

      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,

      _Travels
}

where CountryCode = 'DE'
