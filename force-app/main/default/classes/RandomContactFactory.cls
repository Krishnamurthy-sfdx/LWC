public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer a, String b){
    
        List<Contact> ConList = new List<Contact>();
    
    	for(Integer i=0; i <a; i++)
        {
            Contact con = new Contact(FirstName = 'Test' + i );
            ConList.add(con);
        }
        
    return ConList;
    }}