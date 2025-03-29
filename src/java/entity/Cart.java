package entity;


public class Cart {
    private int productId;      
    private String productName; 
    private double price;      
    private int quantity;      
    private String color;       
    private String size;        


    public Cart(int productId, String productName, double price, int quantity, String color, String size) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.size = size;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return this.price * this.quantity;
    }


    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public double getPrice() {
        return price;
    }

    public String getColor() {
        return color;
    }

    public String getSize() {
        return size;
    }


    @Override
    public String toString() {
        return "Cart [ProductId=" + productId + ", ProductName=" + productName + ", Price=" + price + ", Quantity=" + quantity + ", Color=" + color + ", Size=" + size + ", TotalPrice=" + getTotalPrice() + "]";
    }
}
