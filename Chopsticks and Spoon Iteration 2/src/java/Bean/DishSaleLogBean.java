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
public class DishSaleLogBean {
    private int d_sale_id;
    private int sale_userid;
    private int sale_dishid;
    private double sale_cost;
    private double sale_price;
    private String sale_datetime;
    private int sale_order;

    public int getD_sale_id() {
        return d_sale_id;
    }

    public double getSale_cost() {
        return sale_cost;
    }

    public String getSale_datetime() {
        return sale_datetime;
    }

    public int getSale_dishid() {
        return sale_dishid;
    }

    public int getSale_order() {
        return sale_order;
    }

    public double getSale_price() {
        return sale_price;
    }

    public int getSale_userid() {
        return sale_userid;
    }

    public void setD_sale_id(int d_sale_id) {
        this.d_sale_id = d_sale_id;
    }

    public void setSale_cost(double sale_cost) {
        this.sale_cost = sale_cost;
    }

    public void setSale_datetime(String sale_datetime) {
        this.sale_datetime = sale_datetime;
    }

    public void setSale_dishid(int sale_dishid) {
        this.sale_dishid = sale_dishid;
    }

    public void setSale_order(int sale_order) {
        this.sale_order = sale_order;
    }

    public void setSale_price(double sale_price) {
        this.sale_price = sale_price;
    }

    public void setSale_userid(int sale_userid) {
        this.sale_userid = sale_userid;
    }
    
    
}
