@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

define view entity ZI_01_GenreVH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name : 'ZABAP_GENRE')

{
      @UI.hidden: true
  key domain_name,

      @UI.hidden: true
  key value_position,

      @UI.hidden: true
  key language,

      @EndUserText.label: 'Genre'
      @EndUserText.quickInfo: 'Genre'
      value_low as Genre,

      @EndUserText.label: 'Genre Text'
      @EndUserText.quickInfo: 'Genre Text'
      text as GenreText
}
