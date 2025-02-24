package model;

import entity.CartDetail;
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
public class DAOCartDetail extends DBCConnection {

    public int insertCartDetail(CartDetail cartDetail) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[CartDetail]\n"
                + "           ([ProductId]\n"
                + "           ,[Quantity]\n"
                + "           ,[Price]\n"
                + "           ,[AddDate]\n"
                + "           ,[AddTime])\n"
                + "     VALUES\n"
                + "           (" + cartDetail.getProductId() + ","
                + cartDetail.getQuantity() + ","
                + cartDetail.getPrice() + ","
                + "'" + new java.sql.Date(cartDetail.getAddDate().getTime()) + "',"
                + "'" + new java.sql.Time(cartDetail.getAddTime().getTime()) + "')";
        System.out.println(sql);
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCartDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int addCartDetail(CartDetail cartDetail) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[CartDetail]\n"
                + "           ([ProductId]\n"
                + "           ,[Quantity]\n"
                + "           ,[Price]\n"
                + "           ,[AddDate]\n"
                + "           ,[AddTime])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, cartDetail.getProductId());
            pre.setInt(2, cartDetail.getQuantity());
            pre.setDouble(3, cartDetail.getPrice());
            pre.setDate(4, new java.sql.Date(cartDetail.getAddDate().getTime()));
            pre.setTime(5, new java.sql.Time(cartDetail.getAddTime().getTime()));
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int deleteCartDetail(int cartDetailId) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[CartDetail] WHERE CartDetailId=" + cartDetailId;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCartDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCartDetail(CartDetail cartDetail) {
        int n = 0;
        String sql = "UPDATE [dbo].[CartDetail]\n"
                + "   SET [ProductId] = ?, [Quantity] = ?, [Price] = ?, [AddDate] = ?, [AddTime] = ?\n"
                + " WHERE CartDetailId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, cartDetail.getProductId());
            pre.setInt(2, cartDetail.getQuantity());
            pre.setDouble(3, cartDetail.getPrice());
            pre.setDate(4, new java.sql.Date(cartDetail.getAddDate().getTime()));
            pre.setTime(5, new java.sql.Time(cartDetail.getAddTime().getTime()));
            pre.setInt(6, cartDetail.getCartDetailId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<CartDetail> getCartDetail(String sql) {
        Vector<CartDetail> vector = new Vector<CartDetail>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int CartDetailId = rs.getInt("CartDetailId");
                int ProductId = rs.getInt("ProductId");
                int Quantity = rs.getInt("Quantity");
                double Price = rs.getDouble("Price");
                java.util.Date AddDate = rs.getDate("AddDate");
                java.util.Date AddTime = rs.getTime("AddTime");
                CartDetail cartDetail = new CartDetail(CartDetailId, ProductId, Quantity, Price, AddDate, AddTime);
                vector.add(cartDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCartDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOCartDetail dao = new DAOCartDetail();
        Vector<CartDetail> vector = dao.getCartDetail("SELECT * FROM [dbo].[CartDetail]");
        for (CartDetail cartDetail : vector) {
            System.out.println(cartDetail);
        }
    }
}
