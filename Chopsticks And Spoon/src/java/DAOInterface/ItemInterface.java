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
public interface ItemInterface {
    //methods for sql interaction goes here (AddItem, DeleteItem, etc)
    public void addItem(ItemBean bean);

    public void editItem(ItemBean bean);

    public void deleteItem(int id);
}
