public class invoiceController {
	
    public String sortOrder = 'Name';
    public String order = 'ASC';
    public List<Invoice__c> getInvoice(){
        
        List<Invoice__c> InvoiceList = Database.query('SELECT Name, Total_Amount__c FROM Invoice__c ORDER BY ' + sortOrder  +  ' '+ order );
        return InvoiceList;
    }
    public void methodOne(){
        this.sortOrder = 'Name';
        this.order = 'DESC';
    }
    
    
}