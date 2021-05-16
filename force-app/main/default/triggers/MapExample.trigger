trigger MapExample on Invoice__c (before insert) {

    Map<Id, decimal> newMap = new Map<Id, decimal>();
    for(Invoice__c InvId : trigger.new)
    {
		newMap.put(InvId.Id, 5.0);
        System.debug(newMap.get(InvId.Id));
        System.debug(newMap.keySet());
    }
    
    
}