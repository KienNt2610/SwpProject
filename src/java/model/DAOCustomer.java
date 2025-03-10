package model;

import entity.Customer;
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
public class DAOCustomer extends DBCConnection {

    public int insertCustomer(Customer customer) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Customer]\n"
                + "           ([CustomerName]\n"
                + "           ,[CusBirthDate]\n"
                + "           ,[CusGender]\n"
                + "           ,[Phone]\n"
                + "           ,[Email]\n"
                + "           ,[Username]\n"
                + "           ,[Password]\n"
                + "           ,[Status]\n"
                + "           ,[RoleId])\n"
                + "     VALUES\n"
                + "           ('" + customer.getCustomerName() + "',"
                + "'" + customer.getCusBirthDate() + "',"
                + "'" + customer.getCusGender() + "',"
                + "'" + customer.getPhone() + "',"
                + "'" + customer.getEmail() + "',"
                + "'" + customer.getUsername() + "',"
                + "'" + customer.getPassword() + "',"
                + "'" + customer.getStatus() + "',"
                + customer.getRoleId() + ")";
        System.out.println(sql);
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int addCustomer(Customer customer) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Customer]\n"
                + "           ([CustomerName]\n"
                + "           ,[CusBirthDate]\n"
                + "           ,[CusGender]\n"
                + "           ,[Phone]\n"
                + "           ,[Email]\n"
                + "           ,[Username]\n"
                + "           ,[Password]\n"
                + "           ,[Status]\n"
                + "           ,[RoleId])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, customer.getCustomerName());
            pre.setString(2, customer.getCusBirthDate());
            pre.setString(3, customer.getCusGender());
            pre.setString(4, customer.getPhone());
            pre.setString(5, customer.getEmail());
            pre.setString(6, customer.getUsername());
            pre.setString(7, customer.getPassword());
            pre.setString(8, customer.getStatus());
            pre.setInt(9, customer.getRoleId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public void changeStatus(int cid, String newStatus) {
        String sql = "UPDATE Customer SET Status='" + newStatus + "' WHERE CustomerId=" + cid;
        try {
            Statement state = conn.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public int deleteCustomer(int cid) {
        int n = 0;
        // Example: check if the customer is referenced in other tables (e.g., Orders, Feedback)
        // If referenced, change status instead of deleting
        String sqlCheckOrder = "select * from [Order] WHERE CustomerId=" + cid;
        String sqlCheckFeedback = "select * from Feedback WHERE CustomerId=" + cid;

        ResultSet rsOrder = getData(sqlCheckOrder);
        ResultSet rsFeedback = getData(sqlCheckFeedback);

        try {
            if (rsOrder.next() || rsFeedback.next()) {
                // Customer is referenced in other tables, update status
                changeStatus(cid, "inactive");
                return 0;
            }
            String sql = "delete from Customer WHERE CustomerId=" + cid;
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updateCustomer(Customer customer) {
        int n = 0;
        String sql = "UPDATE [dbo].[Customer]\n"
                + "   SET [CustomerName] = ? ,[CusBirthDate] = ? ,[CusGender] = ? ,[Phone] = ? ,[Email] = ? ,[Username] = ? ,[Password] = ? ,[Status] = ? ,[RoleId] = ?\n"
                + " WHERE CustomerId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, customer.getCustomerName());
            pre.setString(2, customer.getCusBirthDate());
            pre.setString(3, customer.getCusGender());
            pre.setString(4, customer.getPhone());
            pre.setString(5, customer.getEmail());
            pre.setString(6, customer.getUsername());
            pre.setString(7, customer.getPassword());
            pre.setString(8, customer.getStatus());
            pre.setInt(9, customer.getRoleId());
            pre.setInt(10, customer.getCustomerId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<Customer> getCustomer(String sql) {
        Vector<Customer> vector = new Vector<Customer>();
        try (PreparedStatement pre = conn.prepareStatement(sql)) {
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                int CustomerId = rs.getInt("CustomerId");
                String CustomerName = rs.getString("CustomerName");
                String CusBirthDate = rs.getString("CusBirthDate");
                String CusGender = rs.getString("CusGender");
                String Phone = rs.getString("Phone");
                String Email = rs.getString("Email");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                String Status = rs.getString("Status");
                int RoleId = rs.getInt("RoleId");
                Customer customer = new Customer(CustomerId, CustomerName, CusBirthDate, CusGender, Phone, Email, Username, Password, Status, RoleId);
                vector.add(customer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOCustomer dao = new DAOCustomer();
        Vector<Customer> vector = dao.getCustomer("select * from Customer");
        for (Customer customer : vector) {
            System.out.println(customer);
        }
    }
}
