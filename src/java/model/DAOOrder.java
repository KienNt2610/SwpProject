
package model;

import entity.Order;
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
public class DAOOrder extends DBCConnection {

    public int insertOrder(Order order) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([CustomerId]\n"
                + "           ,[TotalPrice]\n"
                + "           ,[Date]\n"
                + "           ,[Message]\n"
                + "           ,[EmployeeId])\n"
                + "     VALUES\n"
                + "           (" + order.getCustomerId() + ","
                + order.getTotalPrice() + ","
                + "'" + new java.sql.Date(order.getDate().getTime()) + "',"
                + "'" + order.getMessage() + "'," + order.getEmployeeId() + ")";
        System.out.println(sql);
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int addOrder(Order order) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([CustomerId]\n"
                + "           ,[TotalPrice]\n"
                + "           ,[Date]\n"
                + "           ,[Message]\n"
                + "           ,[EmployeeId])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, order.getCustomerId());
            pre.setDouble(2, order.getTotalPrice());
            pre.setDate(3, new java.sql.Date(order.getDate().getTime()));
            pre.setString(4, order.getMessage());
            pre.setInt(5, order.getEmployeeId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int deleteOrder(int orderId) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Order] WHERE OrderId=" + orderId;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateOrder(Order order) {
        int n = 0;
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET [CustomerId] = ?, [TotalPrice] = ?, [Date] = ?, [Message] = ?, [EmployeeId] = ?\n"
                + " WHERE OrderId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, order.getCustomerId());
            pre.setDouble(2, order.getTotalPrice());
            pre.setDate(3, new java.sql.Date(order.getDate().getTime()));
            pre.setString(4, order.getMessage());
            pre.setInt(5, order.getEmployeeId());
            pre.setInt(6, order.getOrderId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<Order> getOrder(String sql) {
        Vector<Order> vector = new Vector<Order>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int OrderId = rs.getInt("OrderId");
                int CustomerId = rs.getInt("CustomerId");
                double TotalPrice = rs.getDouble("TotalPrice");
                java.util.Date Date = rs.getDate("Date");
                String Message = rs.getString("Message");
                int EmployeeId = rs.getInt("EmployeeId");
                Order order = new Order(OrderId, CustomerId, TotalPrice, Date, Message, EmployeeId);
                vector.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOOrder dao = new DAOOrder();
        Vector<Order> vector = dao.getOrder("SELECT * FROM [dbo].[Order]");
        for (Order order : vector) {
            System.out.println(order);
        }
    }
}
