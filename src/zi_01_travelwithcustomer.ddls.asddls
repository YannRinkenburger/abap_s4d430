@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel With Customer View'

define view entity ZI_01_TRAVELWITHCUSTOMER
  as select from ZI_01_Customer

    inner join   ZI_01_Travel
      on ZI_01_Customer.CustomerId = ZI_01_Travel.CustomerId

    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name : '/DMO/STATUS') as Status
      on ZI_01_Travel.Status = Status.value_low and Status.language = $session.system_language

{
  key ZI_01_Travel.TravelId,

      ZI_01_Travel.AgencyId,
      ZI_01_Travel.BeginDate,
      ZI_01_Travel.EndDate,
      dats_days_between(ZI_01_Travel.BeginDate, ZI_01_Travel.EndDate) + 1 as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => ZI_01_Travel.BookingFee,
                          source_currency    => ZI_01_Travel.CurrencyCode,
                          target_currency    => $projection.CurrencyCode,
                          exchange_rate_date => ZI_01_Travel.BeginDate,
                          error_handling     => 'KEEP_UNCONVERTED')       as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => ZI_01_Travel.TotalPrice,
                          source_currency    => ZI_01_Travel.CurrencyCode,
                          target_currency    => $projection.CurrencyCode,
                          exchange_rate_date => ZI_01_Travel.BeginDate,
                          error_handling     => 'KEEP_UNCONVERTED')       as TotalPrice,

      cast('EUR' as abap.cuky)                                            as CurrencyCode,
      ZI_01_Travel.Description,
      ZI_01_Travel.Status,
      Status.text as StatusText,
      ZI_01_Customer.CustomerId,

      case when ZI_01_Customer.Title = 'Mr.' or ZI_01_Customer.Title = 'Mrs.'
          then
            concat_with_space(ZI_01_Customer.Title,
                              concat_with_space(ZI_01_Customer.FirstName, ZI_01_Customer.LastName, 1),
                              1)
      else
        concat_with_space(ZI_01_Customer.FirstName, ZI_01_Customer.LastName, 1)
      end                                                                 as CustomerName,

      ZI_01_Customer.FirstName,
      ZI_01_Customer.LastName,
      ZI_01_Customer.Title,
      ZI_01_Customer.Street,
      ZI_01_Customer.PostalCode,
      ZI_01_Customer.City
}

where ZI_01_Customer.CountryCode = 'DE'
