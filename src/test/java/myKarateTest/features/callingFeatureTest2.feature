
Feature: Called Feature file

  Background:
    * url 'https://reqres.in/'

  Scenario: Called Feature file 
  
    * def id = 6
    
  	Given path 'api/users/'+id
    * header x-api-key = 'reqres-free-v1'
    And request { name: '#(name)', job: 'QE leader2' }
    When method put
    Then status 200
    Then assert response.name == "Abhishek"
    
    
    