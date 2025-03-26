<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Product, entity.Category"%>

<%
    Vector<Product> vector = (Vector<Product>) request.getAttribute("data");
    String title = (String) request.getAttribute("title");
    Vector<Category> categoryList = (Vector<Category>) request.getAttribute("categoryList");
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
            /* Cải thiện giao diện cho các form tìm kiếm và lọc */
            .sidebar {
                position: fixed;
                top: 150px;  /* Thêm khoảng cách từ trên cùng để không bị đè lên header */
                left: 0;
                bottom: 0;
                width: 250px;
                background-color: #4CAF50;
                color: white;
                padding-top: 20px;
                padding-left: 10px;
                padding-right: 10px;
                z-index: 2;  /* Đảm bảo sidebar luôn ở trên phần nội dung */
                height: calc(100% - 60px); /* Đảm bảo sidebar có chiều cao đầy đủ, tránh che header */
            }

            .content {
                margin-left: 250px; /* Đẩy nội dung sang phải để có chỗ cho sidebar */
                padding: 20px;
                padding-top: 60px;  /* Thêm padding-top để nội dung không bị che bởi header */
            }

            .header_section {
                position: sticky;
                top: 0;
                z-index: 3;  /* Đảm bảo header luôn nằm trên sidebar */
                padding: 15px 0;
                background-color: white;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 100%;
            }

            /* Sidebar Menu Styles */
            .sidebar h2 {
                margin-bottom: 20px;
            }

            .sidebar p {
                margin-bottom: 15px;
            }

            .sidebar a {
                display: block;
                text-decoration: none;
                color: white;
                padding: 10px;
                margin: 5px 0;
                background-color: #3e8e41;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .sidebar a:hover {
                background-color: #45a049;
            }

            /* Table Styling */
            table {
                width: 100%;
                margin-top: 20px;
                border-collapse: collapse;
            }

            table th, table td {
                padding: 10px;
                text-align: center;
                border: 1px solid #ddd;
            }

            /* Footer */
            footer {
                background-color: #f1f1f1;
                text-align: center;
                padding: 10px;
                position: fixed;
                width: 100%;
                bottom: 0;
            }

            /* Form Styling */
            .product-filter-form {
                display: flex;
                flex-direction: column;
                gap: 5px;
                max-width: 250px;
            }

            .inline-form {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 10px;
            }

            .inline-form input, .inline-form select {
                width: 150px;
                padding: 5px;
            }

            .inline-form label {
                margin-right: 10px;
            }

            .inline-form button {
                padding: 5px 15px;
            }

            /* Buttons Styling */
            .btn-primary {
                padding: 5px 15px;
                font-size: 14px;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

            .btn-success {
                background-color: #28a745;
                border: none;
                border-radius: 4px;
                padding: 5px 15px;
                font-size: 14px;
                transition: background-color 0.3s;
            }

            .btn-success:hover {
                background-color: #218838;
            }

            /* Ensure proper display on small screens */
            @media screen and (max-width: 768px) {
                .sidebar {
                    flex-direction: column;
                    align-items: flex-start;
                    width: 100%;  /* Sidebar takes full width on mobile */
                    height: auto; /* Avoid overflow issue */
                }

                .content {
                    margin-left: 0;
                }

                .inline-form {
                    width: 100%;
                    flex-direction: column;
                }

                .inline-form input, .inline-form select, .inline-form button {
                    width: 100%; /* Ensure form elements take full width on mobile */
                }
            }

        </style>
    </head>
    <body>
        <!-- Header Section -->
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

        <!-- Sidebar Menu -->
        <div class="sidebar">
            <h2>Menu</h2>
            <p><a href="ProductURL?service=listAllProduct">Product controller</a></p>
            <p><a href="ProductDetailURL?service=listAllProductDetail">ProductDetail controller</a></p>
            <p><a href="OrderURL?service=listAllOrder">Order controller</a></p>
            <p><a href="OrderDetailURL?service=listAllOrderDetail">OrderDetail controller</a></p>
            <p><a href="CartURL?service=listAllCart">Cart controller</a></p>
            <p><a href="CartDetailURL?service=listAllCartDetail">CartDetail controller</a></p>
            <p><a href="CategoryURL?service=listAllCategory">Category controller</a></p>
            <p><a href="CustomerAddressURL?service=listAllCustomerAddress">CustomerAddress controller</a></p>
        </div>

        <!-- Main Content Area -->
        <div class="content">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <h2><%= title != null ? title : "Product List" %></h2>
                    </div>

                    <!-- Filter Forms -->
                    <div class="d-flex justify-content-start mb-4">
                        <!-- Tìm kiếm theo tên sản phẩm -->
                        <form action="ProductURL" method="get" class="product-filter-form inline-form">
                            <input type="hidden" name="service" value="listAllProduct">
                            <label for="pname">Tìm kiếm sản phẩm:</label>
                            <input type="text" name="pname" id="pname" value="<%= request.getParameter("pname") != null ? request.getParameter("pname") : "" %>" class="form-control">
                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                        </form>

                        <!-- Lọc theo Category -->
                        <form method="GET" action="ProductURL" class="product-filter-form inline-form">
                            <input type="hidden" name="service" value="listAllProduct">
                            <label for="categoryId">Danh mục:</label>
                            <select name="categoryId" id="categoryId" class="form-control">
                                <option value="">Tất cả sản phẩm</option>
                                <option value="1" <%= "1".equals(request.getParameter("categoryId")) ? "selected" : "" %>>Bóng đá</option>
                                <option value="2" <%= "2".equals(request.getParameter("categoryId")) ? "selected" : "" %>>Cầu lông</option>
                                <option value="3" <%= "3".equals(request.getParameter("categoryId")) ? "selected" : "" %>>Bóng bàn</option>
                                <option value="4" <%= "4".equals(request.getParameter("categoryId")) ? "selected" : "" %>>Tenis</option>
                                <option value="5" <%= "5".equals(request.getParameter("categoryId")) ? "selected" : "" %>>Phụ kiện thể thao</option>
                                <option value="6" <%= "6".equals(request.getParameter("categoryId")) ? "selected" : "" %>>Quần áo thể thao</option>
                            </select>
                            <input type="hidden" name="pname" value="<%= request.getParameter("pname") != null ? request.getParameter("pname") : "" %>">
                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                        </form>

                        <!-- Sắp xếp sản phẩm -->
                        <form method="GET" action="ProductURL" class="product-filter-form inline-form">
                            <input type="hidden" name="service" value="listAllProduct">
                            <label for="sortBy">Sắp xếp theo:</label>
                            <select name="sortBy" id="sortBy" class="form-control">
                                <option value="">Mặc định</option>
                                <option value="priceAsc" <%= "priceAsc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Giá thấp đến cao</option>
                                <option value="priceDesc" <%= "priceDesc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Giá cao đến thấp</option>
                                <option value="nameAsc" <%= "nameAsc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Tên từ A-Z</option>
                                <option value="nameDesc" <%= "nameDesc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Tên từ Z-A</option>
                            </select>
                            <input type="hidden" name="pname" value="<%= request.getParameter("pname") != null ? request.getParameter("pname") : "" %>">
                            <input type="hidden" name="categoryId" value="<%= request.getParameter("categoryId") != null ? request.getParameter("categoryId") : "" %>">
                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                        </form>

                        <!-- Filter by Hot Products -->
                        <form method="GET" action="ProductURL" class="product-filter-form inline-form">
                            <input type="hidden" name="service" value="listAllProduct">
                            <label for="isHot">Sản phẩm hot:</label>
                            <select name="isHot" id="isHot" class="form-control">
                                <option value="">Tất cả</option>
                                <option value="1" <%= "1".equals(request.getParameter("isHot")) ? "selected" : "" %>>Sản phẩm hot</option>
                            </select>
                            <input type="hidden" name="pname" value="<%= request.getParameter("pname") != null ? request.getParameter("pname") : "" %>">
                            <input type="hidden" name="categoryId" value="<%= request.getParameter("categoryId") != null ? request.getParameter("categoryId") : "" %>">
                            <input type="hidden" name="sortBy" value="<%= request.getParameter("sortBy") != null ? request.getParameter("sortBy") : "" %>">
                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                        </form>
                    </div>

                    <p><a href="ProductURL?service=insertProduct" class="btn btn-success mb-4">Thêm sản phẩm mới</a></p>

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

                    <p><a href="ProductURL?service=insertProduct" class="btn btn-success">Thêm sản phẩm mới</a></p>
                </div>
            </div>  
        </div>

        <!-- Footer -->
        <footer>
            <div class="container">
                <p>&copy; 2025 SPORTGEARSHOP</p>
            </div>
        </footer>
    </body>
</html>
