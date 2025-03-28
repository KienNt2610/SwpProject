package entity;


public class Cart {
    private int productId;      // ID of the product
    private String productName; // Name of the product
    private double price;       // Price of the product
    private int quantity;       // Quantity of the product in the cart

    // Constructor to initialize a cart item
    public Cart(int productId, String productName, double price, int quantity) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
    }

    // Getter and Setter for quantity
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // Calculate total price for the product in the cart (price * quantity)
    public double getTotalPrice() {
        return this.price * this.quantity;
    }

    // Getter methods for Cart class
    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public double getPrice() {
        return price;
    }

    // Optional: Method to print information about the cart item (useful for debugging)
    @Override
    public String toString() {
        return "Cart [ProductId=" + productId + ", ProductName=" + productName + ", Price=" + price + ", Quantity=" + quantity + ", TotalPrice=" + getTotalPrice() + "]";
    }
}
