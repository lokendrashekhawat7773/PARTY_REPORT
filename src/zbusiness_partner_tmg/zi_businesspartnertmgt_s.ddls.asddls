@EndUserText.label: 'Business partner tmg tab Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZI_BusinessPartnerTmgT_S
  as select from I_Language
    left outer join ZBUSINESS_TAB on 0 = 0
  composition [0..*] of ZI_BusinessPartnerTmgT as _BusinessPartnerTmgT
{
  key 1 as SingletonID,
  _BusinessPartnerTmgT,
  max( ZBUSINESS_TAB.LOCAL_LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
