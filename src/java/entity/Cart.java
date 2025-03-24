package entity;

/**
 *
 * @author Dung
 */
public class Cart {

    private int CartId;
    private int CustomerId;
    private double TotalPrice;
    private java.util.Date AddDate;

    public Cart() {
    }

    public Cart(int CustomerId, double TotalPrice, java.util.Date AddDate) {
        this.CustomerId = CustomerId;
        this.TotalPrice = TotalPrice;
        this.AddDate = AddDate;
    }

    public Cart(int CartId, int CustomerId, double TotalPrice, java.util.Date AddDate) {
        this.CartId = CartId;
        this.CustomerId = CustomerId;
        this.TotalPrice = TotalPrice;
        this.AddDate = AddDate;
    }

    public int getCartId() {
        return CartId;
    }

    public void setCartId(int CartId) {
        this.CartId = CartId;
    }

    public int getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(int CustomerId) {
        this.CustomerId = CustomerId;
    }

    public double getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(double TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public java.util.Date getAddDate() {
        return AddDate;
    }

    public void setAddDate(java.util.Date AddDate) {
        this.AddDate = AddDate;
    }

    @Override
    public String toString() {
        return "Cart{" + "CartId=" + CartId + ", CustomerId=" + CustomerId + ", TotalPrice=" + TotalPrice + ", AddDate=" + AddDate + '}';
    }

}
