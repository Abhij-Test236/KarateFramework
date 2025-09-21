Feature: Karate Match and #(variable) examples

  Background:
    * def baseUrl = 'https://jsonplaceholder.typicode.com'
    * def userId = 1
    * def expectedName = 'Leanne Graham'
    * def expectedEmail = 'Sincere@april.biz'
    * def expectedCompany = { name: 'Romaguera-Crona' }

  Scenario: Validate user response with different match styles
    Given url baseUrl
    And path 'users', userId
    When method get
    Then status 200

    # Exact field match using variable substitution #(var)
    And match response.name == #(expectedName)
    And match response.email == #(expectedEmail)

    # Partial object validation (subset match)
    And match response contains { id: #(userId), name: #(expectedName) }

    # Nested object validation
    And match response.company contains expectedCompany

    # Validate response has keys
    And match response ==
      {
        id: 1,
        name: '#(expectedName)',
        username: '#string',
        email: '#(expectedEmail)',
        address: '#object',
        phone: '#string',
        website: '#string',
        company: '#object'
      }

  Scenario: Validate list of users
    Given url baseUrl
    And path 'users'
    When method get
    Then status 200

    # Response is an array
    And match response == '#[10]'   # exactly 10 users

    # Each item must have id and email
    And match each response contains { id: '#number', email: '#string' }

    # Response should contain a specific user
    And match response contains { id: 1, name: #(expectedName) }
