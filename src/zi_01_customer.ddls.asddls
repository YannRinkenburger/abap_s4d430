@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer View'

define view entity ZI_01_Customer as select from /dmo/customer
{
  key customer_id as CustomerId,
  first_name as FirstName,
  last_name as LastName,
  title as Title,
  street as Street,
  postal_code as PostalCode,
  city as City,
  country_code as CountryCode
}