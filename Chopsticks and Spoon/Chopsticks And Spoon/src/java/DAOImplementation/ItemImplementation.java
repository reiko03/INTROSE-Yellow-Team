/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOImplementation;

import Bean.ItemBean;
import DBConnection.Connector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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

        
    
    
}
