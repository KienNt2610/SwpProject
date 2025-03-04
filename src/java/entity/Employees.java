/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author Kien
 */
public class Employees {

    private int EmployeeId;
    private String EmployeeName;
    private java.util.Date EmpBirthDate;
    private String PhoneNumber;
    private String Email;
    private String EmpGender;
    private int RoleId;
    private String UserName;
    private String Password;

    public Employees() {
    }

    public Employees(String EmployeeName, Date EmpBirthDate, String PhoneNumber, String Email, String EmpGender, int RoleId, String UserName, String Password) {
        this.EmployeeName = EmployeeName;
        this.EmpBirthDate = EmpBirthDate;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.EmpGender = EmpGender;
        this.RoleId = RoleId;
        this.UserName = UserName;
        this.Password = Password;
    }

    public Employees(int EmployeeId, String EmployeeName, Date EmpBirthDate, String PhoneNumber, String Email, String EmpGender, int RoleId, String UserName, String Password) {
        this.EmployeeId = EmployeeId;
        this.EmployeeName = EmployeeName;
        this.EmpBirthDate = EmpBirthDate;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.EmpGender = EmpGender;
        this.RoleId = RoleId;
        this.UserName = UserName;
        this.Password = Password;
    }

    public int getEmployeeId() {
        return EmployeeId;
    }

    public void setEmployeeId(int EmployeeId) {
        this.EmployeeId = EmployeeId;
    }

    public String getEmployeeName() {
        return EmployeeName;
    }

    public void setEmployeeName(String EmployeeName) {
        this.EmployeeName = EmployeeName;
    }

    public java.util.Date getEmpBirthDate() {
        return EmpBirthDate;
    }

    public void setEmpBirthDate(java.util.Date EmpBirthDate) {
        this.EmpBirthDate = EmpBirthDate;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getEmpGender() {
        return EmpGender;
    }

    public void setEmpGender(String EmpGender) {
        this.EmpGender = EmpGender;
    }

    public int getRoleId() {
        return RoleId;
    }

    public void setRoleId(int RoleId) {
        this.RoleId = RoleId;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    @Override
    public String toString() {
        return "Employees{" + "EmployeeId=" + EmployeeId + ", EmployeeName=" + EmployeeName + ", EmpBirthDate=" + EmpBirthDate + ", PhoneNumber=" + PhoneNumber + ", Email=" + Email + ", EmpGender=" + EmpGender + ", RoleId=" + RoleId + ", UserName=" + UserName + ", Password=" + Password + '}';
    }
    

}
