/*public class AnimalLocator {
public static String getAnimalsNameById(Integer id) {
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();

        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        req.setMethod('GET');

        try {
            res = http.send(req);
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            if (results.containsKey('name')) {
                return (String) results.get('name');
            } else {
                return null;
            }
        } catch (System.CalloutException e) {
            System.debug('Callout error: ' + e);
            return null;
        }
    }


}

*/

public class AnimalLocator {
	public class cls_animal {
		public Integer id;	
		public String name;	
		public String eats;	
		public String says;	
	}    
public class JSONOutput{
	public cls_animal animal;

   	//public JSONOutput parse(String json){
	//return (JSONOutput) System.JSON.deserialize(json, JSONOutput.class);
	//}
}
    
    public static String getAnimalNameById (Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        //request.setHeader('id', String.valueof(id)); -- cannot be used in this challenge :)
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('response: ' + response.getBody());
        //Map<String,Object> map_results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
        jsonOutput results = (jsonOutput) JSON.deserialize(response.getBody(), jsonOutput.class);
        //Object results = (Object) map_results.get('animal');
		system.debug('results= ' + results.animal.name);
        return(results.animal.name);
    }

}

//added test at end

//eu test on stash  by 6: 01

// to check if any prior code is present or not



// ---------------------------------------------------------

this is in one file /// 2
