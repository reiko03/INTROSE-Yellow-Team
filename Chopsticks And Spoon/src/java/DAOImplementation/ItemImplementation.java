/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOImplementation;

import Bean.DishBean;
import Bean.ItemBean;
import DBConnection.Connector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jillianembarrientos
 */
public class ItemImplementation implements DAOInterface.ItemInterface{

    @Override
    public void addItem(ItemBean bean) {
       try {
            Connector c = new Connector();
            Connection connection = c.getConnection();
            String query = "insert into item(itemName, itemWeight, itemQuantity) values (?, ?, ?);";
            PreparedStatement ps = connection.prepareStatement(query);
           
            ps.setString(1, bean.getItemName());
            ps.setDouble(2, bean.getItemWeight());            
            ps.setInt(3, bean.getItemQuantity());
            ps.executeUpdate(); //add, update, delete
        } catch (SQLException ex) {
    }
    }

    @Override
    public void editItem(String itemName, String obj, String columnIndex) {
        try{
        Connector c = new Connector();
        Connection connection = c.getConnection();
        String query;
        Integer ci;
       
            ci = Integer.parseInt(columnIndex);
        
        PreparedStatement ps;
        switch(ci){
            case 0: query = "UPDATE item SET itemName = ? where itemName = ?";
                    
                   ps = connection.prepareStatement(query);
                    ps.setString(1, obj);
                    ps.setString(2, itemName);
                    
                    ps.executeUpdate(); //add, update, delete   
            break;
            case 1: query = "UPDATE item SET itemWeight = ? where itemName = ?";
                    ps = connection.prepareStatement(query);
                     ps.setFloat(1, Float.parseFloat(obj));
                     System.out.println(Float.parseFloat(obj) + " to " + itemName);
                     ps.setString(2, itemName);
                    ps.executeUpdate(); //add, update, delete   
                     
            break;
            case 2: query = "UPDATE item SET itemQuantity = ? where itemName = ?";
                    ps = connection.prepareStatement(query);
                     ps.setInt(1, Integer.parseInt(obj));
                      System.out.println(Integer.parseInt(obj) + " to " + itemName);
                     ps.setString(2, itemName);
                     ps.executeUpdate(); //add, update, delete   
                    
            break;
        }
        
              
        
        }catch(SQLException exc){
        
        }
    }

    @Override
    public void deleteItem(String name) {
      Connector c = new Connector();
        Connection connection = c.getConnection();
        String query = "DELETE FROM item WHERE itemName = ?";
        try{
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, name);
         ps.executeUpdate();}
        catch(SQLException exc){
        }
        
    }
    
    public static List<ItemBean> viewAllItems() throws Exception{
        Connector c = new Connector();
        Connection connection = c.getConnection();
        String query = "SELECT * FROM item";
        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        List<ItemBean> list = new ArrayList<ItemBean>();
        while (rs.next()) {
            list.add(new ItemBean(
                    rs.getString(2),
                    rs.getDouble(3),
                    rs.getInt(4)));
        }

        connection.close();
        return list;
    }
    
 
    
   
    

        
    
    }

        
    
    

