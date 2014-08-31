/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOImplementation;

import Bean.IngredientBean;
import Bean.IngredientRestockLogBean;
import Bean.SpoilLogBean;
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
public class IngredientImplementation implements IngredientInterface {

    @Override
    public void addIngredient(IngredientBean ibean) {
        try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            String query = "insert into ingredient(ingredient_name, ingredient_weight, ingredient_cost, ingredient_threshold) values (?, ?, ?, ?);";
            
            PreparedStatement ps = connection.prepareStatement(query);
            
            ps.setString(1, ibean.getIngredient_name());
            ps.setDouble(2, ibean.getIngredient_weight());            
            ps.setDouble(3, ibean.getIngredient_cost());
            ps.setInt(4, ibean.getIngredient_threshold());
            ps.executeUpdate(); //add, update, delete
        } catch (SQLException ex) {
             Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

    @Override
    public void editIngredient(int id, String name, int threshold) {
       try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            
            String query = "update ingredient set ingredient_name = ?, ingredient_threshold = ? where ingredient_id =?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, threshold);
            ps.setInt(3, id);
            ps.executeUpdate(); //add, update, delete
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public IngredientBean getIngredient(int ingredientID){
        Connector connector = new Connector();
        Connection connection = connector.getConnection();
        IngredientBean ingredientBean = new IngredientBean();
        String query = "SELECT * FROM ingredient WHERE ingredient_id = ? ";
        try{
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1,ingredientID);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
         ingredientBean.setIngredient_id(rs.getInt(1));
         ingredientBean.setIngredient_name(rs.getString(2));
         ingredientBean.setIngredient_weight(rs.getDouble(3));
         ingredientBean.setIngredient_cost(rs.getDouble(4));
         ingredientBean.setIngredient_threshold(rs.getInt(5));
         ingredientBean.setIngredient_needSupply(rs.getInt(6));
         return ingredientBean;
        }
        }catch(SQLException exc){
            
        }
        
        return ingredientBean;
    }

    @Override
    public void addIngredientRestockLog(int user_id, int ingredient_id, double weight, double cost, String date, String source) {
       try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            String query = "insert into ingredientrestocklog(restock_userid, restock_ingredientid, restock_weight, restock_cost, restock_datetime, restock_source) values (?, ?, ?, ?, ?, ?);";
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user_id);
            ps.setInt(2, ingredient_id);
            ps.setDouble(3, weight);
            ps.setDouble(4, cost);
            ps.setString(5, date);
            ps.setString(6, source);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void addSpoilLog(int user_id, int ingredient_id, double weight, String date) {
        try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            String query = "insert into spoillog(spoil_userid, spoil_ingredientid, spoil_weight, spoil_datetime) values (?, ?, ?, ?);";
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user_id);
            ps.setInt(2, ingredient_id);
            ps.setDouble(3, weight);
            ps.setString(4, date);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    @Override
    public ArrayList<IngredientBean> getIngredientList() {
        Connector connector = new Connector();
        Connection connection = connector.getConnection();
        ArrayList<IngredientBean> ingredientBean = new ArrayList<IngredientBean>();
        String query = "SELECT * FROM ingredient"; 
        try {
            PreparedStatement preparedStatement = connection.prepareCall(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                IngredientBean temp = new IngredientBean();
                temp.setIngredient_id(resultSet.getInt("ingredient_id"));
                temp.setIngredient_name(resultSet.getString("ingredient_name"));
                temp.setIngredient_weight(resultSet.getDouble("ingredient_weight"));
                temp.setIngredient_cost(resultSet.getDouble("ingredient_cost"));
                temp.setIngredient_threshold(resultSet.getInt("ingredient_threshold"));
                temp.setIngredient_needSupply(resultSet.getInt("ingredient_needSupply"));
                ingredientBean.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ingredientBean;
    }

    @Override
    public ArrayList<IngredientRestockLogBean> getIngredientRestockLogList() {
            Connector connector = new Connector();
            Connection connection = connector.getConnection();
            ArrayList<IngredientRestockLogBean> ingredientrestocklogBean = new ArrayList<IngredientRestockLogBean>();
            String query = "SELECT * FROM ingredientrestocklog"; 
            
            try {
            PreparedStatement preparedStatement = connection.prepareCall(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                IngredientRestockLogBean temp = new IngredientRestockLogBean();
                temp.setI_restock_id(resultSet.getInt("i_restock_id"));
                temp.setI_restock_userid(resultSet.getInt("restock_userid"));
                temp.setI_restock_ingredientid(resultSet.getInt("restock_ingredientid"));
                temp.setRestock_weight(resultSet.getDouble("restock_weight"));
                temp.setRestock_cost(resultSet.getDouble("restock_cost"));
                temp.setRestock_datetime(resultSet.getString("restock_datetime"));
                temp.setRestock_source(resultSet.getString("restock_source"));
                
                ingredientrestocklogBean.add(temp);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        
        return ingredientrestocklogBean;
    }

    @Override
    public ArrayList<SpoilLogBean> getSpoilLogList() {
        Connector connector = new Connector();
            Connection connection = connector.getConnection();
            ArrayList<SpoilLogBean> ingredientspoillogBean = new ArrayList<SpoilLogBean>();
            String query = "SELECT * FROM spoillog"; 
            
            try {
            PreparedStatement preparedStatement = connection.prepareCall(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                SpoilLogBean temp = new SpoilLogBean();
                temp.setSpoil_id(resultSet.getInt("spoil_id"));
                temp.setSpoil_userid(resultSet.getInt("spoil_userid"));
                temp.setSpoil_ingredientid(resultSet.getInt("spoil_ingredientid"));
                temp.setSpoil_weight(resultSet.getDouble("spoil_weight"));
                temp.setSpoil_datetime(resultSet.getString("spoil_datetime"));
                
                ingredientspoillogBean.add(temp);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        
        return ingredientspoillogBean;
    }

    @Override
    public void removeSpoiled(int id, double weight) {
         try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            IngredientBean temp = new IngredientBean();
            double resultWeight;
            
            //first get the specific ingredient to make calculations
            String queryGetIngredient = "SELECT ingredient_weight FROM ingredient WHERE ingredient_id =?"; 
           
            PreparedStatement ps1 = connection.prepareStatement(queryGetIngredient);
            ps1.setInt(1, id);
            ResultSet resultSet = ps1.executeQuery();
            
            while (resultSet.next()) {
                temp.setIngredient_weight(resultSet.getDouble("ingredient_weight"));
                
            }
            
            //CALCULATION
            resultWeight = temp.getIngredient_weight() - weight;
            
            
            //update the database
            String query = "update ingredient set ingredient_weight = ? where ingredient_id =?";
            PreparedStatement ps2 = connection.prepareStatement(query);
            ps2.setDouble(1, resultWeight);
            ps2.setInt(2, id);
            ps2.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void restockIngredient(int id, double weight, double cost) {
        try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            IngredientBean temp = new IngredientBean();
            double resultWeight;
            double resultCost;
            
            //first get the specific ingredient to make calculations
            String queryGetIngredient = "SELECT ingredient_weight, ingredient_cost FROM ingredient WHERE ingredient_id =?"; 
           
            PreparedStatement ps1 = connection.prepareStatement(queryGetIngredient);
            ps1.setInt(1, id);
            ResultSet resultSet = ps1.executeQuery();
            
            while (resultSet.next()) {
                temp.setIngredient_weight(resultSet.getDouble("ingredient_weight"));
                temp.setIngredient_cost(resultSet.getDouble("ingredient_cost"));
                
            }
            
            //CALCULATION
            resultWeight = weight + temp.getIngredient_weight();
            resultCost = ((cost + temp.getIngredient_cost()) / 2);
            
            
            //update the database
            String query = "update ingredient set ingredient_weight = ?, ingredient_cost = ? where ingredient_id =?";
            PreparedStatement ps2 = connection.prepareStatement(query);
            ps2.setDouble(1, resultWeight);
            ps2.setDouble(2, resultCost);
            ps2.setInt(3, id);
            ps2.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void checkSupply(int id) {
         try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            IngredientBean temp = new IngredientBean();
            int threshold = 0;
            double weight = 0;
            int needSupply = 0;
            
            //first get the specific ingredient to make calculations
            String queryGetIngredient = "SELECT ingredient_weight, ingredient_threshold FROM ingredient WHERE ingredient_id =?"; 
           
            PreparedStatement ps1 = connection.prepareStatement(queryGetIngredient);
            ps1.setInt(1, id);
            ResultSet resultSet = ps1.executeQuery();
            
            while (resultSet.next()) {
                weight = resultSet.getDouble("ingredient_weight");
                threshold = resultSet.getInt("ingredient_threshold");
            }
            
            //CALCULATION
            if(weight <= threshold)
                    needSupply = 1;
            else
                    needSupply = 0;
            
            //update the database
            String query = "update ingredient set ingredient_needSupply = ? where ingredient_id =?";
            PreparedStatement ps2 = connection.prepareStatement(query);
            ps2.setDouble(1, needSupply);
            ps2.setInt(2, id);
            ps2.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
}
