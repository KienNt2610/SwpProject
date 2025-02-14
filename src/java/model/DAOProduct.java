package model;

import entity.Product;
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
public class DAOProduct extends DBCConnection {

    public int insertProduct(Product product) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([ProductName]\n"
                + "           ,[CategoryId]\n"
                + "           ,[Price]\n"
                + "           ,[Quantity]\n"
                + "           ,[Description]\n"
                + "           ,[Discontinued])\n"
                + "     VALUES\n"
                + "           ('" + product.getProductName() + "',"
                + product.getCategoryId() + ","
                + product.getPrice() + ","
                + product.getQuantity() + ",'"
                + product.getDescription() + "'," + (product.isDiscontinued() == true ? 1 : 0) + ")";
        System.out.println(sql);
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int addProduct(Product product) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([ProductName]\n"
                + "           ,[CategoryId]\n"
                + "           ,[Price]\n"
                + "           ,[Quantity]\n"
                + "           ,[Description]\n"
                + "           ,[Discontinued])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, product.getProductName());
            pre.setInt(2, product.getCategoryId());
            pre.setDouble(3, product.getPrice());
            pre.setInt(4, product.getQuantity());
            pre.setString(5, product.getDescription());
            pre.setInt(6, product.isDiscontinued() ? 1 : 0);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public void changeDiscontinued(int pid, int newValue) {
        String sql = "UPDATE Product SET Discontinued=" + newValue + " WHERE ProductId=" + pid;
        try {
            Statement state = conn.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public int deleteProduct(int pid) {
        int n = 0;
        // Example: check if the product is referenced in other tables (similar to downloads or reviews)
        // If referenced, change status instead of deleting
        String sqlCheckOrderDetail = "select * from OrderDetail WHERE ProductId=" + pid;
        String sqlCheckFeedback = "select * from Feedback WHERE ProductId=" + pid;
        String sqlCheckCartDetail = "select * from CartDetail WHERE ProductId=" + pid;
        String sqlCheckProductDetail = "select * from ProductDetail WHERE ProductId=" + pid;

        ResultSet rsOrderDetail = getData(sqlCheckOrderDetail);
        ResultSet rsFeedback = getData(sqlCheckFeedback);
        ResultSet rsCartDetail = getData(sqlCheckCartDetail);
        ResultSet rsProductDetail = getData(sqlCheckProductDetail);

        try {
            if (rsOrderDetail.next() || rsFeedback.next() || rsCartDetail.next() || rsProductDetail.next()) {
                // Product is referenced in other tables, update discontinued status
                changeDiscontinued(pid, 0);
                return 0;
            }
            String sql = "delete from Product WHERE ProductId=" + pid;
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updateProduct(Product product) {
        int n = 0;
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [ProductName] = ? ,[CategoryId] = ? ,[Price] = ? ,[Quantity] = ? ,[Description] = ? ,[Discontinued] = ?\n"
                + " WHERE ProductId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, product.getProductName());
            pre.setInt(2, product.getCategoryId());
            pre.setDouble(3, product.getPrice());
            pre.setInt(4, product.getQuantity());
            pre.setString(5, product.getDescription());
            pre.setInt(6, (product.isDiscontinued() == true ? 1 : 0));
            pre.setInt(7, product.getProductId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<Product> getProduct(String sql) {
        Vector<Product> vector = new Vector<Product>();
        try (PreparedStatement pre = conn.prepareStatement(sql)) {
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                int ProductId = rs.getInt("ProductId");
                String ProductName = rs.getString("ProductName");
                int CategoryId = rs.getInt("CategoryId");
                double Price = rs.getDouble("Price");
                int Quantity = rs.getInt("Quantity");
                String Description = rs.getString("Description");
                boolean Discontinued = (rs.getInt("Discontinued") == 1 ? true : false);
                Product product = new Product(ProductId, ProductName, CategoryId, Price, Quantity, Description, Discontinued);
                vector.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOProduct dao = new DAOProduct();
        Vector<Product> vector = dao.getProduct("select * from Product");
        for (Product product : vector) {
            System.out.println(product);
        }
    }
}
