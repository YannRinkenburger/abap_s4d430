@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Customer KPIS'

define view entity ZI_01_CustomerKPIs
  as select from ZI_01_TRAVELWITHCUSTOMER

{
  key CustomerId,

      CustomerName,
      Street,
      PostalCode,
      City,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(TotalPrice + BookingFee)  as TotalRevenue,

      CurrencyCode,
      avg(Duration as abap.dec(16)) as AverageDuration,
      count(distinct AgencyId)      as NumberOfDifferentAgencys
}

group by CustomerId,
         CustomerName,
         Street,
         PostalCode,
         City,
         CurrencyCode

having sum(TotalPrice + BookingFee) >= 5000
