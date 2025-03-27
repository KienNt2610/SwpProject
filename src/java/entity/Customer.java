/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Kien
 */
public class Customer {
    	private int CustomerId;
	private String CustomerName;
	private String CusBirthDate;
	private String CusGender;
	private String Phone;
	private String Email;
	private String Username;
	private String Password;
	private String Status;
	private int RoleId;

    public Customer() {
    }

    public Customer(String CustomerName, String CusBirthDate, String CusGender, String Phone, String Email, String Username, String Password, String Status, int RoleId) {
        this.CustomerName = CustomerName;
        this.CusBirthDate = CusBirthDate;
        this.CusGender = CusGender;
        this.Phone = Phone;
        this.Email = Email;
        this.Username = Username;
        this.Password = Password;
        this.Status = Status;
        this.RoleId = RoleId;
    }

    public Customer(int CustomerId, String CustomerName, String CusBirthDate, String CusGender, String Phone, String Email, String Username, String Password, String Status, int RoleId) {
        this.CustomerId = CustomerId;
        this.CustomerName = CustomerName;
        this.CusBirthDate = CusBirthDate;
        this.CusGender = CusGender;
        this.Phone = Phone;
        this.Email = Email;
        this.Username = Username;
        this.Password = Password;
        this.Status = Status;
        this.RoleId = RoleId;
    }

    public int getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(int CustomerId) {
        this.CustomerId = CustomerId;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public String getCusBirthDate() {
        return CusBirthDate;
    }

    public void setCusBirthDate(String CusBirthDate) {
        this.CusBirthDate = CusBirthDate;
    }

    public String getCusGender() {
        return CusGender;
    }

    public void setCusGender(String CusGender) {
        this.CusGender = CusGender;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public int getRoleId() {
        return RoleId;
    }

    public void setRoleId(int RoleId) {
        this.RoleId = RoleId;
    }

    @Override
    public String toString() {
        return "Customer{" + "CustomerId=" + CustomerId + ", CustomerName=" + CustomerName + ", CusBirthDate=" + CusBirthDate + ", CusGender=" + CusGender + ", Phone=" + Phone + ", Email=" + Email + ", Username=" + Username + ", Password=" + Password + ", Status=" + Status + ", RoleId=" + RoleId + '}';
    }
               
}
