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
public class PackagedBean {
    private int packaged_id;
    private String packaged_name;
    private int packaged_quantity;
    private double packaged_cost;
    private double packaged_price;
    private int packaged_threshold;

    public double getPackaged_cost() {
        return packaged_cost;
    }

    public int getPackaged_id() {
        return packaged_id;
    }

    public String getPackaged_name() {
        return packaged_name;
    }

    public double getPackaged_price() {
        return packaged_price;
    }

    public int getPackaged_quantity() {
        return packaged_quantity;
    }

    public int getPackaged_threshold() {
        return packaged_threshold;
    }

    public void setPackaged_cost(double packaged_cost) {
        this.packaged_cost = packaged_cost;
    }

    public void setPackaged_id(int packaged_id) {
        this.packaged_id = packaged_id;
    }

    public void setPackaged_name(String packaged_name) {
        this.packaged_name = packaged_name;
    }

    public void setPackaged_price(double packaged_price) {
        this.packaged_price = packaged_price;
    }

    public void setPackaged_quantity(int packaged_quantity) {
        this.packaged_quantity = packaged_quantity;
    }

    public void setPackaged_threshold(int packaged_threshold) {
        this.packaged_threshold = packaged_threshold;
    }
    
    
    
    
}
