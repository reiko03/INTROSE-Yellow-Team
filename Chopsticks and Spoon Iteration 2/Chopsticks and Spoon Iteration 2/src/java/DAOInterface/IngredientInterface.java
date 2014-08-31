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
    
    public void editIngredient(int id, String name, int threshold);
    
    public void restockIngredient(int id, double weight, double cost);
    
    public void removeSpoiled(int id, double weight);
    
    public void addIngredientRestockLog(int user_id, int ingredient_id, double weight, double cost, String date, String source);
    
    public IngredientBean getIngredient(int ingredientID);
    
    public ArrayList<IngredientRestockLogBean> getIngredientRestockLogList();
    
    public void addSpoilLog(int user_id, int ingredient_id, double weight, String date);
    
    public ArrayList<SpoilLogBean> getSpoilLogList();
    
    public ArrayList<IngredientBean> getIngredientList();
    
    public void checkSupply(int id);
    
}
