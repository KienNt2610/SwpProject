package model;

import entity.Product;
import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<CartItem> items;

    public Cart() {
        this.items = new ArrayList<>();
    }

    // Thêm sản phẩm vào giỏ
    public void addItem(Product product, int quantity) {
        for (CartItem item : items) {
            if (item.getBook().getProductId() == product.getProductId()) {
                // Nếu sản phẩm đã có trong giỏ thì tăng số lượng
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        // Nếu sản phẩm chưa có trong giỏ, thêm sản phẩm mới
        items.add(new CartItem(product, quantity));
    }

    // Xóa sản phẩm khỏi giỏ
    public void removeItem(int productId) {
        items.removeIf(item -> item.getBook().getProductId() == productId);
    }

    // Cập nhật số lượng sản phẩm trong giỏ
    public void updateItemQuantity(int productId, int quantity) {
        for (CartItem item : items) {
            if (item.getBook().getProductId() == productId) {
                item.setQuantity(quantity);
                break;
            }
        }
    }

    // Tính tổng tiền giỏ hàng
    public double getTotalMoney() {
        double total = 0;
        for (CartItem item : items) {
            total += item.getTotalPrice();
        }
        return total;
    }

    public List<CartItem> getItems() {
        return items;
    }
}
