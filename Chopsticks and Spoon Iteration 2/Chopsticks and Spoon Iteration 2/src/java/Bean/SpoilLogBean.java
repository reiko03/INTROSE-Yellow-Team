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
public class SpoilLogBean {
    private int spoil_id;
    private int spoil_userid;
    private int spoil_ingredientid;
    private double spoil_weight;
    private String spoil_datetime;

    public String getSpoil_datetime() {
        return spoil_datetime;
    }

    public int getSpoil_id() {
        return spoil_id;
    }

    public int getSpoil_ingredientid() {
        return spoil_ingredientid;
    }

    public int getSpoil_userid() {
        return spoil_userid;
    }

    public double getSpoil_weight() {
        return spoil_weight;
    }

    public void setSpoil_datetime(String spoil_datetime) {
        this.spoil_datetime = spoil_datetime;
    }

    public void setSpoil_id(int spoil_id) {
        this.spoil_id = spoil_id;
    }

    public void setSpoil_ingredientid(int spoil_ingredientid) {
        this.spoil_ingredientid = spoil_ingredientid;
    }

    public void setSpoil_userid(int spoil_userid) {
        this.spoil_userid = spoil_userid;
    }

    public void setSpoil_weight(double spoil_weight) {
        this.spoil_weight = spoil_weight;
    }
    
    
}
