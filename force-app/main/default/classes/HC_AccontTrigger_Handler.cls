public with sharing class HC_AccontTrigger_Handler {
    public HC_AccontTrigger_Handler() {}

        public static void onInsertUpdate(List<Account> lstAccount)
        {
            for(Account objAcc : lstAccount)
            {
                if(String.isBlank(objAcc.AccountNumber))
                    objAcc.AccountNumber = objAcc.Name+' 123-123';
            }
        

    }
}