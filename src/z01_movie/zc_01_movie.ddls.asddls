@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_01_Movie
  provider contract transactional_query
  as projection on ZI_01_Movie

{
  key MovieUuid,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_01_GenreVH', element: 'Genre' } } ]
      Genre,

      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      AverageRating,
      AverageRatingCriticality,

      _Ratings: redirected to composition child ZC_01_Rating
}
