/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Kien
 */
public class DBCConnection {

    public Connection conn = null;

    public DBCConnection(String URL, String userName, String password) {
        try {
            // Load the JDBC driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Attempt to connect
            conn = DriverManager.getConnection(URL, userName, password);
            System.out.println("Database connected successfully");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("SQL Server JDBC Driver not found.");
        } catch (SQLException e) {
            e.printStackTrace();
           
        }
    }

    public DBCConnection() {
        this("jdbc:sqlserver://DESKTOP-1CRMVJM\\MSSQLSERVER01:1433;databaseName=SWP_Project", "sa", "123456"); // Update these parameters
    }

    public ResultSet getData(String sql) {
        ResultSet rs = null;
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            rs = state.executeQuery(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rs;
    }

    public static void main(String[] args) {
        new DBCConnection();
    }
}
