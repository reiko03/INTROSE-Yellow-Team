/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean;

/**
 *
 * @author Keiko Nagano
 */
public class RecipeBean {
    private int dish_id;
    private int ingredient_id;
    private double recipe_weight;

    public double getRecipe_weight() {
        return recipe_weight;
    }

    public void setRecipe_weight(double recipe_weight) {
        this.recipe_weight = recipe_weight;
    }
    
    
}
