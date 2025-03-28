<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.Vector, entity.ProductDetail" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details List</title>
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f7f7f7;
                display: flex;
                flex-direction: row;
                height: 100vh;
            }

            /* Sidebar */
            .sidebar {
                width: 210px;
                background-color: #4CAF50;
                color: white;
                padding: 20px;
                height: 100%;
                position: fixed;
                z-index: 2;
                box-shadow: 4px 0px 10px rgba(0, 0, 0, 0.1);
            }

            .sidebar h2 {
                margin-bottom: 20px;
                font-size: 24px;
                font-weight: bold;
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

            /* Main content */
            .content {
                margin-left: 250px; /* Sidebar width */
                width: 100%;
                padding: 20px;
                background-color: #fff;
                overflow: auto;
            }

            .header_section {
                position: sticky;
                top: 0;
                padding: 15px 0;
                background-color: white;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 100%;
                z-index: 1;
            }

            /* Table Styling */
            table {
                width: 100%;
                margin-top: 20px;
                border-collapse: collapse;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            }

            table th, table td {
                padding: 10px;
                text-align: center;
                border: 1px solid #ddd;
            }

            table th {
                background-color: #f2f2f2;
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

            /* Footer */
            footer {
                background-color: #f1f1f1;
                text-align: center;
                padding: 10px;
                position: fixed;
                width: 100%;
                bottom: 0;
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

            /* Responsive Layout */
            @media screen and (max-width: 768px) {
                .sidebar {
                    position: static;
                    width: 100%;
                    padding: 15px;
                    height: auto;
                }

                .content {
                    margin-left: 0;
                    width: 100%;
                }

                .inline-form {
                    width: 100%;
                    flex-direction: column;
                }

                .inline-form input, .inline-form select, .inline-form button {
                    width: 100%;
                }
            }

        </style>
    </head>

    <body>
        <!-- Sidebar Menu -->
        <div class="sidebar">
            <h2>Menu</h2>
            <p><a href="ProductURL?service=listAllProduct">Quản lý sản phẩm</a></p>
            <p><a href="ProductDetailURL?service=listAllProductDetail">Quản lý chi tiết sản phẩm</a></p>
            <p><a href="OrderURL?service=listAllOrder">Quản lý đơn hàng</a></p>
            <p><a href="OrderDetailURL?service=listAllOrderDetail">Quản lý chi tiết đơn hàng</a></p>
            <p><a href="RoleURL?service=listAllRole">Quản lý Vai trò</a></p>
            <p><a href="CategoryURL?service=listAllCategory">Quản lý mặt hàng</a></p>
            <p><a href="CustomerAddressURL?service=listAllCustomerAddress">Quản lý địa chỉ khách hàng</a></p>
        </div>

        <!-- Main Content -->
        <div class="content">
            <div class="header_section">
                <h1>Quản Lý Chi Tiết Sản Phẩm</h1>
            </div>

            <%
                // Lấy dữ liệu từ request để hiển thị kết quả
                Vector<ProductDetail> vector = (Vector<ProductDetail>) request.getAttribute("data");
                String title = (String) request.getAttribute("title");
                String errorMessage = (String) request.getAttribute("errorMessage");
            %>

            <form action="ProductDetailURL" method="get" class="product-filter-form inline-form">
                <input type="hidden" name="service" value="filterProductDetail">
                <label for="productId">Tìm kiếm sản phẩm theo ProductId:</label>
                <input type="number" name="productId" id="productId" value="<%= request.getParameter("productId") != null ? request.getParameter("productId") : "" %>" class="form-control">
                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
            </form>

            <%
                if (errorMessage != null) {
                    out.println("<p style='color:red;'>" + errorMessage + "</p>");
                }
            %>

            <p><a href="ProductDetailURL?service=insertProductDetail">Insert ProductDetail</a></p>

            <table border="1px">
                <caption><%= title != null ? title : "Product Details List" %></caption>
                <tr>
                    <th>DetailId</th>
                    <th>ProductId</th>
                    <th>Color</th>
                    <th>Size</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                <% 
                    if (vector != null && !vector.isEmpty()) {
                        for (ProductDetail productDetail : vector) { 
                %>
                <tr>
                    <td><%= productDetail.getDetailId() %></td>
                    <td><%= productDetail.getProductId() %></td>
                    <td><%= productDetail.getColor() %></td>
                    <td><%= productDetail.getSize() %></td>
                    <td><a href="ProductDetailURL?service=updateProductDetail&detailId=<%= productDetail.getDetailId() %>">Update</a></td>
                    <td><a href="ProductDetailURL?service=deleteProductDetail&detailId=<%= productDetail.getDetailId() %>">Delete</a></td>
                </tr>  
                <% 
                        }
                    } else {
                %>
                <tr><td colspan="6" style="text-align:center;">No results found for the given search criteria.</td></tr>
                <% } %>
            </table>


        </div>
        <!-- Footer -->
        <footer>
            <div class="container">
                <p>&copy; 2025 SPORTGEARSHOP</p>
            </div>
        </footer>
    </body>
</html>
