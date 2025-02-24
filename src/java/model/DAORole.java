package model;

import entity.Role;
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
public class DAORole extends DBCConnection {

    public int insertRole(Role role) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Role]\n"
                + "           ([RoleName])\n"
                + "     VALUES\n"
                + "           ('" + role.getRoleName() + "')";
        System.out.println(sql);
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAORole.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int addRole(Role role) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Role]\n"
                + "           ([RoleName])\n"
                + "     VALUES\n"
                + "           (?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, role.getRoleName());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int deleteRole(int roleId) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Role] WHERE RoleId=" + roleId;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAORole.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateRole(Role role) {
        int n = 0;
        String sql = "UPDATE [dbo].[Role]\n"
                + "   SET [RoleName] = ?\n"
                + " WHERE RoleId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, role.getRoleName());
            pre.setInt(2, role.getRoleId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<Role> getRole(String sql) {
        Vector<Role> vector = new Vector<Role>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int RoleId = rs.getInt("RoleId");
                String RoleName = rs.getString("RoleName");
                Role role = new Role(RoleId, RoleName);
                vector.add(role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORole.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAORole dao = new DAORole();
        Vector<Role> vector = dao.getRole("SELECT * FROM [dbo].[Role]");
        for (Role role : vector) {
            System.out.println(role);
        }
    }
}
