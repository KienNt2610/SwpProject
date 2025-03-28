/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Product;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kien
 */
public class Cart {

    private List<Product> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Product> items) {
        this.items = items;
    }

    public List<Product> getItems() {
        return items;
    }

    public void setItems(List<Product> items) {
        this.items = items;
    }

    public void addItem(Product product) {
        items.add(product);
    }

    public void removeItem(Product product) {
        items.remove(product);
    }

    public double getTotalAmount() {
        double total = 0;
        for (Product product : items) {
            total += product.getTotalPrice();
        }
        return total;
    }

    public void printCartDetails() {
        System.out.println("Cart Details:");
        for (Product product : items) {
            System.out.println("Product: " + product.getProductName() + ", Price: " + product.getPrice() + ", Quantity: " + product.getQuantity() + ", Total: " + product.getTotalPrice());
        }
        System.out.println("Total Cart Amount: " + getTotalAmount());
    }

}
