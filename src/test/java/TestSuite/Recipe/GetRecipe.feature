Feature: Test Get Recipe

  Background:
    * url 'https://api.spoonacular.com/recipes/'
    * def apiKey = '6686dd16d9484d769565cf2c81657d92'
    * def username = 'brendamelly'
    * def hash = '4ecff4eaeaa41935467f4a6bd7ddb456ff1eb061'
    * def id = '716429'

  Scenario: Get Recipe Information
    Given path id,'information'
    And param apiKey = apiKey
    And param includeNutrition = 'false'
    And param addWinePairing = 'false'
    And param addTasteData = 'false'
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Get Recipe Information
    Given path '/informationBulk'
    And param apiKey = apiKey
    And param ids = '715538,716429'
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Get Similar Recipes
    Given path id,'similar'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Get Random Recipes
    Given path 'random'
    And param apiKey = apiKey
    And param number = '1'
    And param include-tags = 'vegetarian,dessert'
    And param exclude-tags = 'dairy'
    When method get
    Then status 200
    And print 'response: ', response