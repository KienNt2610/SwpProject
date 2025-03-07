<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Vector" %>
<%@ page import="entity.Product" %>
<%@ page import="entity.Category" %>

<%
    // Lấy danh sách sản phẩm và danh mục từ request
    Vector<Product> productList = (Vector<Product>) request.getAttribute("data");
    Vector<Category> categoryList = (Vector<Category>) request.getAttribute("categoryList");

    // Xử lý giá trị categoryId từ request
    String selectedCategory = request.getParameter("categoryId");
    int selectedCategoryId = -1; // Giá trị mặc định nếu không có danh mục nào được chọn

    if (selectedCategory != null && !selectedCategory.isEmpty()) {
        try {
            selectedCategoryId = Integer.parseInt(selectedCategory);
        } catch (NumberFormatException e) {
            selectedCategoryId = -1; // Nếu lỗi, giữ giá trị mặc định
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Guest Product List</title>
    <meta charset="UTF-8">
</head>
<body>
    <h2>Product List (Guest)</h2>

    <form method="GET" action="ProductURL">
        <input type="hidden" name="service" value="guestProduct">

        <!-- Filter by Category -->
        <label for="category">Category:</label>
        <select name="categoryId" id="category">
            <option value="">All</option>
            <%
                if (categoryList != null) {
                    for (Category category : categoryList) {
            %>
            <option value="<%= category.getCategoryId() %>"
                <%= category.getCategoryId() == selectedCategoryId ? "selected" : "" %>>
                <%= category.getCategoryName() %>
            </option>
            <%
                    }
                }
            %>
        </select>

        <!-- Sort by -->
        <label for="sort">Sort By:</label>
        <select name="sortBy" id="sort">
            <option value="">Default</option>
            <option value="priceAsc">Price Low to High</option>
            <option value="priceDesc">Price High to Low</option>
            <option value="nameAsc">Name A-Z</option>
            <option value="nameDesc">Name Z-A</option>
        </select>

        <button type="submit">Apply</button>
    </form>

    <!-- Product Table -->
    <table border="1">
        <tr>
            <th>Product Name</th>
            <th>Category</th>
            <th>Price</th>
        </tr>
        <%
            if (productList != null && !productList.isEmpty()) {
                for (Product product : productList) {
                    String categoryName = "Not Available"; // Giá trị mặc định nếu không tìm thấy danh mục

                    if (categoryList != null) {
                        for (Category category : categoryList) {
                            if (category.getCategoryId() == product.getCategoryId()) {
                                categoryName = category.getCategoryName();
                                break; // Dừng tìm kiếm nếu tìm thấy danh mục
                            }
                        }
                    }
        %>
        <tr>
            <!-- Tạo liên kết đến trang chi tiết sản phẩm -->
           <td><a href="ProductDetailURL?service=guestProductDetail&productId=<%= product.getProductId() %>"><%= product.getProductName() %></a></td>
            <td><%= categoryName %></td>
            <td><%= product.getPrice() %> đ</td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">No Products Found.</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
