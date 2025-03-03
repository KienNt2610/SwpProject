
package entity;

/**
 *
 * @author Kien
 */
public class Order {

    private int OrderId;
    private int CustomerId;
    private double TotalPrice;
    private java.util.Date Date;
    private String Message;
    private int EmployeeId;

    public Order() {
    }

    public Order(int CustomerId, double TotalPrice, java.util.Date Date, String Message, int EmployeeId) {
        this.CustomerId = CustomerId;
        this.TotalPrice = TotalPrice;
        this.Date = Date;
        this.Message = Message;
        this.EmployeeId = EmployeeId;
    }

    public Order(int OrderId, int CustomerId, double TotalPrice, java.util.Date Date, String Message, int EmployeeId) {
        this.OrderId = OrderId;
        this.CustomerId = CustomerId;
        this.TotalPrice = TotalPrice;
        this.Date = Date;
        this.Message = Message;
        this.EmployeeId = EmployeeId;
    }

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
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

    public java.util.Date getDate() {
        return Date;
    }

    public void setDate(java.util.Date Date) {
        this.Date = Date;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public int getEmployeeId() {
        return EmployeeId;
    }

    public void setEmployeeId(int EmployeeId) {
        this.EmployeeId = EmployeeId;
    }

    @Override
    public String toString() {
        return "Order{" + "OrderId=" + OrderId + ", CustomerId=" + CustomerId + ", TotalPrice=" + TotalPrice + ", Date=" + Date + ", Message=" + Message + ", EmployeeId=" + EmployeeId + '}';
    }

}
