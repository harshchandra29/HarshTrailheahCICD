public class AnimalLocator 
{
	public static String getAnimalNameById(Integer id)
    {
        String strEndpint = 'https://th-apex-http-callout.herokuapp.com/animals/'+id;
        String strReturn = '';
        system.debug('--------strEndpint------'+strEndpint);
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(strEndpint);
        req.setMethod('GET');
		
        HttpResponse res = http.send(req);
        system.debug('------res---1--'+res.getBody());
        
        //if (res.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            //Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            
            jsonOutput results = (jsonOutput) JSON.deserialize(res.getBody(), jsonOutput.class);
        //Object results = (Object) map_results.get('animal');
		system.debug('results= ' + results.animal.name);
        return(results.animal.name);
            
           
        //}
        //else
          //  return '';
        
    }
    public class cls_animal {
		public Integer id;	
		public String name;	
		public String eats;	
		public String says;	
	}
    public class JSONOutput{
	public cls_animal animal;

   	
	}
}