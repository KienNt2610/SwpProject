/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Employees;
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
public class DAOEmployees extends DBCConnection {

    public int insertEmployees(Employees employees) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Employees]\n"
                + "([EmployeeName], [EmpBirthDate], [PhoneNumber], [Email], [EmpGender], [RoleId], [UserName], [Password])\n"
                + "VALUES\n"
                + "(?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, employees.getEmployeeName());
            pre.setDate(2, new java.sql.Date(employees.getEmpBirthDate().getTime()));
            pre.setString(3, employees.getPhoneNumber());
            pre.setString(4, employees.getEmail());
            pre.setString(5, employees.getEmpGender());
            pre.setInt(6, employees.getRoleId());
            pre.setString(7, employees.getUserName());  // Added UserName
            pre.setString(8, employees.getPassword());  // Added Password
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int addEmployees(Employees employees) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Employees] "
                + "([EmployeeName], [EmpBirthDate], [PhoneNumber], [Email], [EmpGender], [RoleId], [UserName], [Password]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            // Tạo câu lệnh PreparedStatement để thực thi câu lệnh SQL
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, employees.getEmployeeName());
            pre.setDate(2, new java.sql.Date(employees.getEmpBirthDate().getTime()));
            pre.setString(3, employees.getPhoneNumber());
            pre.setString(4, employees.getEmail());
            pre.setString(5, employees.getEmpGender());
            pre.setInt(6, employees.getRoleId());
            pre.setString(7, employees.getUserName()); // Thêm UserName
            pre.setString(8, employees.getPassword()); // Thêm Password

            // Thực thi câu lệnh
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int deleteEmployees(int employeeId) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Employees] WHERE EmployeeId=" + employeeId;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOEmployees.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateEmployees(Employees employees) {
        int n = 0;
        String sql = "UPDATE [dbo].[Employees]\n"
                + "SET [EmployeeName] = ?, [EmpBirthDate] = ?, [PhoneNumber] = ?, [Email] = ?, [EmpGender] = ?, [RoleId] = ?, [UserName] = ?, [Password] = ?\n"
                + "WHERE [EmployeeId] = ?;";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, employees.getEmployeeName());
            pre.setDate(2, new java.sql.Date(employees.getEmpBirthDate().getTime()));
            pre.setString(3, employees.getPhoneNumber());
            pre.setString(4, employees.getEmail());
            pre.setString(5, employees.getEmpGender());
            pre.setInt(6, employees.getRoleId());
            pre.setString(7, employees.getUserName());  // Added UserName
            pre.setString(8, employees.getPassword());  // Added Password
            pre.setInt(9, employees.getEmployeeId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<Employees> getEmployees(String sql) {
        Vector<Employees> vector = new Vector<Employees>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int EmployeeId = rs.getInt("EmployeeId");
                String EmployeeName = rs.getString("EmployeeName");
                java.util.Date EmpBirthDate = rs.getDate("EmpBirthDate");
                String PhoneNumber = rs.getString("PhoneNumber");
                String Email = rs.getString("Email");
                String EmpGender = rs.getString("EmpGender");
                int RoleId = rs.getInt("RoleId");
                String UserName = rs.getString("UserName");  // Added UserName
                String Password = rs.getString("Password");  // Added Password

                Employees employees = new Employees(EmployeeId, EmployeeName, EmpBirthDate, PhoneNumber, Email, EmpGender, RoleId, UserName, Password);
                vector.add(employees);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOEmployees.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOEmployees dao = new DAOEmployees();
        Vector<Employees> vector = dao.getEmployees("SELECT * FROM [dbo].[Employees]");
        for (Employees employees : vector) {
            System.out.println(employees);
        }
    }
}
