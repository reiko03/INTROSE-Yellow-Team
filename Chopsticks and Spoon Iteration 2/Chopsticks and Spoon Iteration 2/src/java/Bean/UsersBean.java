/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean;

/**
 *
 * @author Keiko Nagano
 */
public class UsersBean {
    private int user_id;
    private String user_name;
    private String user_password;
    private String user_level;

    public int getUser_id() {
        return user_id;
    }

    public String getUser_level() {
        return user_level;
    }

    public String getUser_name() {
        return user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setUser_level(String user_level) {
        this.user_level = user_level;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }
    
    
}
