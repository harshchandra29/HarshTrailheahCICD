@isTest
public class AnimalLocatorTest {
    @isTest static  void testGetCallout() {
        //Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResourceNew');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        // Call method to test
        String result = AnimalLocator.getAnimalNameById(1);
        system.debug('-------res----'+result);
        // Verify mock response is not null
        System.assertNotEquals(null,result,
            'The callout returned a null response.');
                 
    }
    

}