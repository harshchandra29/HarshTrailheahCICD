trigger HC_AccountTrigger on Account (before insert, before update) 
{
    

    if(trigger.isinsert || trigger.isupdate)
    {
        HC_AccontTrigger_Handler.onInsertUpdate(trigger.new);
    }

}