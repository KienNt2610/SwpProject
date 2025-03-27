<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Product, entity.Category"%>

<%
    Vector<Product> vector = (Vector<Product>) request.getAttribute("data");
    String title = (String) request.getAttribute("title");
    // Lấy danh sách Category từ request
    Vector<Category> categoryList = (Vector<Category>) request.getAttribute("categoryList");
    // Lấy selectedCategoryId từ request (nếu có)
    String selectedCategoryId = (String) request.getAttribute("selectedCategoryId");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title><%= title != null ? title : "Product List" %></title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            /* Your existing CSS */
        </style>
    </head>
    <body>
        <header class="header_section">
            <div class="container">
                <nav class="navbar navbar-expand-lg custom_nav-container">
                    <a class="navbar-brand" href="index.html">
                        <img width="100" src="images/logo.png" alt="SportGear Shop"/>
                    </a>
                    <h1>Quản Lý Sản Phẩm</h1>  
                </nav>
            </div>
        </header>

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <h2><%= title != null ? title : "Product List" %></h2>
                    </div>

                    <div class="sidebar">
                        <!-- Tìm kiếm theo tên sản phẩm -->
                        <form action="ProductURL" method="get" class="product-filter-form">
                            <input type="hidden" name="service" value="listAllProduct">

                            <label for="pname">Search by Name:</label>
                            <input type="text" name="pname" id="pname" value="<%= request.getParameter("pname") != null ? request.getParameter("pname") : "" %>" class="form-control">

                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                        </form>

                        <!-- Lọc theo Category -->
                        <form method="GET" action="ProductURL" class="product-filter-form">
                            <input type="hidden" name="service" value="listAllProduct">

                            <label for="categoryId">Danh mục:</label>
                            <select name="categoryId" id="categoryId" class="form-control">
                                <option value="">Tất cả sản phẩm</option>
                                <%
                                    if (categoryList != null) {
                                        for (Category category : categoryList) {
                                %>
                                <option value="<%= category.getCategoryId() %>"
                                       <%= category.getCategoryId() == Integer.parseInt(selectedCategoryId) ? "selected" : "" %>
                                    <%= category.getCategoryName() %>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>

                            <!-- Giữ lại giá trị tìm kiếm pname khi filter -->
                            <input type="hidden" name="pname" value="<%= request.getParameter("pname") != null ? request.getParameter("pname") : "" %>">

                            <button type="submit" class="btn btn-primary">Filter</button>
                        </form>

                        <!-- Sắp xếp sản phẩm -->
                        <form method="GET" action="ProductURL" class="product-filter-form">
                            <input type="hidden" name="service" value="listAllProduct">

                            <label for="sortBy">Sắp xếp theo:</label>
                            <select name="sortBy" id="sortBy" class="form-control">
                                <option value="">Mặc định</option>
                                <option value="priceAsc" <%= "priceAsc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Giá thấp đến cao</option>
                                <option value="priceDesc" <%= "priceDesc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Giá cao đến thấp</option>
                                <option value="nameAsc" <%= "nameAsc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Tên từ A-Z</option>
                                <option value="nameDesc" <%= "nameDesc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Tên từ Z-A</option>
                            </select>

                            <!-- Giữ lại giá trị tìm kiếm pname khi sort -->
                            <input type="hidden" name="pname" value="<%= request.getParameter("pname") != null ? request.getParameter("pname") : "" %>">
                            <input type="hidden" name="categoryId" value="<%= request.getParameter("categoryId") != null ? request.getParameter("categoryId") : "" %>">

                            <button type="submit" class="btn btn-primary">Sort</button>
                        </form>

                        <!-- Filter by Hot Products -->
                        <form method="GET" action="ProductURL" class="product-filter-form">
                            <input type="hidden" name="service" value="listAllProduct">

                            <label for="isHot">Sản phẩm hot:</label>
                            <select name="isHot" id="isHot" class="form-control">
                                <option value="">Tất cả</option>
                                <option value="1" <%= "1".equals(request.getParameter("isHot")) ? "selected" : "" %>>Sản phẩm hot</option>
                            </select>

                            <!-- Giữ lại các tham số tìm kiếm khác -->
                            <input type="hidden" name="pname" value="<%= request.getParameter("pname") != null ? request.getParameter("pname") : "" %>">
                            <input type="hidden" name="categoryId" value="<%= request.getParameter("categoryId") != null ? request.getParameter("categoryId") : "" %>">
                            <input type="hidden" name="sortBy" value="<%= request.getParameter("sortBy") != null ? request.getParameter("sortBy") : "" %>">

                            <button type="submit" class="btn btn-primary">Filter</button>
                        </form>
                    </div>

                    <p><a href="ProductURL?service=insertProduct" class="btn btn-success mb-4">Insert New Product</a></p>

                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>ProductId</th>
                                <th>ProductName <i class="fa fa-sort"></i></th>
                                <th>CategoryId</th>
                                <th>Price <i class="fa fa-sort"></i></th>
                                <th>Sale Price</th>
                                <th>Sold Quantity</th>
                                <th>Quantity</th>
                                <th>Description</th>
                                <th>Discontinued</th>
                                <th>Hot</th>
                                <th>CreateTime</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (vector != null && !vector.isEmpty()) { %>
                            <% for (Product product : vector) { %>
                            <tr>
                                <td><%= product.getProductId() %></td>
                                <td><%= product.getProductName() %></td>
                                <td><%= product.getCategoryId() %></td>
                                <td><%= product.getPrice() %></td>
                                <td><%= product.getSalePrice() > 0 ? product.getSalePrice() + "đ" : "N/A" %></td>
                                <td><%= product.getSoldQuantity() %></td>
                                <td><%= product.getQuantity() %></td>
                                <td><%= product.getDescription() %></td>
                                <td><%= product.isDiscontinued() ? "Yes" : "No" %></td>
                                <td><%= product.isHot() ? "Yes" : "No" %></td>
                                <td><%= product.getCreateTime() != null ? product.getCreateTime() : "N/A" %></td>
                                <td>
                                    <a href="ProductURL?service=updateProduct&pid=<%= product.getProductId() %>" class="edit" title="Update" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a href="ProductURL?service=deleteProduct&pid=<%= product.getProductId() %>" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <% } %>
                            <% } else { %>
                            <tr>
                                <td colspan="12" class="text-center">No products found.</td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>

                    <p><a href="ProductURL?service=insertProduct" class="btn btn-success">Insert New Product</a></p>
                </div>
            </div>  
        </div>
        <!-- footer start -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="full">
                            <div class="logo_footer">
                                <a href="#"><img width="100" src="images/logo.png" alt="#" /></a>
                            </div>
                            <div class="information_f">
                                <p><strong>Địa chỉ:</strong> TT02-01 MonCity, Ngõ 4 Hàm Nghi, Mỹ Đình 2, Nam Từ Liêm Hanoi, Vietnam</p>
                                <p><strong>Số điện thoại:</strong> +84 833 617 083</p>
                                <p><strong>Email:</strong> SportGear@gmail.com</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="widget_menu">
                                            <h3>Thương hiệu</h3>
                                            <ul>
                                                <li><a href="#">Trang chủ</a></li>
                                                <li><a href="#">Giới thiệu</a></li>
                                                <li><a href="#">Tin tức</a></li>
                                                <li><a href="#">Tuyển dụng</a></li>
                                                <li><a href="#">Hệ thống cửa hàng</a></li>
                                                <li><a href="#">Liên hệ</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="widget_menu">
                                            <h3>Hỗ trợ</h3>
                                            <ul>
                                                <li><a href="#">Hỏi đáp</a></li>
                                                <li><a href="#">Chính sách KHTT</a></li>
                                                <li><a href="#">Chính sách vận chuyển</a></li>
                                                <li><a href="#">Gợi ý tìm size</a></li>
                                                <li><a href="#">Kiểm tra đơn hàng</a></li>
                                                <li><a href="#">Chính sách bảo mật KH</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>     
                            <div class="col-md-5">
                                <div class="widget_menu">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
