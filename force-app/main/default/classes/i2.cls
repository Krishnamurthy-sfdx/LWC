public class i2{
    public Invoice__c acc{get;set;}
    public Invoice_Line_Item__c abb{get;set;}
    
    public i2(){
        acc = new Invoice__c();
        abb = new Invoice_Line_Item__c();
    }
    
    public void save(){  
        if(acc.Password__c == 'Cleantechsolarpv')
        {
        
        
        insert acc;
        if(acc.Id != null)
        {
        abb.Invoice__c = acc.Id;
        }
        insert abb;
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Record Inserted Successfully'));
        }
        else
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Password is incorrect'));   
    }
}