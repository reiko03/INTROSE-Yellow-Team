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
public class DamageLogBean {
    private int damage_id;
    private int damage_userid;
    private int damage_packagedid;
    private int damage_quantity;
    private String damage_datetime;

    public String getDamage_datetime() {
        return damage_datetime;
    }

    public int getDamage_id() {
        return damage_id;
    }

    public int getDamage_packagedid() {
        return damage_packagedid;
    }

    public int getDamage_quantity() {
        return damage_quantity;
    }

    public int getDamage_userid() {
        return damage_userid;
    }

    public void setDamage_datetime(String damage_datetime) {
        this.damage_datetime = damage_datetime;
    }

    public void setDamage_id(int damage_id) {
        this.damage_id = damage_id;
    }

    public void setDamage_packagedid(int damage_packagedid) {
        this.damage_packagedid = damage_packagedid;
    }

    public void setDamage_quantity(int damage_quantity) {
        this.damage_quantity = damage_quantity;
    }

    public void setDamage_userid(int damage_userid) {
        this.damage_userid = damage_userid;
    }
    
    
}
