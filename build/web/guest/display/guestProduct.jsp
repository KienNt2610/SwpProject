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
    int selectedCategoryId = -1;

    if (selectedCategory != null && !selectedCategory.isEmpty()) {
        try {
            selectedCategoryId = Integer.parseInt(selectedCategory);
        } catch (NumberFormatException e) {
            selectedCategoryId = -1; // Nếu lỗi, giữ giá trị mặc định
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Guest Product List</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="css/styles_guestProduct.css"> <!-- Đảm bảo đường dẫn đúng -->
        <style>
            .sale-price {
                color: #e74c3c;
                font-size: 1.2em;
                font-weight: bold;
            }

            .original-price {
                text-decoration: line-through;
                color: #7f8c8d;
                font-size: 1em;
            }
        </style>
    </head>
    <body>
        <h2 class="text-center">Tất cả sản phẩm</h2>

        <!-- Sidebar -->
        <div class="sidebar">
            <form method="GET" action="ProductURL">
                <input type="hidden" name="service" value="guestProduct">

                <!-- Filter by Category -->
                <label for="category">Category:</label>
                <select name="categoryId" id="category">
                    <option value="">Tất cả sản phẩm</option>
                    <%
                        if (categoryList != null) {
                            for (Category category : categoryList) {
                    %>
                    <option value="<%= category.getCategoryId() %>"
                            <%= category.getCategoryId() == selectedCategoryId ? "selected" : "" %> >
                        <%= category.getCategoryName() %>
                    </option>
                    <%
                            }
                        }
                    %>
                </select>

                <!-- Sort by -->
                <label for="sort">Sắp xếp theo:</label>
                <select name="sortBy" id="sort">
                    <option value="">Mặc định</option>
                    <option value="priceAsc">Giá thấp đến cao</option>
                    <option value="priceDesc">Giá cao đến thấp</option>
                    <option value="nameAsc">Tên từ A-Z</option>
                    <option value="nameDesc">Tên từ Z-A</option>
                </select>

                <button type="submit">Xác nhận</button>
            </form>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="container py-5">
                <div class="row justify-content-center mb-3">
                    <div class="col-12 text-right mb-3">
                        <form method="GET" action="ProductURL">
                            <input type="hidden" name="service" value="guestProduct">
                            <label for="isHot">Sản phẩm hot:</label>
                            <select name="isHot" id="isHot">
                                <option value="">Tất cả</option>
                                <option value="1" <%= "1".equals(request.getAttribute("isHot")) ? "selected" : "" %>>Sản phẩm hot</option>
                            </select>
                            <button type="submit">Xác nhận</button>
                        </form>
                    </div>

                    <%
                        if (productList != null && !productList.isEmpty()) {
                            for (Product product : productList) {
                    %>
                    <div class="col-md-12 col-xl-10">
                        <div class="product-card">
                            <div class="row">
                                <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                    <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                        <img src="path/to/your/placeholder-image.jpg" class="w-100" />
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-6 col-xl-6">
                                    <h5><%= product.getProductName() %></h5>
                                    <div class="d-flex flex-row">
                                        <div class="text-danger mb-1 me-2">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <span><%= product.getQuantity() %> sản phẩm có sẵn</span><br>
                                    <span><%= product.getSoldQuantity() %> sản phẩm đã bán</span><br>

                                    <div class="mt-1 mb-0 text-muted small">
                                        <span>100% cotton</span>
                                        <span class="text-primary"> • </span>
                                        <span>Gọn nhẹ</span>
                                        <span class="text-primary"> • </span>
                                        <span>Chất lượng hoàn thiện cao<br /></span>
                                    </div>
                                    <div class="mb-2 text-muted small">
                                        <span>Thiết kế sáng tạo</span>
                                    </div>

                                    <p class="text-truncate mb-4 mb-md-0">
                                        <%= product.getDescription() %>
                                    </p>


                                    <% if (product.isHot()) { %>
                                    <span class="badge bg-danger">Hot</span>
                                    <% } %>

                                </div>
                                <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                    <div class="d-flex flex-row">
                                        <!-- Hiển thị giá khuyến mãi nếu có -->
                                        <% if (product.getSalePrice() < product.getPrice()) { %>
                                        <span class="original-price"><%= product.getPrice() %>đ</span>
                                        <span class="sale-price"><%= product.getSalePrice() %>đ</span>
                                        <% } else { %>
                                        <span class="sale-price"><%= product.getPrice() %>đ</span>
                                        <% } %>
                                    </div>
                                    <h6 class="text-success">Miễn phí vận chuyển</h6>
                                    <div class="d-flex flex-column mt-4">
                                        <a href="ProductDetailURL?service=guestProductDetail&productId=<%= product.getProductId() %>" class="btn btn-primary btn-sm">
                                            Xem chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% 
                            }
                        } else {
                    %>
                    <p>No products found.</p>
                    <% 
                        }
                    %>
                </div>
            </div>
        </div>

    </body>
</html>
