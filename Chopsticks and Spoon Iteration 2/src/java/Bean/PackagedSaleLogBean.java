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
public class PackagedSaleLogBean {
    private int p_sale_id;
    private int p_sale_userid;
    private int p_sale_packagedid;
    private double sale_cost;
    private double sale_price;
    private String sale_datetime;
    private int sale_order;

    public int getP_sale_id() {
        return p_sale_id;
    }

    public int getP_sale_packagedid() {
        return p_sale_packagedid;
    }

    public int getP_sale_userid() {
        return p_sale_userid;
    }

    public double getSale_cost() {
        return sale_cost;
    }

    public String getSale_datetime() {
        return sale_datetime;
    }

    public int getSale_order() {
        return sale_order;
    }

    public double getSale_price() {
        return sale_price;
    }

    public void setP_sale_id(int p_sale_id) {
        this.p_sale_id = p_sale_id;
    }

    public void setP_sale_packagedid(int p_sale_packagedid) {
        this.p_sale_packagedid = p_sale_packagedid;
    }

    public void setP_sale_userid(int p_sale_userid) {
        this.p_sale_userid = p_sale_userid;
    }

    public void setSale_cost(double sale_cost) {
        this.sale_cost = sale_cost;
    }

    public void setSale_datetime(String sale_datetime) {
        this.sale_datetime = sale_datetime;
    }

    public void setSale_order(int sale_order) {
        this.sale_order = sale_order;
    }

    public void setSale_price(double sale_price) {
        this.sale_price = sale_price;
    }
    
    
}
