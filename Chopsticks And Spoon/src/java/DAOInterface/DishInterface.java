/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOInterface;
import Bean.ItemBean;

/**
 *
 * @author Keiko Nagano
 */
public interface DishInterface {
    //methods for sql interaction goes here (AddDish, DeleteDish, etc)
    public void addDish(ItemBean bean);

    public void editDish(ItemBean bean);

    public void deleteDish(int id);
}
