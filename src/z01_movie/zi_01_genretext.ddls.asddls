@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: '-'

define view entity ZI_01_GenreText
  as select from ZI_01_GenreVH

{
  key domain_name,
  key value_position,
  key language,

      Genre,
      GenreText
}
