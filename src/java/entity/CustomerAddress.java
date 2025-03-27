/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Kien
 */
public class CustomerAddress {
    private int AddressId;
    private int CustomerId;
    private String Address;

    public CustomerAddress() {
    }

    public CustomerAddress(int CustomerId, String Address) {
        this.CustomerId = CustomerId;
        this.Address = Address;
    }

    public CustomerAddress(int AddressId, int CustomerId, String Address) {
        this.AddressId = AddressId;
        this.CustomerId = CustomerId;
        this.Address = Address;
    }

    public int getAddressId() {
        return AddressId;
    }

    public void setAddressId(int AddressId) {
        this.AddressId = AddressId;
    }

    public int getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(int CustomerId) {
        this.CustomerId = CustomerId;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    @Override
    public String toString() {
        return "CustomerAddress{" + "AddressId=" + AddressId + ", CustomerId=" + CustomerId + ", Address=" + Address + '}';
    }
}
