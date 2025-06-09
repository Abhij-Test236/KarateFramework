@callingFeature
Feature: Calling Feature files Test

  Background:
    * url 'https://reqres.in/'

  Scenario: Calling Feature files Test 
  
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
    Then match response.name == "Abhishek"
    
    * def input = response 
    
    
    #### calling another feature file with previous API call response and giving for PUT request
    
    * def featureCall =  call read('classpath:myKarateTest/features/callingFeatureTest2.feature') input
    * print 'Feature Call reponse',featureCall
    
    
    
    