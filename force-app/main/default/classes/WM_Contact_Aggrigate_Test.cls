@isTest
public class WM_Contact_Aggrigate_Test {
    static testmethod void testparent(){
      WM_Account__c wmacc=new WM_Account__c();
        wmacc.Max_Amount__c=300;
        wmacc.Max_Amount__c=150;
        wmacc.Avg_Amount__c=150;
        wmacc.No_of_Child_Count__c=2;
        insert wmacc;
        
        WM_Contact__c wmcon=new WM_Contact__c();
        wmcon.Amount__c=150;
        wmcon.WMAccount__c=wmacc.Id;
        insert wmcon;
        
        WM_Contact__c wmcons=new WM_Contact__c();
        wmcons.Amount__c=300;
        wmcons.WMAccount__c=wmacc.Id;
        insert wmcons;
       
       
          
    }

}