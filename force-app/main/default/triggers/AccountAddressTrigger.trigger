trigger AccountAddressTrigger on Account (before insert, before update) 
{
    if(trigger.isbefore)
    {
        for(Account objAcc : trigger.new)
        {
            if(objAcc.Match_Billing_Address__c)
                objAcc.ShippingPostalCode = objAcc.BillingPostalcode;
        }
    }
}