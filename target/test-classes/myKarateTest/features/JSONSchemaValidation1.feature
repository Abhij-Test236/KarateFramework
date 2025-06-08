@jsonvalidate1
Feature: JSON Schema Validation

	Scenario: Get a Single User and Verify its JSON Fields
		Given url 'https://reqres.in/api/users/2'
		* header x-api-key = 'reqres-free-v1'
		When method GET
		Then match response == '#object'
		* def jsonSchemaExpected = 
		"""
  	  {
    	"data": {
      	  "id": '#number',
        	"email": "#string",
        	"first_name": "#string",
        	"last_name": "#string",
        	"avatar": "#string"
    		},
    	"support": {
      	  "url": "#string",
        	"text": "#string"
    		}
			}
		"""
		* match response == jsonSchemaExpected   


	Scenario: Karate JSON Schema Verify
		* def responseData = 
		"""
    	{
      	 "id" : "#number",
       	 "name" : "#string"
    	}
		"""	
		* def jsonData = 
		"""
    	{
        "id" : 1,
        "name" : "Pramod"
    	}
		"""
		* match jsonData == responseData    


 	Scenario: Validate with the Third Party
    Given url 'https://reqres.in/api/users/2'
    * header x-api-key = 'reqres-free-v1'
    When method GET
    Then match response == '#object'
    * string jsonSchemaExpected = read('file:src/test/java/myKarateTest/resource/dataSchema.json')
    * string jsonData = response
    * assert jsonSchemaExpected == jsonData
    