/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Kien
 */
import entity.Product;
import entity.ProductDetail;
import java.util.ArrayList;
import java.util.List;
public class Cart {
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    private Item getItemById(int id){
        for(Item i : items){
            if(i.getProduct().getProductId() == id){
                return i;
            }
        }
        return null;
    }
    
    public int getQuantityById(int id) {
        Item item = getItemById(id);
        return (item != null) ? item.getQuantity() : 0;
    }
     public void addItem(Item t) {
        if(getItemById(t.getProduct().getProductId()) != null) {
            Item i = getItemById(t.getProduct().getProductId());
            i.setQuantity(i.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }
    
    public void removeItem(int id) {
        if(getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }
    
    public double getTotalMoney() {
        double total = 0;
        for (Item i : items) {
            // Use sale price if available, otherwise use regular price
            double price = (i.getProduct().getSalePrice() > 0) ? 
                          i.getProduct().getSalePrice() : i.getProduct().getPrice();
            total += i.getQuantity() * price;
        }
        return total;
    }
    
    private Product getProductByID(int id, List<Product> list) {
        for(Product p : list) {
            if(p.getProductId() == id) {
                return p;
            }
        }
        return null;
    }
    
    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            if(txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for(String itemStr : s) {
                    String[] n = itemStr.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1].trim());
                    Product p = getProductByID(id, list);
                    if(p != null) {
                        Item t = new Item(p, quantity);
                        addItem(t);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    // Additional method to handle product details
    public void addItemWithDetails(Product product, int quantity, ProductDetail detail) {
        Item item = new Item(product, quantity);
        item.setProductDetail(detail); // Assuming Item class has setProductDetail method
        addItem(item);
    }
}
