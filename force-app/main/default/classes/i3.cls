public class i3 {
    
    public Id recordId {get;set;}
    public list<Contact> icon {get;set;}
    public Account ilist {get;set;}
    
    
    public i3(ApexPages.StandardController controller){
        recordId = controller.getRecord().Id;
        
        ilist =  [SELECT Id, Name, Description
                  FROM Account WHERE Id =: recordId];
        
        
        
        
    }
    
    
    public PageReference save() {
        
        Account ac = new account();
        ac.Name = ilist.Name;
        ac.Description = ilist.Description;
        insert ac;
        
        
        List<Contact> newCon = new List<Contact>();
        icon = [Select Id, LastName ,Account.Id FROM Contact WHERE Account.Id =:recordId];
        system.debug('icon ' + icon);
        for(Contact a : icon)
        {
            Contact b = new Contact();
            b.AccountId = ac.Id;
            b.LastName = a.LastName;
            newCon.add(b);
        }
        
        insert newCon; 
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM, 'Success')); 
        return null;
        
    }
    
    
    
    
}