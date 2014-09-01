/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOImplementation;

import Bean.DamageLogBean;
import Bean.PackagedBean;
import Bean.PackagedRestockLogBean;
import Bean.PackagedSaleLogBean;
import Bean.UsersBean;
import DAOInterface.PackagedInterface;
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
public class PackagedImplementation implements PackagedInterface {

    @Override
    public void addDamageLog(int user_id, int packaged_id, int quantity, String date) {
        try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            String query = "insert into damagelog(damage_userid, damage_packagedid, damage_quantity, damage_datetime) values (?, ?, ?, ?);";
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user_id);
            ps.setInt(2, packaged_id);
            ps.setInt(3, quantity);
            ps.setString(4, date);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   

    @Override
    public void addPackaged(PackagedBean pbean) {
         try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            String query = "insert into packaged(packaged_name, packaged_quantity, packaged_cost, packaged_price, packaged_threshold, packaged_needSupply) values (?, ?, ?, ?, ?, ?);";
            
            int needSupply = 0;
            if(pbean.getPackaged_quantity() <= pbean.getPackaged_threshold())
                needSupply = 1;
            
            PreparedStatement ps = connection.prepareStatement(query);
            
            ps.setString(1, pbean.getPackaged_name());
            ps.setInt(2, pbean.getPackaged_quantity());            
            ps.setDouble(3, pbean.getPackaged_cost());
            ps.setDouble(4, pbean.getPackaged_price());
            ps.setInt(5, pbean.getPackaged_threshold());
            ps.setInt(6, needSupply);
            ps.executeUpdate(); //add, update, delete
        } catch (SQLException ex) {
             Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

    @Override
    public void editPackaged(int id, String name, double price, int threshold) {
         try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            
            String query = "update packaged set packaged_name = ?, packaged_price = ?, packaged_threshold = ? where packaged_id =?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, threshold);
            ps.setInt(4, id);
            ps.executeUpdate(); //add, update, delete
        } catch (SQLException ex) {
            Logger.getLogger(PackagedImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

    @Override
    public PackagedBean getPackaged(int packagedID) {
        Connector connector = new Connector();
        Connection connection = connector.getConnection();
        PackagedBean packagedBean = new PackagedBean();
        String query = "SELECT * FROM packaged WHERE packaged_id = ? ";
        try{
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, packagedID);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
         packagedBean.setPackaged_id(rs.getInt(1));
         packagedBean.setPackaged_name(rs.getString(2));
         packagedBean.setPackaged_quantity(rs.getInt(3));
         packagedBean.setPackaged_cost(rs.getDouble(4));
         packagedBean.setPackaged_price(rs.getDouble(5));
         packagedBean.setPackaged_threshold(rs.getInt(6));
         packagedBean.setPackaged_needSupply(rs.getInt(7));
         return packagedBean;
        }
        }catch(SQLException exc){
            
        }
        
        return packagedBean;
    }

    @Override
    public void addPackagedRestockLog(int user_id, int packaged_id, int quantity, double cost, String date, String source) {
        try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            String query = "insert into packagedrestocklog(p_restock_userid, p_restock_packagedid, restock_quantity, restock_cost, restock_datetime, restock_source) values (?, ?, ?, ?, ?, ?);";
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user_id);
            ps.setInt(2, packaged_id);
            ps.setInt(3, quantity);
            ps.setDouble(4, cost);
            ps.setString(5, date);
            ps.setString(6, source);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
   

    @Override
    public ArrayList<DamageLogBean> getDamageLogList() {
        Connector connector = new Connector();
            Connection connection = connector.getConnection();
            ArrayList<DamageLogBean> damagelogBean = new ArrayList<DamageLogBean>();
            String query = "SELECT * FROM damagelog";
            
            try {
            PreparedStatement preparedStatement = connection.prepareCall(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                DamageLogBean temp = new DamageLogBean();
                temp.setDamage_id(resultSet.getInt("damage_id"));
                temp.setDamage_userid(resultSet.getInt("damage_userid"));
                temp.setDamage_packagedid(resultSet.getInt("damage_packagedid"));
                temp.setDamage_quantity(resultSet.getInt("damage_quantity"));
                temp.setDamage_datetime(resultSet.getString("damage_datetime"));
                
                damagelogBean.add(temp);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        return damagelogBean;
    }

    @Override
    public ArrayList<PackagedSaleLogBean> getPackagedLogList(){
        Connector connector = new Connector();
        Connection connection = connector.getConnection();
        ArrayList<PackagedSaleLogBean> packagedLogList = new ArrayList();
        PackagedSaleLogBean packagedLogBean;
        String query = "SELECT * FROM packagedsalelog";
        try{
        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
        packagedLogBean = new PackagedSaleLogBean();
        packagedLogBean.setP_sale_id(rs.getInt(1));
        packagedLogBean.setP_sale_userid(rs.getInt(2));
        packagedLogBean.setP_sale_packagedid(rs.getInt(3));
        packagedLogBean.setSale_cost(rs.getDouble(4));
        packagedLogBean.setSale_price(rs.getDouble(5));
        packagedLogBean.setSale_datetime(rs.getString(6));
        packagedLogList.add(packagedLogBean);
        }
        return packagedLogList;
            
            
            
        }catch(SQLException exc){}
        return packagedLogList;
    }
    
    @Override
    public ArrayList<PackagedBean> getPackagedList() {
        Connector connector = new Connector();
        Connection connection = connector.getConnection();
        ArrayList<PackagedBean> packagedBean = new ArrayList<PackagedBean>();
        String query = "SELECT * FROM packaged";
        try {
            PreparedStatement preparedStatement = connection.prepareCall(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                PackagedBean temp = new PackagedBean();
                temp.setPackaged_id(resultSet.getInt("packaged_id"));
                temp.setPackaged_name(resultSet.getString("packaged_name"));
                temp.setPackaged_quantity(resultSet.getInt("packaged_quantity"));
                temp.setPackaged_cost(resultSet.getDouble("packaged_cost"));
                temp.setPackaged_price(resultSet.getDouble("packaged_price"));
                temp.setPackaged_threshold(resultSet.getInt("packaged_threshold"));
                temp.setPackaged_needSupply(resultSet.getInt("packaged_needSupply"));
               
                packagedBean.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
        return packagedBean;
    }

    @Override
    public ArrayList<PackagedRestockLogBean> getPackagedRestockLogList() {
        Connector connector = new Connector();
        Connection connection = connector.getConnection();
        ArrayList<PackagedRestockLogBean> packagedrestocklogBean = new ArrayList<PackagedRestockLogBean>();
        String query = "SELECT * FROM packagedrestocklog";
        try {
            PreparedStatement preparedStatement = connection.prepareCall(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                PackagedRestockLogBean temp = new PackagedRestockLogBean();
                temp.setP_restock_id(resultSet.getInt("p_restock_id"));
                temp.setP_restock_userid(resultSet.getInt("p_restock_userid"));
                temp.setP_restock_packagedid(resultSet.getInt("p_restock_packagedid"));
                temp.setRestock_quantity(resultSet.getInt("restock_quantity"));
                temp.setRestock_cost(resultSet.getDouble("restock_cost"));
                temp.setRestock_datetime(resultSet.getString("restock_datetime"));
                temp.setRestock_source(resultSet.getString("restock_source"));
                
                packagedrestocklogBean.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
        return packagedrestocklogBean;
    }

    @Override
    public void removeDamaged(int id, int quantity) {
         try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            PackagedBean temp = new PackagedBean();
            int resultQuantity;
            
            //first get the specific packaged to make calculations
            String queryGetPackaged = "SELECT packaged_quantity FROM packaged WHERE packaged_id =?"; 
           
            PreparedStatement ps1 = connection.prepareStatement(queryGetPackaged);
            ps1.setInt(1, id);
            ResultSet resultSet = ps1.executeQuery();
            
            while (resultSet.next()) {
                temp.setPackaged_quantity(resultSet.getInt("packaged_quantity"));
                
            }
            
            //CALCULATION
            resultQuantity = temp.getPackaged_quantity() - quantity;
            
            
            //update the database
            String query = "update packaged set packaged_quantity = ? where packaged_id =?";
            PreparedStatement ps2 = connection.prepareStatement(query);
            ps2.setDouble(1, resultQuantity);
            ps2.setInt(2, id);
            ps2.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void restockPackaged(int id, int quantity, double cost) {
         try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            PackagedBean temp = new PackagedBean();
            int resultQuantity;
            double resultCost;
            
            //first get the specific packaged to make calculations
            String queryGetPackaged = "SELECT packaged_quantity, packaged_cost FROM packaged WHERE packaged_id =?"; 
           
            PreparedStatement ps1 = connection.prepareStatement(queryGetPackaged);
            ps1.setInt(1, id);
            ResultSet resultSet = ps1.executeQuery();
            
            while (resultSet.next()) {
                temp.setPackaged_quantity(resultSet.getInt("packaged_quantity"));
                temp.setPackaged_cost(resultSet.getDouble("packaged_cost"));
                
            }
            
            //CALCULATION
            resultQuantity = quantity + temp.getPackaged_quantity();
            resultCost = ((cost + temp.getPackaged_cost()) / 2);
            
            
            //update the database
            String query = "update packaged set packaged_quantity = ?, packaged_cost = ? where packaged_id =?";
            PreparedStatement ps2 = connection.prepareStatement(query);
            ps2.setDouble(1, resultQuantity);
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
            PackagedBean temp = new PackagedBean();
            int quantity = 0;
            int threshold = 0;
            int needSupply = 0;
            
            //first get the specific packaged to make calculations
            String queryGetPackaged = "SELECT packaged_quantity, packaged_threshold FROM packaged WHERE packaged_id =?"; 
           
            PreparedStatement ps1 = connection.prepareStatement(queryGetPackaged);
            ps1.setInt(1, id);
            ResultSet resultSet = ps1.executeQuery();
            
            while (resultSet.next()) {
                quantity = resultSet.getInt("packaged_quantity");
                threshold = resultSet.getInt("packaged_threshold");
                
            }
            
            //CALCULATION
            if(quantity <= threshold)
                needSupply = 1;
            else
                needSupply = 0;                      
            
            
            //update the database
            String query = "update packaged set packaged_needSupply = ? where packaged_id =?";
            PreparedStatement ps2 = connection.prepareStatement(query);
            ps2.setDouble(1, needSupply);
            ps2.setInt(2, id);
            ps2.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(IngredientImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     @Override
    public boolean sellPackaged(PackagedBean pbean, UsersBean userAccount){
        Connector c = new Connector();
        Connection connection = c.getConnection();
        int needSupply = 0;
        
        String query1 = "SELECT packaged_quantity, packaged_threshold FROM packaged where packaged_id=?";
        String query = "UPDATE packaged set packaged_quantity=?, packaged_needSupply=? where packaged_id=?";
        try{
        PreparedStatement ps = connection.prepareStatement(query1);
        ps.setInt(1, pbean.getPackaged_id());
        ResultSet rs = ps.executeQuery();
        rs.next();
        int currentQuantity = rs.getInt(1);
        int currentThreshold = rs.getInt(2);
        ps.close();
        rs.close();
        
        if((currentQuantity-1) <= currentThreshold)
            needSupply = 1;
        else needSupply = 0;
        
        ps = connection.prepareStatement(query);
        ps.setInt(1, currentQuantity - 1);
        ps.setInt(2, needSupply);
        ps.setInt(3, pbean.getPackaged_id());
        ps.executeUpdate();
        ps.close();
        
        
         query = "INSERT INTO packagedsalelog (p_sale_id, p_sale_userid, p_sale_packagedid,sale_cost, sale_price, sale_datetime, sale_order) VALUES(NULL,?,?,?,?,CURRENT_TIMESTAMP,null)";
         ps = connection.prepareStatement(query);
         ps.setInt(1, userAccount.getUser_id());
         ps.setInt(2, pbean.getPackaged_id());
         ps.setDouble(3, pbean.getPackaged_cost());
         ps.setDouble(4, pbean.getPackaged_price());
         
         ps.executeUpdate();
         
            
            return true;
        }catch(SQLException exc){
            
        }
        
        
        return false;
    }
    
}
