public with sharing class AccountController {
    public static List<Account> getAllActiveAccounts() {
      return [SELECT Id, Name, Active__c FROM Account WHERE Active__c = 'Yes' WITH SECURITY_ENFORCED];
    }

    

    @AuraEnabled(cacheable=true)
    public static list<Contact> ContactLstFunct()
    {
        return [Select id, name, email from Contact];
    }

    @AuraEnabled(cacheable=true)
    public static list<Contact> ContactLstFunctParam(String strName)
    {
        return [Select id, name from Contact where name !=: strName];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactFromSearch(String strSearch){
      try {
          string tempInput = '%' + strSearch + '%';
          system.debug('----commit log---');
          return [select id, name, email from contact where Name like  : tempInput];
      } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
      }
    }
  }