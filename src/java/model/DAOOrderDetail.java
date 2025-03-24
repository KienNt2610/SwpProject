package model;

import entity.OrderDetail;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kien
 */
public class DAOOrderDetail extends DBCConnection {

    public int insertOrderDetail(OrderDetail orderDetail) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[OrderDetail]\n"
                + "           ([OrderId]\n"
                + "           ,[ProductId]\n"
                + "           ,[Quantity]\n"
                + "           ,[Price])\n"
                + "     VALUES\n"
                + "           (" + orderDetail.getOrderId() + ","
                + orderDetail.getProductId() + ","
                + orderDetail.getQuantity() + ","
                + orderDetail.getPrice() + ")";
        System.out.println(sql);
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int addOrderDetail(OrderDetail orderDetail) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[OrderDetail]\n"
                + "           ([OrderId]\n"
                + "           ,[ProductId]\n"
                + "           ,[Quantity]\n"
                + "           ,[Price])\n"
                + "     VALUES\n"
                + "           (?,?,?,?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, orderDetail.getOrderId());
            pre.setInt(2, orderDetail.getProductId());
            pre.setInt(3, orderDetail.getQuantity());
            pre.setDouble(4, orderDetail.getPrice());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int deleteOrderDetail(int orderId, int productId) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[OrderDetail] WHERE OrderId=" + orderId + " AND ProductId=" + productId;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateOrderDetail(OrderDetail orderDetail) {
        int n = 0;
        String sql = "UPDATE [dbo].[OrderDetail]\n"
                + "   SET [Quantity] = ?, [Price] = ?\n"
                + " WHERE OrderId=? AND ProductId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, orderDetail.getQuantity());
            pre.setDouble(2, orderDetail.getPrice());
            pre.setInt(3, orderDetail.getOrderId());
            pre.setInt(4, orderDetail.getProductId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<OrderDetail> getOrderDetail(String sql) {
        Vector<OrderDetail> vector = new Vector<OrderDetail>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int OrderId = rs.getInt("OrderId");
                int ProductId = rs.getInt("ProductId");
                int Quantity = rs.getInt("Quantity");
                double Price = rs.getDouble("Price");
                OrderDetail orderDetail = new OrderDetail(OrderId, ProductId, Quantity, Price);
                vector.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOOrderDetail dao = new DAOOrderDetail();
        Vector<OrderDetail> vector = dao.getOrderDetail("SELECT * FROM [dbo].[OrderDetail]");
        for (OrderDetail orderDetail : vector) {
            System.out.println(orderDetail);
        }
    }
}