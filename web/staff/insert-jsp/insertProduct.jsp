<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.util.Vector"%> 
<%@page import="entity.Product"%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Insert Product</title>
        <script type="text/javascript">
            function validateForm() {
                var price = document.getElementById("Price").value;
                var quantity = document.getElementById("Quantity").value;

                if (price <= 0) {
                    alert("Price must be a positive number.");
                    return false;
                }

                if (quantity <= 0 || !Number.isInteger(Number(quantity))) {
                    alert("Quantity must be a positive integer.");
                    return false;
                }

                var salePrice = price * 0.9;  // Giảm giá 10%
                document.getElementById("SalePrice").value = salePrice.toFixed(2); // Hiển thị SalePrice

                return true;
            }
        </script>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
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
                top: 170px;
                left: 0;
                width: 250px;
                background-color: #4CAF50;
                color: white;
                padding-top: 20px;
                padding-left: 10px;
                padding-right: 10px;
                z-index: 1;
                height: calc(100% - 60px);
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
                padding-top: 60px;
            }

            /* Form Styling */
            form {
                width: 100%;
                max-width: 800px;
                margin: 0 auto;
                background-color: #f9f9f9;
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

            .footer {
                background-color: #f1f1f1;
                text-align: center;
                padding: 10px;
                position: fixed;
                width: 100%;
                bottom: 0;
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
            /* Footer Styling */
            .footer {
                background-color: #f1f1f1;
                text-align: center;
                padding: 10px;
                position: relative;
                width: 100%;
                margin-top: auto; /* Đảm bảo footer luôn nằm dưới cùng */
            }
        </style>
    </head>
    <body>
        <!-- Sidebar -->
        <div class="sidebar">
            <h2>Menu</h2>
            <p><a href="ProductURL?service=listAllProduct">Quản lý sản phẩm</a></p>
            <p><a href="ProductDetailURL?service=listAllProductDetail">Quản lý chi tiết sản phẩm</a></p>
            <p><a href="OrderURL?service=listAllOrder">Quản lý đơn hàng</a></p>
            <p><a href="OrderDetailURL?service=listAllOrderDetail">Quản lý chi tiết đơn hàng</a></p>
            <p><a href="CartURL?service=listAllCart">Cart controller</a></p>
            <p><a href="CustomerAddressURL?service=listAllCustomerAddress">Quản lý địa chỉ khách hàng</a></p>
        </div>

        <!-- Header Section -->
        <header class="header_section">
            <div class="container">
                <nav class="navbar navbar-expand-lg custom_nav-container">
                    <a class="navbar-brand" href="index.html">
                        <img width="100" src="images/logo.png" alt="SportGear Shop" />
                    </a>
                    <h1>Thêm sản phẩm mới</h1>
                </nav>
            </div>
        </header>

        <!-- Main Content Area -->
        <div class="content">
            <form action="ProductURL" method="post" onsubmit="return validateForm()">
                <input type="hidden" name="service" value="insertProduct">
                <table>
   
                    <tr>
                        <td><label for="ProductName">Tên sản phẩm</label></td>
                        <td><input type="text" name="ProductName" id="ProductName" required></td>
                    </tr>
                    <tr>
                        <td><label for="CategoryId">Danh mục</label></td>
                        <td>
                            <select name="CategoryId" id="CategoryId" required>
                                <option value="1">Bóng đá</option>
                                <option value="2">Cầu lông</option>
                                <option value="3">Bóng bàn</option>
                                <option value="4">Tenis</option>
                                <option value="5">Phụ kiện thể thao</option>
                                <option value="6">Quần áo thể thao</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="Price">Giá gốc</label></td>
                        <td><input type="number" name="Price" id="Price" onchange="validateForm()" required></td>
                    </tr>
                    <tr>
                        <td><label for="SalePrice">Giá sale</label></td>
                        <td><input type="text" name="SalePrice" id="SalePrice" readonly required></td>
                    </tr>
                    <tr>
                        <td><label for="Quantity">Số lượng</label></td>
                        <td><input type="number" name="Quantity" id="Quantity" required></td>
                    </tr>
                    <tr>
                        <td><label for="SoldQuantity">Số lượng bán ra</label></td>
                        <td><input type="number" name="SoldQuantity" id="SoldQuantity" value="0" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="Description">Mô tả sản phẩm</label></td>
                        <td><textarea name="Description" id="Description" required></textarea></td>
                    </tr>
                    <tr>
                        <td><label for="Discontinued">Trạng thái cung cấp</label></td>
                        <td>
                            <input type="radio" name="Discontinued" id="Discontinued" value="1" checked> Còn bán
                            <input type="radio" name="Discontinued" id="Discontinued" value="0"> Đã ngừng bán
                        </td>
                    </tr>
                    <tr>
                        <td><label for="IsHot">Hot</label></td>
                        <td>
                            <input type="radio" name="IsHot" id="IsHot" value="false" checked> Không
                            <input type="radio" name="IsHot" id="IsHot" value="true"> Có
                        </td>
                    </tr>
                    <tr>
                        <td><label for="CreateTime">Ngày thêm sản phẩm</label></td>
                        <td><input type="datetime-local" name="CreateTime" id="CreateTime" value="<%= new java.util.Date().toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDateTime() %>"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Xác nhận" name="submit"></td>
                        <td><input type="reset" value="Clear"></td>
                    </tr>
                </table>
            </form>
        </div>
        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2025 SPORTGEARSHOP</p>
        </footer>
    </body>
</html>
