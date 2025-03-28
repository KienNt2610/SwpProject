<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Product</title>
        <script type="text/javascript">
            // Hàm tính toán SalePrice tự động khi Price thay đổi
            function updateSalePrice() {
                var price = document.getElementById("Price").value;
                if (price > 0) {
                    // Giảm giá 10% cho SalePrice
                    var salePrice = price * 0.9;
                    document.getElementById("SalePrice").value = salePrice.toFixed(2); // Cập nhật SalePrice
                }
            }
        </script>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f9;
                display: flex;
                flex-direction: column;
                min-height: 100vh; /* Đảm bảo toàn bộ chiều cao màn hình */
            }

            /* Header styling */
            .header_section {
                position: sticky;
                top: 0;
                z-index: 2;
                padding: 15px 0;
                background-color: white;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 100%;
            }

            .header_section img {
                width: 100px; /* Điều chỉnh kích thước logo */
                margin-right: 15px;
                vertical-align: middle;
            }

            /* Sidebar */
            .sidebar {
                position: fixed;
                top: 180px; /* Đảm bảo không bị chồng lên header */
                left: 0;
                width: 250px;
                background-color: #4CAF50;
                color: white;
                padding-top: 20px;
                padding-left: 10px;
                padding-right: 10px;
                z-index: 1;
                height: calc(100% - 90px); /* Đảm bảo sidebar không bị che bởi header */
            }

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

            /* Content Section */
            .content {
                margin-left: 250px;
                padding: 20px;
                padding-top: 60px; /* Đảm bảo nội dung không bị che bởi header */
                flex: 1; /* Đảm bảo nội dung có thể giãn ra */
            }

            /* Form Styling */
            form {
                width: 100%;
                max-width: 800px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            table caption {
                font-size: 1.5em;
                font-weight: bold;
                margin-bottom: 20px;
            }

            table th, table td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }

            label {
                font-size: 14px;
                font-weight: 600;
                margin-bottom: 5px;
            }

            input[type="text"], input[type="number"], input[type="datetime-local"], select, textarea {
                width: 100%;
                padding: 8px;
                margin-bottom: 15px;
                border-radius: 5px;
                border: 1px solid #ddd;
            }

            button {
                padding: 10px 20px;
                background-color: #28a745;
                border: none;
                border-radius: 5px;
                color: white;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            button:hover {
                background-color: #218838;
            }

            .inline-form input[type="radio"] {
                margin-right: 10px;
            }

            /* Footer Styling */
            .footer {
                background-color: #f1f1f1;
                text-align: center;
                padding: 10px;
                position: relative;
                width: 100%;
                margin-top: auto; /* Đảm bảo footer luôn nằm dưới cùng */
            }

            /* Mobile Adjustments */
            @media screen and (max-width: 768px) {
                .sidebar {
                    position: absolute;
                    top: 60px;
                    left: 0;
                    width: 100%;
                    height: auto;
                }

                .content {
                    margin-left: 0;
                }

                form {
                    padding: 10px;
                }
            }

        </style>
    </head>
    <%
        Vector<Product> vector = (Vector<Product>) request.getAttribute("vector");
        Product product = vector.get(0); // Lấy sản phẩm từ vector
    %>
    <body>
        <!-- Sidebar -->
        <div class="sidebar">
            <h2>Menu</h2>
            <p><a href="ProductURL?service=listAllProduct">Quản lý sản phẩm</a></p>
            <p><a href="ProductDetailURL?service=listAllProductDetail">Quản lý sản chi tiết sản phẩm</a></p>
            <p><a href="OrderURL?service=listAllOrder">Quản lý đơn hàng</a></p>
            <p><a href="OrderDetailURL?service=listAllOrderDetail">Quản lý chi tiết đơn hàng</a></p>
            <p><a href="CategoryURL?service=listAllCategory">Quản lý danh mục</a></p>
            <p><a href="CustomerAddressURL?service=listAllCustomerAddress">Quản lý địa chỉ khách hàng</a></p>
        </div>
        <!-- Header Section -->
        <header class="header_section">
            <div class="container">
                <img src="images/logo.png" alt="SportGear Shop Logo">
                <h1>Cập nhật sản phẩm</h1>
            </div>
        </header>
        <form action="ProductURL" method="post" onsubmit="return updateSalePrice()">
            <input type="hidden" name="service" value="updateProduct">
            <table>
                
                <tr>
                    <td><label for="ProductId">Id sản phẩm</label></td>
                    <td><input type="number" name="ProductId" id="ProductId" value="<%= product.getProductId() %>" readonly></td>
                </tr>
                <tr>
                    <td><label for="ProductName">Tên sản phẩm</label></td>
                    <td><input type="text" name="ProductName" id="ProductName" value="<%= product.getProductName() %>" required></td>
                </tr>
                <tr>
                    <td><label for="CategoryId">Danh mục sản phẩm</label></td>
                    <td><input type="number" name="CategoryId" id="CategoryId" value="<%= product.getCategoryId() %>" required></td>
                </tr>
                <tr>
                    <td><label for="Price">Giá gốc</label></td>
                    <td><input type="number" name="Price" id="Price" value="<%= product.getPrice() %>" onchange="updateSalePrice()" required></td>
                </tr>
                <tr>
                    <td><label for="SalePrice">Giá sale</label></td>
                    <td><input type="text" name="SalePrice" id="SalePrice" value="<%= product.getSalePrice() %>" readonly required></td>
                </tr>
                <tr>
                    <td><label for="Quantity">Số lượng</label></td>
                    <td><input type="number" name="Quantity" id="Quantity" value="<%= product.getQuantity() %>" required></td>
                </tr>
                <tr>
                    <td><label for="Description">Mô tả sản phẩm</label></td>
                    <td><textarea name="Description" id="Description" required><%= product.getDescription() %></textarea></td>
                </tr>
                <tr>
                    <td><label for="Discontinued">Trạng thái sản phẩm</label></td>
                    <td>
                        <input type="radio" name="Discontinued" value="1" <%= product.isDiscontinued() ? "checked" : "" %>> Còn bán
                        <input type="radio" name="Discontinued" value="0" <%= !product.isDiscontinued() ? "checked" : "" %>> Đã ngừng bán
                    </td>
                </tr>
                <tr>
                    <td><label for="CreateTime">Thời gian cập nhật sản phẩm</label></td>
                    <td><input type="datetime-local" name="CreateTime" id="CreateTime" value="<%= product.getCreateTime() != null ? product.getCreateTime().toLocalDateTime().toString() : "" %>" required></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="Số lượng bán ra" value="0"></td> 
                </tr>
                <tr>
                    <td><input type="hidden" name="Hot" value="false"></td> 
                </tr>

                <tr>
                    <td><input type="submit" value="Xác nhận" name="submit"></td>
                    <td><input type="reset" value="Clear"></td>
                </tr>
            </table>
        </form>
        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2025 SPORTGEARSHOP</p>
        </footer>
    </body>
</html>
