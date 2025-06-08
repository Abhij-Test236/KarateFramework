@graphQLTest
Feature: GraphQL Test

  Background:
    * url 'https://countries.trevorblades.com'

  Scenario: GraphQL Testcase
  	
    Given path '/'
    * text query =
    """
    {
  		countries {
    		code
    		name
    		emoji
  		}
		}
    """
    And request { query: "#(query)"}
    When method POST
    Then status 200
    And assert response.data.countries[8].name == "Antarctica" 
