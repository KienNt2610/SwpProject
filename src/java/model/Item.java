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

public class Item {

    private Product product;
    private ProductDetail productDetail;
    private int quantity;

    public Item(Product product, ProductDetail productDetail, int quantity) {
        this.product = product;
        this.productDetail = productDetail;
        this.quantity = quantity;
    }

    public Item(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
           return (product.getSalePrice()>0)? product.getSalePrice(): product.getPrice();
    }
    
    public double getTotal(){
        return  getPrice()*quantity;
    }
}
