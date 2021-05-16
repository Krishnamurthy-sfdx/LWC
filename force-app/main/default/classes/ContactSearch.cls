public class ContactSearch {

    
    public static List<Contact> searchForContacts(String con1, String con2)
    {
       List<Contact> newContact = [SELECT Id, LastName, MailingPostalCode FROM Contact WHERE LastName=:con1 AND MailingPostalCode=:con2];
    	return newContact;
    }
    
}