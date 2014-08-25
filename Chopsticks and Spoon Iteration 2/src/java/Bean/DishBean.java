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
public class DishBean {
    private int dish_id;
    private String dish_name;
    private double dish_cost;
    private double dish_price;

    public double getDish_cost() {
        return dish_cost;
    }

    public int getDish_id() {
        return dish_id;
    }

    public String getDish_name() {
        return dish_name;
    }

    public double getDish_price() {
        return dish_price;
    }

    public void setDish_cost(double dish_cost) {
        this.dish_cost = dish_cost;
    }

    public void setDish_id(int dish_id) {
        this.dish_id = dish_id;
    }

    public void setDish_name(String dish_name) {
        this.dish_name = dish_name;
    }

    public void setDish_price(double dish_price) {
        this.dish_price = dish_price;
    }
    
    
}
