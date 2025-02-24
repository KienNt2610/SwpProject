package entity;

/**
 *
 * @author Dung
 */
public class CartDetail {

    private int CartDetailId;
    private int ProductId;
    private int Quantity;
    private double Price;
    private java.util.Date AddDate;
    private java.util.Date AddTime;

    public CartDetail() {
    }

    public CartDetail(int ProductId, int Quantity, double Price, java.util.Date AddDate, java.util.Date AddTime) {
        this.ProductId = ProductId;
        this.Quantity = Quantity;
        this.Price = Price;
        this.AddDate = AddDate;
        this.AddTime = AddTime;
    }

    public CartDetail(int CartDetailId, int ProductId, int Quantity, double Price, java.util.Date AddDate, java.util.Date AddTime) {
        this.CartDetailId = CartDetailId;
        this.ProductId = ProductId;
        this.Quantity = Quantity;
        this.Price = Price;
        this.AddDate = AddDate;
        this.AddTime = AddTime;
    }

    public int getCartDetailId() {
        return CartDetailId;
    }

    public void setCartDetailId(int CartDetailId) {
        this.CartDetailId = CartDetailId;
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

    public java.util.Date getAddDate() {
        return AddDate;
    }

    public void setAddDate(java.util.Date AddDate) {
        this.AddDate = AddDate;
    }

    public java.util.Date getAddTime() {
        return AddTime;
    }

    public void setAddTime(java.util.Date AddTime) {
        this.AddTime = AddTime;
    }

    @Override
    public String toString() {
        return "CartDetail{" + "CartDetailId=" + CartDetailId + ", ProductId=" + ProductId + ", Quantity=" + Quantity + ", Price=" + Price + ", AddDate=" + AddDate + ", AddTime=" + AddTime + '}';
    }

}
