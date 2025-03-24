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

    // Get a list of ProductDetail based on a SQL query
    public Vector<ProductDetail> getProductDetail(String sql) {
        Vector<ProductDetail> vector = new Vector<ProductDetail>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int DetailId = rs.getInt("DetailId");
                int ProductId = rs.getInt("ProductId");
                String Color = rs.getString("Color");
                String Size = rs.getString("Size");
                ProductDetail productDetail = new ProductDetail(DetailId, ProductId, Color, Size);
                vector.add(productDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProductDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    // Lấy chi tiết sản phẩm theo DetailId
public ProductDetail getProductDetailById(int detailId) {
    ProductDetail productDetail = null;
    String sql = "SELECT * FROM ProductDetail WHERE DetailId = ?";
    try {
        PreparedStatement pre = conn.prepareStatement(sql);
        pre.setInt(1, detailId);
        ResultSet rs = pre.executeQuery();

        if (rs.next()) {
            int ProductId = rs.getInt("ProductId");
            String Color = rs.getString("Color");
            String Size = rs.getString("Size");
            productDetail = new ProductDetail(detailId, ProductId, Color, Size);
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return productDetail;
}


    public static void main(String[] args) {
        DAOProductDetail dao = new DAOProductDetail();
        Vector<ProductDetail> vector = dao.getProductDetail("select * from ProductDetail");
        for (ProductDetail productDetail : vector) {
            System.out.println(productDetail);
        }
    }
}
