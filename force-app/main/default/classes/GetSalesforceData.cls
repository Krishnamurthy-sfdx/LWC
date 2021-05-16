public with sharing class GetSalesforceData {
    
    
    public static List<Opportunity> oppList{get;set;}

    @AuraEnabled(cacheable = true)
    public static List<Opportunity> getOpportunity(){
        oppList = [SELECT Id, Name, StageName, CloseDate FROM Opportunity LIMIT 10];
        return oppList;
    }
}