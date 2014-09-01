/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOImplementation;
import Bean.DishBean;
import Bean.DishSaleLogBean;
import Bean.IngredientBean;
import Bean.UsersBean;
import DAOInterface.IngredientInterface;
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
            IngredientBean ingredientBean;
            ArrayList<IngredientBean> ingredientList= new ArrayList();;
            ArrayList<DishBean> dishList = new ArrayList();
            
            IngredientInterface ingDAO = new IngredientImplementation();
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
                dishBean.setDish_highCost(rs.getInt(5));
                dishList.add(dishBean);
                
                }
                ps.close();
                rs.close();
                /*
                for(int i = 0 ; i < dishList.size(); i++){
                query = "SELECT recipe_ingredient_id, recipe_weight FROM recipe WHERE recipe_dish_id=?";
                ps = connection.prepareStatement(query);
                ps.setInt(1,dishList.get(i).getDish_id());
                rs = ps.executeQuery();
                while(rs.next()){
                    ingredientList = new ArrayList();
                    ingredientBean = new IngredientBean();
                    ingredientBean = ingDAO.getIngredient(rs.getInt(1));
                    ingredientList.add(ingredientBean);
                    ingredientList.get(ingredientList.size()-1).setIngredient_weight(rs.getDouble(2));
                }
                dishList.get(i).setIngredientList(ingredientList);
                }*/
                
                return dishList;
                
                
                
               
            }catch(SQLException exc){
                
            }
            return null;
    }
    
    @Override 
    public DishBean getDish(int dishID){
     DishBean dishBean = new DishBean();
     Connector c = new Connector();
     Connection connection = c.getConnection();
     IngredientBean ingredientBean = new IngredientBean();
     IngredientInterface ingDAO = new IngredientImplementation();
     ArrayList<IngredientBean> ingredientList = new ArrayList();
     String query = "SELECT * FROM dish WHERE dish_id = ?";
     try{
     PreparedStatement ps = connection.prepareStatement(query);
     ps.setInt(1, dishID);
     ResultSet rs = ps.executeQuery();
     rs.next();
     dishBean.setDish_id(rs.getInt(1));
     dishBean.setDish_name(rs.getString(2));
     dishBean.setDish_cost(rs.getDouble(3));
     dishBean.setDish_price(rs.getDouble(4));
     dishBean.setDish_highCost(rs.getInt(5));
     rs.close();
     ps.close();
     
     query = "SELECT recipe_ingredient_id, recipe_weight FROM recipe where recipe_dish_id = ?";
     ps = connection.prepareStatement(query);
     ps.setInt(1, dishID);
     rs = ps.executeQuery();
     while(rs.next()){
       ingredientBean = new IngredientBean();
       ingredientBean = ingDAO.getIngredient(rs.getInt(1));
       ingredientList.add(ingredientBean);
       ingredientList.get(ingredientList.size()-1).setIngredient_weight(rs.getDouble(2));
     }
     
     dishBean.setIngredientList(ingredientList);
     return dishBean;    
     }catch(SQLException exc){
     
     }
     return dishBean;
    }
    @Override
    public boolean sellDish(DishBean dbean, UsersBean userAccount){
         Connector c = new Connector();
         PreparedStatement ps;
         Connection connection = c.getConnection();
         IngredientInterface ingDAO = new IngredientImplementation();
         ArrayList<IngredientBean> ingredientList = ingDAO.getIngredientList();
         ArrayList<IngredientBean> dishIngredientList = dbean.getIngredientList();
         int needSupply = 0;
        String query = "UPDATE ingredient set ingredient_weight=?, ingredient_needSupply=? where ingredient_id=?";
        try{
         for(int i = 0; i < dbean.getIngredientList().size();i++){
          ps = connection.prepareStatement(query);
         Double x = ingDAO.getIngredient(dishIngredientList.get(i).getIngredient_id()).getIngredient_weight() - dishIngredientList.get(i).getIngredient_weight();
         ps.setDouble(1, x);
         System.out.println(""+x);
         
         if(x <= dishIngredientList.get(i).getIngredient_threshold())
              needSupply = 1;
         else needSupply = 0;
         
         ps.setInt(2, needSupply);
         ps.setInt(3, dishIngredientList.get(i).getIngredient_id());
         
         ps.executeUpdate();
         ps.close();
         
         }
         query = "INSERT INTO dishsalelog (d_sale_id, sale_userid, sale_dishid,sale_cost, sale_price, sale_datetime, sale_order) VALUES(NULL,?,?,?,?,CURRENT_TIMESTAMP,null)";
         ps = connection.prepareStatement(query);
         ps.setInt(1, userAccount.getUser_id());
         ps.setInt(2, dbean.getDish_id());
         ps.setDouble(3, dbean.getDish_cost());
         ps.setDouble(4, dbean.getDish_price());
         ps.executeUpdate();
         
            return true;
        }catch(SQLException exc){
        }
        return false;
    }

    @Override
    public ArrayList<DishSaleLogBean> getDishSaleLogList() {
         ArrayList<DishSaleLogBean> dishLogList = new ArrayList();
        DishSaleLogBean saleBean;
         Connector c = new Connector();
         PreparedStatement ps;
         Connection connection = c.getConnection();
         String query = "SELECT * FROM dishsalelog";
         try{
         ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         while(rs.next()){
         saleBean = new DishSaleLogBean();
         saleBean.setD_sale_id(rs.getInt(1));
         saleBean.setSale_userid(rs.getInt(2));
         saleBean.setSale_dishid(rs.getInt(3));
         saleBean.setSale_cost(rs.getDouble(4));
         saleBean.setSale_price(rs.getDouble(5));
         saleBean.setSale_datetime(rs.getString(6));
         dishLogList.add(saleBean);
         }
         return dishLogList;
         }catch(SQLException exc){
             
         }
          return dishLogList;
        //To change body of generated methods, choose Tools | Templates.
    }

  

    
}
