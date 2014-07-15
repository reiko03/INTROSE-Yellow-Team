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
    public void editItem(ItemBean bean) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteItem(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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

        
    
    

