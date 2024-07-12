@AbapCatalog.sqlViewName: 'ZBUSI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zbusiness cds'
define view ZBUSINESS_CDS as select from zbusiness_tab
{
   
    key sr_no,
        co_code ,
        customer_code ,
        customer_name ,
        vendor_code ,
        vendor_name ,
        relation,
        
        related_co_code_cust_vend ,
        related_customer_code ,
        related_customer_name ,
        related_vendor_code ,
        related_vendor_name ,
        gl_code ,
        gl_description 

    
    
  
 
}
