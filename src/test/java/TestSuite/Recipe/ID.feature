Feature: Test for all that need ID

  Background:
    * url 'https://api.spoonacular.com/recipes/'
    * def apiKey = '6686dd16d9484d769565cf2c81657d92'
    * def username = 'brendamelly'
    * def hash = '4ecff4eaeaa41935467f4a6bd7ddb456ff1eb061'
    * def id = '1003464'

  Scenario: Taste by ID
    Given path id,'tasteWidget.json'
    And param apiKey = apiKey
    And param normalize = 'false'
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Equipment by ID
    Given path id,'equipmentWidget.json'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Price Breakdown by ID
    Given path id,'priceBreakdownWidget.json'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Ingredients by ID
    Given path id,'ingredientWidget.json'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Nutrition by ID
    Given path id,'nutritionWidget.json'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'response: ', response