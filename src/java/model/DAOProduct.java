package model;

import entity.Category;
import entity.Product;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Data Access Object for handling Product-related operations
 */
public class DAOProduct extends DBCConnection {

    // Insert product into the database
    public int insertProduct(Product product) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([ProductName]\n"
                + "           ,[CategoryId]\n"
                + "           ,[Price]\n"
                + "           ,[Quantity]\n"
                + "           ,[Description]\n"
                + "           ,[Discontinued]\n"
                + "           ,[SoldQuantity]\n"
                + "           ,[CreateTime]\n"
                + "           ,[SalePrice]\n"
                + "           ,[IsHot])\n"
                + "     VALUES\n"
                + "           ('" + product.getProductName() + "',"
                + product.getCategoryId() + ","
                + product.getPrice() + ","
                + product.getQuantity() + ",'"
                + product.getDescription() + "'," + (product.isDiscontinued() ? 1 : 0) + ","
                + product.getSoldQuantity() + ","
                + (product.getCreateTime() != null ? "'" + product.getCreateTime() + "'" : "NULL") + ","
                + product.getSalePrice() + ","
                + (product.isHot()? 1 : 0) + ")";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Add product to the database using PreparedStatement for security and performance
    public int addProduct(Product product) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([ProductName]\n"
                + "           ,[CategoryId]\n"
                + "           ,[Price]\n"
                + "           ,[Quantity]\n"
                + "           ,[Description]\n"
                + "           ,[Discontinued]\n"
                + "           ,[SoldQuantity]\n"
                + "           ,[CreateTime]\n"
                + "           ,[SalePrice]\n"
                + "           ,[IsHot])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, product.getProductName());
            pre.setInt(2, product.getCategoryId());
            pre.setDouble(3, product.getPrice());
            pre.setInt(4, product.getQuantity());
            pre.setString(5, product.getDescription());
            pre.setInt(6, product.isDiscontinued() ? 1 : 0);
            pre.setInt(7, product.getSoldQuantity());
            pre.setTimestamp(8, product.getCreateTime() != null ? new java.sql.Timestamp(product.getCreateTime().getTime()) : null);
            pre.setDouble(9, product.getSalePrice());
            pre.setInt(10, product.isHot()? 1 : 0);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    // Change product discontinued status
    public void changeDiscontinued(int pid, int newValue) {
        String sql = "UPDATE Product SET Discontinued=" + newValue + " WHERE ProductId=" + pid;
        try {
            Statement state = conn.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Delete product from the database
    public int deleteProduct(int pid) {
        int n = 0;
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
            String sql = "DELETE FROM Product WHERE ProductId=" + pid;
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    // Update product details in the database
    public int updateProduct(Product product) {
        int n = 0;
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [ProductName] = ? ,[CategoryId] = ? ,[Price] = ? ,[Quantity] = ? ,[Description] = ? ,[Discontinued] = ? ,[SoldQuantity] = ? ,[CreateTime] = ? ,[SalePrice] = ? ,[IsHot] = ?\n"
                + " WHERE ProductId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, product.getProductName());
            pre.setInt(2, product.getCategoryId());
            pre.setDouble(3, product.getPrice());
            pre.setInt(4, product.getQuantity());
            pre.setString(5, product.getDescription());
            pre.setInt(6, (product.isDiscontinued() ? 1 : 0));
            pre.setInt(7, product.getSoldQuantity());
            pre.setTimestamp(8, product.getCreateTime() != null ? new java.sql.Timestamp(product.getCreateTime().getTime()) : null);
            pre.setDouble(9, product.getSalePrice());
            pre.setInt(10, product.isHot()? 1 : 0);
            pre.setInt(11, product.getProductId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    // Fetch products from the database
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
                int SoldQuantity = rs.getInt("SoldQuantity");
                java.sql.Timestamp createTime = rs.getTimestamp("CreateTime");
                double SalePrice = rs.getDouble("SalePrice");
                boolean IsHot = (rs.getInt("IsHot") == 1);

                Product product = new Product(ProductId, ProductName, CategoryId, Price, Quantity, Description, Discontinued, IsHot, SoldQuantity, createTime, SalePrice);
                vector.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    // Fetch all categories from the database
    public Vector<Category> getCategories() {
        Vector<Category> categories = new Vector<>();
        String sql = "SELECT * FROM Category";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("CategoryId");
                String name = rs.getString("CategoryName");
                categories.add(new Category(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    // Main method for testing
    public static void main(String[] args) {
        DAOProduct dao = new DAOProduct();
        Vector<Product> vector = dao.getProduct("SELECT * FROM Product");
        for (Product product : vector) {
            System.out.println(product);
        }
    }
}
