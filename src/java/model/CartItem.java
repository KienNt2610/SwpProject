package model;

import entity.Product;

public class CartItem {
    private Product book;
    private int quantity;

    // Constructor
    public CartItem(Product book, int quantity) {
        this.book = book;
        this.quantity = quantity;
    }

    public Product getBook() {
        return book;
    }

    public void setBook(Product book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // Tính tổng giá trị của CartItem (giá * số lượng)
    public double getTotalPrice() {
        return this.book.getPrice() * this.quantity;
    }
}
