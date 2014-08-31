/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOImplementation;

import Bean.UsersBean;
import DAOInterface.UsersInterface;
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
public class UserImplementation implements UsersInterface {

    @Override
    public boolean addUser(UsersBean ubean) {
         Connector c = new Connector();
        Connection connection = c.getConnection();
        String query = "INSERT INTO users(user_id, user_name, user_password, user_level) VALUES(null,?,?,?)";
        try{
        if(checkUserExists(ubean.getUser_name())){
        PreparedStatement ps = connection.prepareStatement(query);
        
        ps.setString(1, ubean.getUser_name());
        ps.setString(2, ubean.getUser_password());
        ps.setString(3, ubean.getUser_level());
        
       ps.executeUpdate();
        return true;}
        
        }
        catch(SQLException exc){
        }
        return false;
    }
    
    @Override
    public boolean checkUserExists(String username){
        
         Connector c = new Connector();
        Connection connection = c.getConnection();
        String query = "SELECT COUNT(*) FROM users WHERE user_name = ?";
        try{
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        int x =0;
        while(rs.next()){
         x = rs.getInt(1);
        }
        if(x > 0)
        return false;
        else 
        return true;
        
        }catch(SQLException exc){
        }
        
        return false;
    }
        
   
    @Override
    public boolean editUser(UsersBean ubean, int x){

         Connector c = new Connector();
        Connection connection = c.getConnection();
        String query = "UPDATE users SET user_name=?,user_password=?,user_level=? WHERE user_id = ?";
        try{
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, ubean.getUser_name());
        ps.setString(2, ubean.getUser_password());
        ps.setString(3, ubean.getUser_level());
        ps.setInt(4, x);
       ps.executeUpdate();
        return true;
        }
        catch(SQLException exc){
        }
        return false;
    }
    
    
    

    @Override
    public UsersBean getUser(String username) {
        UsersBean userBean= new UsersBean();
         Connector c = new Connector();
        Connection connection = c.getConnection();
        String query = "SELECT * FROM users WHERE user_name = ?";
        try{
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        rs.next();
        userBean.setUser_id(rs.getInt(1));
        userBean.setUser_name(rs.getString(2));
        userBean.setUser_password(rs.getString(3));
        userBean.setUser_level(rs.getString(4));
        }catch(SQLException exc){
        }
        
        return userBean;
       
    }

    @Override
    public ArrayList<UsersBean> getUsersList() {
        ArrayList<UsersBean> userList = new ArrayList();
        UsersBean userBean;
        Connector c = new Connector();
        Connection connection = c.getConnection();
        String query = "SELECT user_id, user_name, user_password, user_level FROM users";
        try{
         PreparedStatement ps = connection.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            userBean = new UsersBean();
            userBean.setUser_id(rs.getInt(1));
            userBean.setUser_name(rs.getString(2));
            userBean.setUser_password(rs.getString(3));
            userBean.setUser_level(rs.getString(4));
            userList.add(userBean);
         }
         
        }
        catch(SQLException exc){
        
        }
        return userList;
    }

    @Override
    public boolean userLogin(String userid, String password) {
         String u, p;
        Connector c = new Connector();
        Connection connection = c.getConnection();
        String query = "SELECT user_name, user_password FROM users";
        try{
        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            u = rs.getString(1);
            p = rs.getString(2);
            
            if(u.compareTo(userid)==0 && p.compareTo(password)==0)
                return true;
            
        }
        connection.close();
        }
        catch(SQLException exc){
        }

        
        return false;
    }
    
    
    
}
