public with sharing class AccountController {

    //account controller class
    @AuraEnabled(cacheable = true)
    public static List<Account> getAccounts()
    {
            return [SELECT Id, Name, Industry, Rating, Website, AnnualRevenue FROM Account LIMIT 25];
    }

    
  
}