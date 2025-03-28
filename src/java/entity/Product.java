package entity;

import java.sql.Timestamp;

/**
 *
 * @author Kien
 */
public class Product {

    private int productId;
    private String productName;
    private int categoryId;
    private double price;
    private int quantity;
    private String description;
    private boolean discontinued;  // Discontinued is of type bit (boolean)
    private boolean isHot;         // IsHot is of type bit (boolean)
    private int soldQuantity;
    private java.sql.Timestamp createTime;
    private double salePrice;

    public Product() {
    }

    public Product(String productName, int categoryId, double price, int quantity, String description, boolean discontinued, boolean isHot, int soldQuantity, Timestamp createTime, double salePrice) {
        this.productName = productName;
        this.categoryId = categoryId;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.discontinued = discontinued;
        this.isHot = isHot;
        this.soldQuantity = soldQuantity;
        this.createTime = createTime;
        this.salePrice = salePrice;
    }

    public Product(int productId, String productName, int categoryId, double price, int quantity, String description, boolean discontinued, boolean isHot, int soldQuantity, Timestamp createTime, double salePrice) {
        this.productId = productId;
        this.productName = productName;
        this.categoryId = categoryId;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.discontinued = discontinued;
        this.isHot = isHot;
        this.soldQuantity = soldQuantity;
        this.createTime = createTime;
        this.salePrice = salePrice;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isDiscontinued() {
        return discontinued;
    }

    public void setDiscontinued(boolean discontinued) {
        this.discontinued = discontinued;
    }

    public boolean isHot() {
        return isHot;
    }

    public void setIsHot(boolean isHot) {
        this.isHot = isHot;
    }

    public int getSoldQuantity() {
        return soldQuantity;
    }

    public void setSoldQuantity(int soldQuantity) {
        this.soldQuantity = soldQuantity;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public double getTotalPrice() {
        return this.quantity * this.price;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", categoryId=" + categoryId + ", price=" + price + ", quantity=" + quantity + ", description=" + description + ", discontinued=" + discontinued + ", isHot=" + isHot + ", soldQuantity=" + soldQuantity + ", createTime=" + createTime + ", salePrice=" + salePrice + '}';
    }

}
