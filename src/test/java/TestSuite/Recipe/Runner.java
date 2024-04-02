package TestSuite.Recipe;

import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    public Karate runRecipeSearch(){

        return Karate.run("SearchRecipe").relativeTo((getClass()));
    }
    @Karate.Test
    public Karate runGetRecipe(){

        return Karate.run("GetRecipe").relativeTo((getClass()));
    }
    @Karate.Test
    public Karate runID(){

        return Karate.run("ID").relativeTo((getClass()));
    }
    @Karate.Test
    public Karate runAnalyzedAndothers(){

        return Karate.run("AnalyzedAndothers").relativeTo((getClass()));
    }
}
