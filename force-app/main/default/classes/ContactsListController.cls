public class ContactsListController {
    
    public List<Contact> cleList{get;set;}

    public ContactsListController(){
      cleList = [SELECT FirstName, LastName, Title, Email FROM Contact];  
    
}

}