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
public class IngredientBean {
    private int ingredient_id;
    private String ingredient_name;
    private double ingredient_weight;
    private double ingredient_cost;
    private int ingredient_threshold;

    public double getIngredient_cost() {
        return ingredient_cost;
    }

    public int getIngredient_id() {
        return ingredient_id;
    }

    public String getIngredient_name() {
        return ingredient_name;
    }

    public int getIngredient_threshold() {
        return ingredient_threshold;
    }

    public double getIngredient_weight() {
        return ingredient_weight;
    }

    public void setIngredient_cost(double ingredient_cost) {
        this.ingredient_cost = ingredient_cost;
    }

    public void setIngredient_id(int ingredient_id) {
        this.ingredient_id = ingredient_id;
    }

    public void setIngredient_name(String ingredient_name) {
        this.ingredient_name = ingredient_name;
    }

    public void setIngredient_threshold(int ingredient_threshold) {
        this.ingredient_threshold = ingredient_threshold;
    }

    public void setIngredient_weight(double ingredient_weight) {
        this.ingredient_weight = ingredient_weight;
    }
    
    
}
