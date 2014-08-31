/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOImplementation;
import Bean.DishBean;
import Bean.DishSaleLogBean;
import Bean.IngredientBean;
import DBConnection.Connector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Keiko Nagano
 */
public class DishImplementation implements DAOInterface.DishInterface{

    @Override
    public void addDish(DishBean dbean) {
         Connector c = new Connector();
            Connection connection = c.getConnection();
            String query = "insert into dish(dish_id, dish_name, dish_cost, dish_price) values (null, ?, ?, ?);";
            try{
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setString(1, dbean.getDish_name());
                ps.setDouble(2, dbean.getDish_cost());
                ps.setDouble(3, dbean.getDish_price());
                ps.executeUpdate();
                ps.close();
                for(int i = 0; i < dbean.getIngredientList().size();i++){
                query = "insert into recipe (recipe_dish_id, recipe_ingredient_id, recipe_weight) values((SELECT MAX(dish_id) from dish),?,?)";
                ps = connection.prepareStatement(query);
                ps.setInt(1,dbean.getIngredientList().get(i).getIngredient_id());
                ps.setDouble(2, dbean.getIngredientList().get(i).getIngredient_weight());
                ps.executeUpdate();
                ps.close();
                }
            }catch(SQLException exc){
                
               
            }
            
    }
    
    @Override
    public ArrayList<IngredientBean> getIngredientList(){
        ArrayList<IngredientBean> ingredientList = new ArrayList();
        return ingredientList;
    }
    @Override
    public void addDishSaleLog(DishBean dbean) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void editDish(DishBean dbean) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public boolean checkDish(String dishName){
         Connector c = new Connector();
            Connection connection = c.getConnection();
            String query = "SELECT COUNT(*) from dish WHERE dish_name = ?";
            try{
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setString(1, dishName);
                ResultSet rs = ps.executeQuery();
                rs.next();
                int x = rs.getInt(1);
             return x <= 0;
                
            }catch(SQLException exc){
                
            }
        return false;
    }
    @Override
    public ArrayList<DishBean> getDishList() {
        Connector c = new Connector();
            Connection connection = c.getConnection();
            DishBean dishBean;
            ArrayList<DishBean> dishList = new ArrayList();
            String query = "SELECT * from dish";
            try{
                PreparedStatement ps = connection.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                dishBean = new DishBean();
                dishBean.setDish_id(rs.getInt(1));
                dishBean.setDish_name(rs.getString(2));
                dishBean.setDish_cost(rs.getDouble(3));
                dishBean.setDish_price(rs.getDouble(4));
                dishList.add(dishBean);
                
                }
                
                return dishList;
               
            }catch(SQLException exc){
                
            }
            return null;
    }

    @Override
    public ArrayList<DishSaleLogBean> getDishSaleLogList() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  

    
}
