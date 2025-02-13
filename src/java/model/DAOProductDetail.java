package model;

import entity.ProductDetail;
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
public class DAOProductDetail extends DBCConnection {

    // Insert a new ProductDetail
    public int insertProductDetail(ProductDetail productDetail) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[ProductDetail]\n"
                + "           ([ProductId], [Color], [Size])\n"
                + "     VALUES\n"
                + "           (" + productDetail.getProductId() + ", '"
                + productDetail.getColor() + "', '"
                + productDetail.getSize() + "')";
        System.out.println(sql);
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProductDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Add a ProductDetail with PreparedStatement
    public int addProductDetail(ProductDetail productDetail) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[ProductDetail] ([ProductId], [Color], [Size]) VALUES (?, ?, ?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, productDetail.getProductId());
            pre.setString(2, productDetail.getColor());
            pre.setString(3, productDetail.getSize());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    // Update a ProductDetail
    public int updateProductDetail(ProductDetail productDetail) {
        int n = 0;
        String sql = "UPDATE [dbo].[ProductDetail]\n"
                + "   SET [Color] = ?, [Size] = ?\n"
                + " WHERE [DetailId] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, productDetail.getColor());
            pre.setString(2, productDetail.getSize());
            pre.setInt(3, productDetail.getDetailId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    // Delete a ProductDetail
    public int deleteProductDetail(int detailId) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[ProductDetail] WHERE [DetailId] = " + detailId;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProductDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Get a list of ProductDetails based on a SQL query
    public Vector<ProductDetail> getProductDetails(String sql) {
        Vector<ProductDetail> vector = new Vector<ProductDetail>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int detailId = rs.getInt("DetailId");
                int productId = rs.getInt("ProductId");
                String color = rs.getString("Color");
                String size = rs.getString("Size");
                ProductDetail productDetail = new ProductDetail(detailId, productId, color, size);
                vector.add(productDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProductDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOProductDetail dao = new DAOProductDetail();
        Vector<ProductDetail> vector = dao.getProductDetails("SELECT * FROM ProductDetail");
        for (ProductDetail productDetail : vector) {
            System.out.println(productDetail);
        }
    }
}
