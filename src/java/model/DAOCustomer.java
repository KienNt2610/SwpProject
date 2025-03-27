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
// Thêm vào DAOCustomer

    public Customer loginCustomer(String username, String password) {
        Customer customer = null;
        String sql = "SELECT * FROM [dbo].[Customer] WHERE Username = ? AND Password = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                customer = new Customer(
                        rs.getInt("CustomerId"),
                        rs.getString("CustomerName"),
                        rs.getString("CusBirthDate"),
                        rs.getString("CusGender"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Status"),
                        rs.getInt("RoleId")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return customer;
    }

    // Thêm khách hàng mới
    public int addCustomer(Customer customer) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Customer] ([CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Cập nhật thông tin khách hàng
    public int updateCustomer(Customer customer) {
        int n = 0;
        String sql = "UPDATE [dbo].[Customer] SET [CustomerName] = ?, [CusBirthDate] = ?, [CusGender] = ?, [Phone] = ?, [Email] = ?, [Username] = ?, [Password] = ?, [Status] = ?, [RoleId] = ? WHERE CustomerId = ?";
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
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Xóa khách hàng
    public int deleteCustomer(int customerId) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Customer] WHERE CustomerId = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, customerId);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Lấy thông tin khách hàng từ Username và Password
    public Customer getCustomerByUsernameAndPassword(String username, String password) {
        Customer customer = null;
        String sql = "SELECT * FROM [dbo].[Customer] WHERE Username = ? AND Password = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                customer = new Customer(
                        rs.getInt("CustomerId"),
                        rs.getString("CustomerName"),
                        rs.getString("CusBirthDate"),
                        rs.getString("CusGender"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Status"),
                        rs.getInt("RoleId")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    }

    // Lấy danh sách khách hàng (có thể dùng cho việc quản lý khách hàng)
    public Vector<Customer> getCustomers(String sql) {
        Vector<Customer> vector = new Vector<>();
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer(
                        rs.getInt("CustomerId"),
                        rs.getString("CustomerName"),
                        rs.getString("CusBirthDate"),
                        rs.getString("CusGender"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Status"),
                        rs.getInt("RoleId")
                );
                vector.add(customer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    // Kiểm tra tên đăng nhập đã tồn tại chưa
    public boolean checkUsernameExist(String username) {
        boolean isExist = false;
        String sql = "SELECT * FROM [dbo].[Customer] WHERE Username = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                isExist = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isExist;
    }

    // Kiểm tra email đã tồn tại chưa
    public boolean checkEmailExist(String email) {
        boolean isExist = false;
        String sql = "SELECT * FROM [dbo].[Customer] WHERE Email = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, email);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                isExist = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isExist;
    }

    // Kiểm tra mật khẩu
    public boolean checkPassword(String password, int customerId) {
        boolean isMatch = false;
        String sql = "SELECT * FROM [dbo].[Customer] WHERE Password = ? AND CustomerId = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, password);
            pre.setInt(2, customerId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                isMatch = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isMatch;
    }

    // Main method để kiểm tra
    public static void main(String[] args) {
        DAOCustomer dao = new DAOCustomer();
        Vector<Customer> vector = dao.getCustomers("SELECT * FROM Customer");
        for (Customer customer : vector) {
            System.out.println(customer);
        }
    }
}
