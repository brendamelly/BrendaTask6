Feature: Test Analyzed And others

  Background:
    * url 'https://api.spoonacular.com/recipes/'
    * def apiKey = '6686dd16d9484d769565cf2c81657d92'
    * def username = 'brendamelly'
    * def hash = '4ecff4eaeaa41935467f4a6bd7ddb456ff1eb061'
    * def id = '324694'

  Scenario: Get Analyzed Recipe Instructions
    Given path id,'analyzedInstructions'
    And param apiKey = apiKey
    And param stepBreakdown = 'true'
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Extract Recipe from Website
    Given path '/extract'
    And param apiKey = apiKey
    And param url = 'https://foodista.com/recipe/ZHK4KPB6/chocolate-crinkle-cookies'
    And param forceExtraction = 'true'
    And param analyze = 'false'
    And param includeNutrition = 'false'
    And param includeTaste = 'false'
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Analyze Recipe
    Given path '/analyze'
    And param apiKey = apiKey
    And param language = 'en'
    And param includeNutrition = 'false'
    And param includeTaste = 'false'
    And request
    """
        {
        "title": "Spaghetti Carbonara",
        "servings": 2,
        "ingredients": [
            "1 lb spaghetti",
            "3.5 oz pancetta",
            "2 Tbsps olive oil",
            "1  egg",
            "0.5 cup parmesan cheese"
        ],
        "instructions": "Bring a large pot of water to a boil and season generously with salt. Add the pasta to the water once boiling and cook until al dente. Reserve 2 cups of cooking water and drain the pasta. "
    }
    """
    When method post
    Then status 200
    And print 'response: ', response

  Scenario: Summarize Recipe
    Given path id,'summary'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Analyze Recipe Instructions
    Given path '/analyzeInstructions'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And param apiKey = apiKey
    And param instructions = 'Put the garlic in a pan and then add the onion. Add some salt and oregano.'
    When method post
    Then status 200
    And print 'response: ', response

  Scenario: Classify Cuisine
    Given path '/cuisine'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And param apiKey = apiKey
    And param title = 'Pork roast with green beans'
    And param ingredientList = '3 oz pork shoulder'
    And param language = 'en'
    When method post
    Then status 200
    And print 'response: ', response

  Scenario: Analyze a Recipe Search Query
    Given path '/queries/analyze'
    And param apiKey = apiKey
    And param q = 'salmon with fusilli and no nuts'
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Guess Nutrition by Dish Name
    Given path '/guessNutrition'
    And param apiKey = apiKey
    And param title = 'Spaghetti Aglio et Olio'
    When method get
    Then status 200
    And print 'response: ', response