public without sharing class CaseController {
    @AuraEnabled(cacheable = true)
    public static List<Case> getAllCases() {
        return [SELECT Id, Subject, Reason, Description FROM Case WHERE CreatedDate = LAST_N_DAYS:7];
    }
}
