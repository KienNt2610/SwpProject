package model;

import entity.Category;
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
public class DAOCategory extends DBCConnection {

    public int insertCategory(Category category) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Category]\n"
                + "           ([CategoryName])\n"
                + "     VALUES\n"
                + "           ('" + category.getCategoryName() + "')";
        System.out.println(sql);
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int addCategory(Category category) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Category]\n"
                + "           ([CategoryName])\n"
                + "     VALUES\n"
                + "           (?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, category.getCategoryName());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int deleteCategory(int categoryId) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Category] WHERE CategoryId=" + categoryId;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCategory(Category category) {
        int n = 0;
        String sql = "UPDATE [dbo].[Category]\n"
                + "   SET [CategoryName] = ?\n"
                + " WHERE CategoryId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, category.getCategoryName());
            pre.setInt(2, category.getCategoryId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<Category> getCategory(String sql) {
        Vector<Category> vector = new Vector<Category>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int CategoryId = rs.getInt("CategoryId");
                String CategoryName = rs.getString("CategoryName");
                Category category = new Category(CategoryId, CategoryName);
                vector.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOCategory dao = new DAOCategory();
        Vector<Category> vector = dao.getCategory("SELECT * FROM [dbo].[Category]");
        for (Category category : vector) {
            System.out.println(category);
        }
    }
}
