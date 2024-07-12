@AbapCatalog.sqlViewName: 'ZRELATED'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Party related cds'
define view ZFI_RELETED_CDS as select from ZBUSINESS_CDS as a 
left outer join I_OperationalAcctgDocItem  as b on //a.customer_code = b.Customer 
                                           //and a.vendor_code = b.Supplier
                                            a.co_code = b.CompanyCode 
                                           and a.gl_code = b.GLAccount
//                                           and a.related_co_code_cust_vend = b.
{

      @UI.lineItem         : [{position: 10}]
      @UI.identification   : [{position: 10}]
      @EndUserText.label   : 'Name of Related Party'
      @UI.selectionField   : [{position: 10}]
     key b.AccountingDocument as Related_Party,

      @UI.lineItem         : [{position: 20}]
      @UI.identification   : [{position: 20}]
      @EndUserText.label   : 'Related Company Code'
      @UI.selectionField   : [{position: 20}]
   key a.co_code as releted_com_code,
   
      
      @UI.lineItem         : [{position: 30}]
      @UI.identification   : [{position: 30}]
      @EndUserText.label   : 'Customer/vendor'
      @UI.selectionField   : [{position: 30}]
   a.customer_code ,
   
//      @UI.lineItem         : [{position: 50}]
//      @UI.identification   : [{position: 50}]
//      @EndUserText.label   : 'Vendor'
//      @UI.selectionField   : [{position: 50}]
//   a.vendor_code ,
   
      @UI.lineItem         : [{position: 40}]
      @UI.identification   : [{position: 40}]
      @EndUserText.label   : 'Company Code'
      @UI.selectionField   : [{position: 40}]
   a.related_co_code_cust_vend as name_of_releted_party,

   
      @UI.lineItem         : [{position: 50}]
      @UI.identification   : [{position: 50}]
      @EndUserText.label   : 'Customer Name'
      a.customer_name ,
   
//      @UI.lineItem         : [{position: 80}]
//      @UI.identification   : [{position: 80}]
//      @EndUserText.label   : 'Vendor Name'
//      a.vendor_name ,

      @UI.lineItem         : [{position: 60}]
      @UI.identification   : [{position: 60}]
      @EndUserText.label   : 'Document Type'
      b.AccountingDocumentType,
   
      @UI.lineItem         : [{position: 70}]
      @UI.identification   : [{position: 70}]
      @EndUserText.label   : 'Gl Code'
      a.gl_code ,
   
      @UI.lineItem         : [{position: 80}]
      @UI.identification   : [{position: 80}]
      @EndUserText.label   : 'Gl Description'
      a.gl_description ,
//   a.relation ,


      @UI.lineItem         : [{position: 90}]
      @UI.identification   : [{position: 90}]
      @EndUserText.label   : 'Amount'
      sum(b.AmountInTransactionCurrency) as amount,

      @UI.lineItem         : [{position: 100}]
      @UI.identification   : [{position: 100}]
      @EndUserText.label   : 'Currency'
      b.CompanyCodeCurrency,
      
        @UI.lineItem         : [{position: 110}]
      @UI.identification   : [{position: 110}]
      @EndUserText.label   : 'FiscalYear'
      @UI.selectionField   : [{position: 110}]
     b.FiscalYear
   


} where b.AccountingDocumentType = 'KR' or b.AccountingDocumentType = 'KZ' or b.AccountingDocumentType = 'KG' or b.AccountingDocumentType = 'RE'
or b.AccountingDocumentType = 'RV' or b.AccountingDocumentType = 'DR' or b.AccountingDocumentType = 'DZ' or b.AccountingDocumentType = 'DG' 
or b.AccountingDocumentType = 'SA' or b.AccountingDocumentType = 'AA'
group by
   a.co_code ,
   a.related_co_code_cust_vend,
   a.customer_code ,
   a.customer_name ,
   a.vendor_code ,
   a.vendor_name ,
   a.gl_code ,
   a.gl_description ,
   a.relation ,
   b.AccountingDocumentType,
   b.CompanyCodeCurrency,
   b.FiscalYear,
   b.AccountingDocument
