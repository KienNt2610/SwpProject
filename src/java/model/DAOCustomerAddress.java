/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.CustomerAddress;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kien
 */
public class DAOCustomerAddress extends DBCConnection{
    public int insertCustomerAddress(CustomerAddress customerAddress) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[CustomerAddress]\n"
                + "           ([CustomerId]\n"
                + "           ,[Address])\n"
                + "     VALUES\n"
                + "           (" + customerAddress.getCustomerId() + ","
                + "'" + customerAddress.getAddress() + "')";
        System.out.println(sql);
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomerAddress.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int addCustomerAddress(CustomerAddress customerAddress) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[CustomerAddress]\n"
                + "           ([CustomerId]\n"
                + "           ,[Address])\n"
                + "     VALUES\n"
                + "           (?,?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, customerAddress.getCustomerId());
            pre.setString(2, customerAddress.getAddress());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int deleteCustomerAddress(int addressId) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[CustomerAddress] WHERE AddressId=" + addressId;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomerAddress.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCustomerAddress(CustomerAddress customerAddress) {
        int n = 0;
        String sql = "UPDATE [dbo].[CustomerAddress]\n"
                + "   SET [CustomerId] = ?, [Address] = ?\n"
                + " WHERE AddressId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, customerAddress.getCustomerId());
            pre.setString(2, customerAddress.getAddress());
            pre.setInt(3, customerAddress.getAddressId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<CustomerAddress> getCustomerAddress(String sql) {
        Vector<CustomerAddress> vector = new Vector<CustomerAddress>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int AddressId = rs.getInt("AddressId");
                int CustomerId = rs.getInt("CustomerId");
                String Address = rs.getString("Address");
                CustomerAddress customerAddress = new CustomerAddress(AddressId, CustomerId, Address);
                vector.add(customerAddress);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomerAddress.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOCustomerAddress dao = new DAOCustomerAddress();
        Vector<CustomerAddress> vector = dao.getCustomerAddress("SELECT * FROM [dbo].[CustomerAddress]");
        for (CustomerAddress customerAddress : vector) {
            System.out.println(customerAddress);
        }
    }
}
