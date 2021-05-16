@isTest
public class TestInvoiceLineItem {

    @isTest static void InvoiceLineItemMethod()
    {
      List<Invoice__c> newInvoice = new List<Invoice__c>();
      {
      	for(Integer i =0; i<=200;i++)
      	{
         newInvoice.add(new Invoice__c(
     	 Name = 'TestClass'+ i,
      	 Total_Amount__c = 0
      	));
        }
      }
      insert newInvoice;
      
      List<Invoice_Line_Item__c> IlineItem = new List<Invoice_Line_Item__c>();
	  for(Integer j=0; j<=200;j++)
      {
      IlineItem.add(new Invoice_Line_Item__c(
      Invoice__c = newInvoice[j].Id,
      Price__c = 5000,
      Name = 'Krishna'+j
          ));
      }
      insert IlineItem; 
        
  
        
    }
    
   
    
}