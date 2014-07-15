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
public class DishRecipeBean {
    private int dishrecipeID;
    private int itemID;
    private int dishID;

    public int getDishID() {
        return dishID;
    }

    public int getDishrecipeID() {
        return dishrecipeID;
    }

    public int getItemID() {
        return itemID;
    }

    public void setDishID(int dishID) {
        this.dishID = dishID;
    }

    public void setDishrecipeID(int dishrecipeID) {
        this.dishrecipeID = dishrecipeID;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
    }
    
    
}
