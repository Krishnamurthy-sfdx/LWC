public class ContactController {
    @AuraEnabled(cacheable = true)
    public static List<Contact> getAllContacts(String someName) {
         
            String key =  someName;
            
                return [SELECT Id, LastName, Phone FROM Contact WHERE LastName = :key LIMIT 10];
            
            
    }}