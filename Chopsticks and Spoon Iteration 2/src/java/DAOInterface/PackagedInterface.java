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
    
    public void restockPackaged(PackagedBean pbean);
    
    public void removeDamaged(PackagedBean pbean);
    
    public void addPackagedRestockLog(PackagedBean pbean, UsersBean user);
    
    public ArrayList<PackagedRestockLogBean> getPackagedRestockLogList();
    
    public void addDamageLog(PackagedBean pbean, UsersBean user);
    
    public ArrayList<DamageLogBean> getDamageLogList();
    
    public ArrayList<PackagedBean> getPackagedList();
    
}
