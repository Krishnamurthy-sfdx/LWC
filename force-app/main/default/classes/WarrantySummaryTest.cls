@isTest
private class WarrantySummaryTest {
    
    @isTest static void createCase(){
        Case myCase = new Case();
        myCase.Product_Has_Extended_Warranty_c__c = true;
        myCase.Product_Purchase_Date_c__c = date.today();
        myCase.Product_Total_Warranty_Days_c__c = 3;
        insert myCase;
    }
}