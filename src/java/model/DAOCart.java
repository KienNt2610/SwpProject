package model;

import entity.Cart;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dung
 */
public class DAOCart extends DBCConnection {

    public int insertCart(Cart cart) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Cart]\n"
                + "           ([CustomerId]\n"
                + "           ,[TotalPrice]\n"
                + "           ,[AddDate])\n"
                + "     VALUES\n"
                + "           (" + cart.getCustomerId() + ","
                + cart.getTotalPrice() + ","
                + "'" + new java.sql.Date(cart.getAddDate().getTime()) + "')";
        System.out.println(sql);
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int addCart(Cart cart) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Cart]\n"
                + "           ([CustomerId]\n"
                + "           ,[TotalPrice]\n"
                + "           ,[AddDate])\n"
                + "     VALUES\n"
                + "           (?,?,?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, cart.getCustomerId());
            pre.setDouble(2, cart.getTotalPrice());
            pre.setDate(3, new java.sql.Date(cart.getAddDate().getTime()));
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int deleteCart(int cartId) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Cart] WHERE CartId=" + cartId;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCart(Cart cart) {
        int n = 0;
        String sql = "UPDATE [dbo].[Cart]\n"
                + "   SET [CustomerId] = ?, [TotalPrice] = ?, [AddDate] = ?\n"
                + " WHERE CartId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, cart.getCustomerId());
            pre.setDouble(2, cart.getTotalPrice());
            pre.setDate(3, new java.sql.Date(cart.getAddDate().getTime()));
            pre.setInt(4, cart.getCartId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<Cart> getCart(String sql) {
        Vector<Cart> vector = new Vector<Cart>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int CartId = rs.getInt("CartId");
                int CustomerId = rs.getInt("CustomerId");
                double TotalPrice = rs.getDouble("TotalPrice");
                java.util.Date AddDate = rs.getDate("AddDate");
                Cart cart = new Cart(CartId, CustomerId, TotalPrice, AddDate);
                vector.add(cart);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOCart dao = new DAOCart();
        Vector<Cart> vector = dao.getCart("SELECT * FROM [dbo].[Cart]");
        for (Cart cart : vector) {
            System.out.println(cart);
        }
    }
}
