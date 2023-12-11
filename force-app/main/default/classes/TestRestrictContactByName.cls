@isTest
public class TestRestrictContactByName 
{
    static testMethod void  TestRestrictContactByName() 
    {
        Contact c = new Contact();
        c.LastName = 'INVALIDNAME';
        insert c;
    }
}