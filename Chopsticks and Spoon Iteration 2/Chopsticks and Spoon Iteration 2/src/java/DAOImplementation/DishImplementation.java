/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOImplementation;
import Bean.DishBean;
import Bean.DishSaleLogBean;
import DBConnection.Connector;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
    public ArrayList<DishBean> getDishList() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<DishSaleLogBean> getDishSaleLogList() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  

    
}
