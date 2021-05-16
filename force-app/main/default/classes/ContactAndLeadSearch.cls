public class ContactAndLeadSearch {

    public static List<List<sObject>> searchContactsandLeads (String name){
        
        Contact con = new Contact(LastName = 'Smith');
        Lead le = new Lead(LastName = 'Smith',Company= 'Some');
        insert con;
        insert le;
        List<List<sObject>> searchList = [FIND :name IN ALL FIELDS RETURNING Contact(FirstName, LastName),
                                          Lead(FirstName,LastName)];
        List<Contact> conList = searchList[0];
        List<Lead> leadList = searchList[1];
        
        for(Contact c : conlist){
            System.debug(c.LastName);
        }
        return searchList;
        
        
    }
}