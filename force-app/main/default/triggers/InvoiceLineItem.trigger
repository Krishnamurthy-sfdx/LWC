trigger InvoiceLineItem on Invoice_Line_Item__c (before insert,after insert) {
    
  
    List<Id> Parent = new List<Id>();
	    
    for(Invoice_Line_Item__c Ili : Trigger.new)
    {
        Parent.add(Ili.Invoice__c);
        System.debug(Ili.Invoice__c);
    }
    
    //List<Invoice__c> parentList = [SELECT Id, Total_Amount__c, (SELECT Id, Price__c FROM Invoice_line_item__r) FROM Invoice__c WHERE Id IN: Parent];
    //System.debug(parentList);
    Decimal Sum = 0;
    
    List<Invoice__c> parentlist = [SELECT Id, Total_Amount__c, (SELECT Id, Price__c FROM Invoice_line_item__r) FROM Invoice__c WHERE Id IN: Parent];
    for(Invoice__c parentrecnew : parentlist)
    {
        for(Invoice_Line_Item__c childsome : parentrecnew.Invoice_Line_Item__r)
    {
        Sum += childsome.Price__c;
        System.debug('Price__c ' +sum);
        parentrecnew.Total_Amount__c = sum;
        
    }
        Sum = 0;
        
    }
    update parentlist;
   
    
    //parentInvoice = [SELECT Id, Total_Amount__c 
								//	FROM Invoice__c WHERE Id IN: Parent];
    
   // for(Invoice__c parentrec: parentInvoice)
    //{
     //   parentrec.Total_Amount__c = sum;
       // System.debug('Total Amount '+ parentrec.Total_Amount__c);
    //}
    //update parentInvoice;  
}

// if(Trigger.isInsert || Trigger.isUpdate)
//  {

//List<Invoice_Line_Item__c> invList = [SELECT Id, Price__c FROM Invoice_Line_Item__c WHERE Invoice__c=: InvoiceMap.get(Invoice__c)];
//Decimal sum = 0;

//List<Invoice_Line_Item__c> LineItemList = [SELECT Id, Name, Price__c, Invoice__c, Invoice__r.Id FROM Invoice_Line_Item__c];


//for(Invoice_Line_Item__c invLine : LineItemList)
//for(Invoice__c invnew : Inv)
//if(invLine.Invoice__c == invnew.Id)

//sum += invLine.Price__c;
//Inv.Total_Amount__c = sum;
//System.debug('Price' + sum);
//System.debug('Total Amount' + invnew.Total_Amount__c);
//update invnew;
//update LineItemList;
//
//List<Invoice__c> Inv = [SELECT Id, Name, (SELECT Id, Price__c, Invoice__c FROM Invoice_Line_Item__r) FROM Invoice__c Where Id IN: LineItemList];

//for(Invoice__c parent : Inv)
//parent.Total_Amount__c = sum;
// update Inv;
//}

//} 
//test.Total_Amount__c = sum;
//update test;
//List<Invoice__c> inv = [SELECT Id, Name, Total_Amount__c FROM Invoice__c]