trigger WM_Contact_Aggrigate on WM_Contact__c (after insert,after update,after delete,after undelete) {
    list<WM_Account__c> wmAccountlist = new list<WM_Account__c>();
    set<ID> accIds = new set<ID>();
    map<id,integer> childCount= new map<id,integer>();
    map<id,Decimal> minAmount= new map<id,Decimal>();
    map<id,Decimal> maxAmount= new map<id,Decimal>();
    map<id,Decimal> avgAmount= new map<id,Decimal>();
    if(Trigger.isInsert||Trigger.isUpdate||Trigger.isUnDelete){ 
        for(WM_Contact__c con:Trigger.new){ 
            accIds.add(con.WMAccount__c);   
        } 
        system.debug('accIds:::::::'+accIds);
    }
    
    if(trigger.isdelete || trigger.isupdate)
    { 
        for(WM_Contact__c cons:Trigger.old){
            accIds.add(cons.WMAccount__c);  
        }
        system.debug('accIds::::::::::'+accIds);
    }
    List<AggregateResult> AggregateResultList = [select count(id) Total, WMAccount__c wmacc,Max(Amount__c) MaxAmount,Min(Amount__c) MinAmount,AVG(Amount__c) AvgAmount from WM_Contact__c where WMAccount__c in:accIds group by WMAccount__c];
    system.debug('AggregateResultList:::::::::'+AggregateResultList);
    if(AggregateResultList != null && AggregateResultList.size() > 0){ 
        for(AggregateResult aggr:AggregateResultList){ 
            minAmount.put((id)aggr.get('wmacc'),(Decimal)aggr.get('MinAmount'));
            maxAmount.put((id)aggr.get('wmacc'),(Decimal)aggr.get('MaxAmount'));
            avgAmount.put((id)aggr.get('wmacc'),(Decimal)aggr.get('AvgAmount'));
            childCount.put((id)aggr.get('wmacc'),(integer)aggr.get('Total'));
            
            
        }
        
        for(WM_Account__c acc:[select id,Name,Max_Amount__c,Min_Amount__c,Avg_Amount__c,No_of_Child_Count__c from WM_Account__c  where ID IN:accIds])
            
        {
            
            acc.Min_Amount__c = minAmount.get(acc.ID);
            acc.Max_Amount__c = maxAmount.get(acc.ID);
            acc.Avg_Amount__c = avgAmount.get(acc.ID);
            acc.No_of_Child_Count__c = ChildCount.get(acc.ID);
            wmAccountlist.add(acc);
            
        }
        try{
            update wmAccountlist;
        }
        Catch(Exception e){
            System.debug('Exception :'+e.getMessage());
        }
        
        
    } 
}