package entity;

/**
 *
 * @author Dung
 */
public class Category {

    private int CategoryId;
    private String CategoryName;

    public Category() {
    }

    public Category(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public Category(int CategoryId, String CategoryName) {
        this.CategoryId = CategoryId;
        this.CategoryName = CategoryName;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int CategoryId) {
        this.CategoryId = CategoryId;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    @Override
    public String toString() {
        return "Category{" + "CategoryId=" + CategoryId + ", CategoryName=" + CategoryName + '}';
    }

}
