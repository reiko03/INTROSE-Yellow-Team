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
public class PackagedRestockLogBean {
    private int p_restock_id;
    private int p_restock_userid;
    private int p_restock_packagedid;
    private int restock_quantity;
    private double restock_cost;
    private String restock_datetime;
    private String restock_source;

    public int getP_restock_id() {
        return p_restock_id;
    }

    public int getP_restock_packagedid() {
        return p_restock_packagedid;
    }

    public int getP_restock_userid() {
        return p_restock_userid;
    }

    public double getRestock_cost() {
        return restock_cost;
    }

    public String getRestock_datetime() {
        return restock_datetime;
    }

    public int getRestock_quantity() {
        return restock_quantity;
    }

    public String getRestock_source() {
        return restock_source;
    }

    public void setP_restock_id(int p_restock_id) {
        this.p_restock_id = p_restock_id;
    }

    public void setP_restock_packagedid(int p_restock_packagedid) {
        this.p_restock_packagedid = p_restock_packagedid;
    }

    public void setP_restock_userid(int p_restock_userid) {
        this.p_restock_userid = p_restock_userid;
    }

    public void setRestock_cost(double restock_cost) {
        this.restock_cost = restock_cost;
    }

    public void setRestock_datetime(String restock_datetime) {
        this.restock_datetime = restock_datetime;
    }

    public void setRestock_quantity(int restock_quantity) {
        this.restock_quantity = restock_quantity;
    }

    public void setRestock_source(String restock_source) {
        this.restock_source = restock_source;
    }
    
    
}
