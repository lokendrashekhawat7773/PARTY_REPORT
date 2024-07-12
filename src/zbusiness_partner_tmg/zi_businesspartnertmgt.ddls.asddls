@EndUserText.label: 'Business partner tmg tab'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZI_BusinessPartnerTmgT
  as select from zbusiness_tab
  association to parent ZI_BusinessPartnerTmgT_S as _BusinessPartnerTAll on $projection.SingletonID = _BusinessPartnerTAll.SingletonID
{
  key 
  sr_no as SrNo,
  co_code as CoCode,
  customer_code as CustomerCode,
  customer_name as CustomerName,
  vendor_code as VendorCode,
  vendor_name as VendorName,
  relation  as Relation ,
  related_co_code_cust_vend as Relatedcocodecustvend, 
  related_customer_code as RelatedCustomerCode ,
  related_customer_name as RelatedCustomerName,
  related_vendor_code  as RelatedVendorCode,
  related_vendor_name as RelatedVendorName,
  gl_code as GlCode,
  gl_description as GlDescription,
 
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  @Consumption.hidden: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  @Consumption.hidden: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Consumption.hidden: true
  1 as SingletonID,
  _BusinessPartnerTAll
  
}
