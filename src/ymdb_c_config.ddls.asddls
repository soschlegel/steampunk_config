@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection view of config'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity YMDB_C_CONFIG
  as projection on YMDB_I_CONFIG as Config
{
      @UI.facet: [{ type: #IDENTIFICATION_REFERENCE, label: 'Keys', position: 0 }]

      @UI.lineItem: [{ position: 1 , importance: #HIGH }]

  key Uname,
      @UI.lineItem: [{ position: 10 }, { type: #FOR_ACTION, dataAction: 'create', label: 'Create'}]
      @UI.identification: [{ position: 0 }]
      @EndUserText.label: 'API KEY'
      ApiKey
}
