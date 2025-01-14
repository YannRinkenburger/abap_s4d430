@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

@Metadata.allowExtensions: true
define view entity ZC_01_Rating
  as projection on ZI_01_Rating

{
  key RatingUuid,

      MovieUuid,
      UserName,
      Rating,
      RatingDate,
      /* Associations */
      _Movie: redirected to parent ZC_01_Movie
}
