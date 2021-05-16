trigger WarrantySummary on Case (before insert) {
    for(Case myCase : Trigger.new){
        //set up variables
        Date purchaseDate           = myCase.Product_Purchase_Date_c__c;
        DateTime createdDate        = DateTime.now();
        Decimal warrantyDays        = myCase.Product_Total_Warranty_Days_c__c; // Number field in SF is decimal
        Decimal warrantyPercentage  = purchaseDate.daysBetween(Date.today())/warrantyDays;
        Boolean hasExtendedWarranty = myCase.Has_Extended_Warranty__c;
        
        
        myCase.warranty_Summary_c__c = 'Product purchased on' + purchaseDate
                                        + ' '+   'and case created on' + createdDate + '.\n';
    }
}