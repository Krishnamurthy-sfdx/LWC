public class ExampleDML {
    
    public static void insertAccount(){
        Account acct = new Account(Name='Acme', Phone='(415)555-1212', NumberOfEmployees=100);
        // Insert the account by using DML
        insert acct;
        ID AcctId = acct.Id;
        System.debug('acct.Id ' + AcctId);
    }
    
    public static void insertContact()
    {
        List<Contact> conList = new List<Contact> {
            new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
                new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
                new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
                new Contact(FirstName='Kim',LastName='Shain',Department='Education')};
                    
                    
                    insert conList;    
        List<Contact> listToUpdate = new List<Contact>();
        // Iterate through the list and add a title only
        //   if the department is Finance
        for(Contact con : conList) {
            if (con.Department == 'Finance') {
                con.Title = 'Financial analyst';
                // Add updated contact sObject to the list.
                listToUpdate.add(con);
            }
        }
        // Bulk update all contacts with one DML call
        update listToUpdate;
    }
    
    
    public static void upsertContact()
    {
        Contact josh = new Contact(FirstName = 'Josh');
        insert josh;
        
        List<Contact> newContact = new List<Contact>{ Josh };
            upsert newContact;
    }
    
    public static void upsertContact2(){
        Contact jane = new Contact(FirstName='Jane',
                                   LastName='Smith',
                                   Email='jane.smith@example.com',
                                   Description='Contact of the day');
        insert jane;
        // 1. Upsert using an idLookup field
        // Create a second sObject variable.
        // This variable doesn’t have any ID set.
        Contact jane2 = new Contact(FirstName='Jane',
                                    LastName='Smith',  
                                    Email='jane.smith@example.com',
                                    Description='Prefers to be contacted by email.');
        // Upsert the contact by using the idLookup field for matching.
        upsert jane2 Contact.fields.Email;
        // Verify that the contact has been updated
        System.assertEquals('Prefers to be contacted by email.',
                            [SELECT Description FROM Contact WHERE Id=:jane.Id].Description);
        
    }
    
    public static void deleteContact(){
        List<Contact> contactsDel = [SELECT Id FROM Contact WHERE LastName='Smith']; 
        delete contactsDel;
    }
    public static void DMLException(){
        try {
            // This causes an exception because 
            //   the required Name field is not provided.
            Account acct = new Account();
            // Insert the account 
            insert acct;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' +
                         e.getMessage());
        }
    }
}