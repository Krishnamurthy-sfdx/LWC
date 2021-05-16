public with sharing class ContactClone {


@AuraEnabled
public static void cloneContact(Id accountId){
    Account acc = [SELECT Id, Name FROM Account WHERE Id=:accountId];
    Account a = new Account();
    a.Name = acc.Name;
    insert a;
}


}