@JSfunctiontTest

Feature: Test JS function calls

  Background:
    * url 'https://reqres.in/'

	Scenario: Test JS function calls
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
    
######### JS function call with single JSON parameter#########

    * def jsfunc =
    """
    function(arg) {
    	var name = arg.name + " Jaiswal";
    	return name; 
    }
    """    
    * def temp1 = call jsfunc response
    * print 'Value after JS function1 call is ', temp1
    * assert temp1 == "Abhishek Jaiswal"
    
######### JS function call with mutiple parameter
    
    * def adder = function(a, b){ return a + " " + b }
    * def temp = adder(response.name, response.job)
    * print 'Value after JS function2 call is ', temp
    * assert temp == "Abhishek leader"
    

    
    