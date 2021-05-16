trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
   List<Task> tlist = new List<Task>();
    
    for(Opportunity o : [SELECT Id, StageName FROM Opportunity WHERE Id IN :Trigger.New])
    {
        if(o.StageName == 'Closed Won')
        {
            Task t = new Task();
            t.Subject = 'Follow Up Test Task';
            t.WhatId = o.Id;
           tlist.add(t);
        }
        
    }
    insert tlist;
    
}