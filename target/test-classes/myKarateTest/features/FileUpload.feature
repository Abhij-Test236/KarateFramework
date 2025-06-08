@uploadTest
Feature: File Upload Test

  Background:
    * url 'https://filebin.net'

  Scenario: FileUpload Testcase 
  	
    Given path '/'
    And header Content-Type = "image/png"
    And header filename = 'test.png'
    And request karate.read('classpath:myKarateTest/resource/test.png')
    #And multipart file myFile = { read: 'classpath:myKarateTest/resource/test.png' , contentType: 'application/pdf'}
    When method POST
    Then status 201
