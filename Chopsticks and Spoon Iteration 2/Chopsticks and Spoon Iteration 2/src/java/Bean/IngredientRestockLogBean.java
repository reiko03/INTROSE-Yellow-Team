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
public class IngredientRestockLogBean {
    private int i_restock_id;
    private int i_restock_userid;
    private int i_restock_ingredientid;
    private double restock_weight;
    private double restock_cost;
    private String restock_datetime;
    private String restock_source;
    private String restock_username;
    private String restock_ingredientname;

    public int getI_restock_id() {
        return i_restock_id;
    }

    public int getI_restock_ingredientid() {
        return i_restock_ingredientid;
    }

    

    public int getI_restock_userid() {
        return i_restock_userid;
    }

    public double getRestock_cost() {
        return restock_cost;
    }

    public String getRestock_datetime() {
        return restock_datetime;
    }

    public String getRestock_source() {
        return restock_source;
    }

    public double getRestock_weight() {
        return restock_weight;
    }

    public String getRestock_username() {
        return restock_username;
    }

    public String getRestock_ingredientname() {
        return restock_ingredientname;
    }

    public void setRestock_ingredientname(String restock_ingredientname) {
        this.restock_ingredientname = restock_ingredientname;
    }

    public void setRestock_username(String restock_username) {
        this.restock_username = restock_username;
    }
    
    
    public void setI_restock_id(int i_restock_id) {
        this.i_restock_id = i_restock_id;
    }

    public void setI_restock_ingredientid(int i_restock_ingredientid) {
        this.i_restock_ingredientid = i_restock_ingredientid;
    }

    

    public void setI_restock_userid(int i_restock_userid) {
        this.i_restock_userid = i_restock_userid;
    }

    public void setRestock_cost(double restock_cost) {
        this.restock_cost = restock_cost;
    }

    public void setRestock_datetime(String restock_datetime) {
        this.restock_datetime = restock_datetime;
    }

    public void setRestock_source(String restock_source) {
        this.restock_source = restock_source;
    }

    public void setRestock_weight(double restock_weight) {
        this.restock_weight = restock_weight;
    }
    
    
    
}
