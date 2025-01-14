@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_01_Rating
  as select from ZR_01_Rating

  association to parent ZI_01_Movie as _Movie on $projection.MovieUuid = _Movie.MovieUuid

{
  key RatingUuid,

      MovieUuid,
      UserName,
      Rating,
      RatingDate,

      _Movie 
}
