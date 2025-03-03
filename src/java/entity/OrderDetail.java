package entity;

/**
 *
 * @author Kien
 */
public class OrderDetail {

    private int OrderId;
    private int ProductId;
    private int Quantity;
    private double Price;

    public OrderDetail() {
    }

    public OrderDetail(int OrderId, int ProductId, int Quantity, double Price) {
        this.OrderId = OrderId;
        this.ProductId = ProductId;
        this.Quantity = Quantity;
        this.Price = Price;
    }

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int ProductId) {
        this.ProductId = ProductId;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "OrderId=" + OrderId + ", ProductId=" + ProductId + ", Quantity=" + Quantity + ", Price=" + Price + '}';
    }

}