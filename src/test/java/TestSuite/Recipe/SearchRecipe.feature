Feature: Test Search Recipe

  Background:
    * url 'https://api.spoonacular.com/recipes/'
    * def apiKey = '6686dd16d9484d769565cf2c81657d92'
    * def username = 'brendamelly'
    * def hash = '4ecff4eaeaa41935467f4a6bd7ddb456ff1eb061'


  Scenario: complex search
    Given path '/complexSearch'
    And param apiKey = apiKey
    And param query = 'pasta'
    And param maxFat = '25'
    And param number = '2'
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Search by Nutrients
    Given path '/findByNutrients'
    And param apiKey = apiKey
    And param minCarbs = '10'
    And param maxCarbs = '50'
    And param number = '2'
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Search by Ingredients
    Given path '/findByIngredients'
    And param apiKey = apiKey
    And param ingredients = 'apples,+flour,+sugar'
    And param number = '2'
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Search by Ingredients
    Given path '/findByIngredients'
    And param apiKey = apiKey
    And param ingredients = 'apples,+flour,+sugar'
    And param number = '2'
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Autocomplete Recipe Search
    Given path '/autocomplete'
    And param apiKey = apiKey
    And param query = 'burger'
    And param number = '10'
    When method get
    Then status 200
    And print 'response: ', response