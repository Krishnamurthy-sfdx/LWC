public class AccountController {

    //account controller class
    @AuraEnabled(cacheable = true)
    public static List<Account> getAccounts(String recordId)
    {
           List<Account> acc = [SELECT Name, Industry, Rating, Website FROM Account WHERE Id = :recordId];
           return acc;
    }

    
  
}