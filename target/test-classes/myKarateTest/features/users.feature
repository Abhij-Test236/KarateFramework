@usersCRUD
Feature: CRUD Operations

  Background:
    * url 'https://reqres.in/'

  Scenario: CRUD Operations 
  
################### Post Request ######################
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
    
    
    #* def id = response.id
    
################ GET Request #########################
    
    * def id = 7
      
   	Given path '/api/users/'+id
   	* header x-api-key = 'reqres-free-v1'
   	When method get
    Then status 200
    Then assert response.data.first_name == "Michael"
   	

############### PUT Request ##########################
  
    Given path 'api/users/'+id
    * header x-api-key = 'reqres-free-v1'
    And request
    """
      {
 		   "name": "Abhishek",
    	 "job": "QE leader"
			}
      """
    When method put
    Then status 200
    Then match response.name == "Abhishek"
    
############### PATCH Request ##########################
  
    Given path 'api/users/'+id
    * header x-api-key = 'reqres-free-v1'
    And request
    """
      {
 		   "name": "Abhishek2",
    	 "job": "QE leader2"
			}
      """
    When method patch
    Then status 200
    Then assert response.name == "Abhishek2"
    
################ DELETE Request ##########################

		* def id = 5
		
		Given path 'api/users/'+id
    * header x-api-key = 'reqres-free-v1'
    When method delete
    Then status 204


  