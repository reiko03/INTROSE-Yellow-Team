/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOInterface;

import Bean.UsersBean;
import java.util.ArrayList;

/**
 *
 * @author Keiko Nagano
 */
public interface UsersInterface {
    
    public void addUser(UsersBean ubean);
    
    public void deleteUser(UsersBean ubean);
    
    public UsersBean userLogin(String userid, String password);
    
    public ArrayList<UsersBean> getUsersList();
    
    public UsersBean getUser(String username);
    
 
            
}
