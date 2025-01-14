@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

define view entity ZI_01_AVG_RATING
  as select from ZR_01_Rating

{
  key MovieUuid,

      @EndUserText.label: 'Average Rating'
      @EndUserText.quickInfo: 'Avergae Rating'
      avg(Rating as abap.dec(4,1)) as AverageRating
}

group by MovieUuid
