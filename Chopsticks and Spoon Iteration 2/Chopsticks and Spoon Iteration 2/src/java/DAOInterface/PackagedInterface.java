/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOInterface;

import Bean.DamageLogBean;
import Bean.PackagedBean;
import Bean.PackagedRestockLogBean;
import Bean.UsersBean;
import java.util.ArrayList;

/**
 *
 * @author Keiko Nagano
 */
public interface PackagedInterface {
    
    public void addPackaged(PackagedBean pbean);
    
    public void editPackaged(int id, String name, double price, int threshold);
    
    public void restockPackaged(int id, int quantity, double cost);
    
    public void removeDamaged(int id, int quantity);
    
    public void addPackagedRestockLog(int user_id, int packaged_id, int quantity, double cost, String date, String source);
    
    public ArrayList<PackagedRestockLogBean> getPackagedRestockLogList();
    
    public PackagedBean getPackaged(int packagedID);
    
    public void addDamageLog(int user_id, int packaged_id, int quantity, String date);
    
    public ArrayList<DamageLogBean> getDamageLogList();
    
    public ArrayList<PackagedBean> getPackagedList();
    
}
