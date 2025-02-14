/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Kien
 */
public class Product {

    private int ProductId;
    private String ProductName;
    private int CategoryId;
    private double Price;
    private int Quantity;
    private String Description;
    private boolean Discontinued;

    public Product() {
    }

    public Product(String ProductName, int CategoryId, double Price, int Quantity, String Description, boolean Discontinued) {
        this.ProductName = ProductName;
        this.CategoryId = CategoryId;
        this.Price = Price;
        this.Quantity = Quantity;
        this.Description = Description;
        this.Discontinued = Discontinued;
    }

    public Product(int ProductId, String ProductName, int CategoryId, double Price, int Quantity, String Description, boolean Discontinued) {
        this.ProductId = ProductId;
        this.ProductName = ProductName;
        this.CategoryId = CategoryId;
        this.Price = Price;
        this.Quantity = Quantity;
        this.Description = Description;
        this.Discontinued = Discontinued;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int ProductId) {
        this.ProductId = ProductId;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int CategoryId) {
        this.CategoryId = CategoryId;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public boolean isDiscontinued() {
        return Discontinued;
    }

    public void setDiscontinued(boolean Discontinued) {
        this.Discontinued = Discontinued;
    }

    @Override
    public String toString() {
        return "Product{" + "ProductId=" + ProductId + ", ProductName=" + ProductName + ", CategoryId=" + CategoryId + ", Price=" + Price + ", Quantity=" + Quantity + ", Description=" + Description + ", Discontinued=" + Discontinued + '}';
    }

}
