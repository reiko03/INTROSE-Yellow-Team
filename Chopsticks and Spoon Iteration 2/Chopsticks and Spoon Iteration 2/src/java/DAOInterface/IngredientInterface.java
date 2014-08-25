/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOInterface;

import Bean.IngredientBean;
import Bean.IngredientRestockLogBean;
import Bean.SpoilLogBean;
import Bean.UsersBean;
import java.util.ArrayList;

/**
 *
 * @author Keiko Nagano
 */
public interface IngredientInterface {
    
    public void addIngredient(IngredientBean ibean);
    
    public void restockIngredient(IngredientBean ibean);
    
    public void removeSpoiled(IngredientBean ibean);
    
    public void addIngredientRestockLog(IngredientBean ibean, UsersBean user);
    
    public ArrayList<IngredientRestockLogBean> getIngredientRestockLogList();
    
    public void addSpoilLog(IngredientBean ibean, UsersBean user);
    
    public ArrayList<SpoilLogBean> getSpoilLogList();
    
    public ArrayList<IngredientBean> getIngredientList();
    
}
