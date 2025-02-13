/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Kien
 */
public class ProductDetail {

    private int DetailId;
    private int ProductId;
    private String Color;
    private String Size;

    public ProductDetail() {
    }

    public ProductDetail(int ProductId, String Color, String Size) {
        this.ProductId = ProductId;
        this.Color = Color;
        this.Size = Size;
    }

    public ProductDetail(int DetailId, int ProductId, String Color, String Size) {
        this.DetailId = DetailId;
        this.ProductId = ProductId;
        this.Color = Color;
        this.Size = Size;
    }

    public int getDetailId() {
        return DetailId;
    }

    public void setDetailId(int DetailId) {
        this.DetailId = DetailId;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int ProductId) {
        this.ProductId = ProductId;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    @Override
    public String toString() {
        return "ProductDetail{" + "DetailId=" + DetailId + ", ProductId=" + ProductId + ", Color=" + Color + ", Size=" + Size + '}';
    }

}
