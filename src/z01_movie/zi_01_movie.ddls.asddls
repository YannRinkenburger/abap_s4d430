@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

define root view entity ZI_01_Movie
  as select from ZR_01_Movie

  association [0..1] to ZI_01_AVG_RATING as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
  composition [0..*] of ZI_01_Rating as _Ratings

{
  key MovieUuid,

      Title,
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      _AverageRating.AverageRating as AverageRating,

      case when $projection.AverageRating > 6.7 then 3
           when $projection.AverageRating > 3.4 then 2
           when $projection.AverageRating > 0 then 1
           else 0
      end                          as AverageRatingCriticality,

      _Ratings
}
