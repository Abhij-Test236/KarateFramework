@JavaInterOpTest

Feature: Test Java Inter Op 

  Background:
    * url 'https://reqres.in/'

	Scenario: Test Java Inter Op 
		* def user =
      """
      {
 		   "name": "Abhishek",
    	 "job": "leader"
			}
      """
    Given path 'api/users'
    * header x-api-key = 'reqres-free-v1'
    And request user
    When method post
    Then status 201
    

################# Java method call ######################
    
    * def javaCall =
  	"""
  	function(jsonResponse) {
    	var JavaDemo = Java.type('myKarateTest.utils.JavaDemo');
    	var jd = new JavaDemo();
    	var jr = JSON.stringify(jsonResponse);
    	return jd.fetchName(jr);  
  	}
  	"""
  	
		* def result = javaCall(response)
		* print result
		* assert result == "Abhishek Jaiswal"