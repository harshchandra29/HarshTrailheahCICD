trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) 
{
    Set<Id> oppId = new Set<Id>();
    List<Task> lstTask = new List<Task>();
    if(trigger.isAfter)
    {
        for(Opportunity objOpp : Trigger.new)
        {
            if(objOpp.StageName=='Closed Won' && trigger.isUpdate && objOpp.StageName != trigger.oldMap.get(objOpp.Id).StageName)
                oppId.add(objOpp.Id);
            else if(objOpp.StageName=='Closed Won' && trigger.isInsert)
                oppId.add(objOpp.Id);
        }

        if(!oppId.isEmpty())
        {
            for(Id objOppId : oppId)
            {
                Task objTask = new Task();
                objTask.WhatId = objOppId;
                objTask.Subject = 'Follow Up Test Task';
                lstTask.add(objTask);
            }
        }

        if(!lstTask.isEmpty())
            insert lstTask;
    }
}