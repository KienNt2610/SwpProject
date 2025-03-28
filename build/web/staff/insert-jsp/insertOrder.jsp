<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="entity.Order"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Order</title>
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
            <p><a href="ProductURL?service=listAllProduct">Product controller</a></p>
            <p><a href="ProductDetailURL?service=listAllProductDetail">ProductDetail controller</a></p>
            <p><a href="OrderURL?service=listAllOrder">Order controller</a></p>
            <p><a href="OrderDetailURL?service=listAllOrderDetail">OrderDetail controller</a></p>
            <p><a href="CartURL?service=listAllCart">Cart controller</a></p>
            <p><a href="CartDetailURL?service=listAllCartDetail">CartDetail controller</a></p>
            <p><a href="CategoryURL?service=listAllCategory">Category controller</a></p>
            <p><a href="CustomerAddressURL?service=listAllCustomerAddress">CustomerAddress controller</a></p>
        </div>

        <!-- Header Section -->
        <header class="header_section">
            <div class="container">
                <nav class="navbar navbar-expand-lg custom_nav-container">
                    <a class="navbar-brand" href="index.html">
                        <img width="100" src="images/logo.png" alt="SportGear Shop" />
                    </a>
                    <h1>Insert New Product</h1>
                </nav>
            </div>
        </header>
        <form action="OrderURL" method="post">
        <input type="hidden" name="service" value="insertOrder">
        <table>
            <caption>Insert Order</caption>
            <tr>
                <td><label for="OrderId">OrderId</label></td>
                <td><input type="number" name="OrderId" id="OrderId" readonly></td>
            </tr>
            <tr>
                <td><label for="CustomerId">CustomerId</label></td>
                <td><input type="number" name="CustomerId" id="CustomerId"></td>
            </tr>
            <tr>
                <td><label for="TotalPrice">TotalPrice</label></td>
                <td><input type="number" name="TotalPrice" id="TotalPrice"></td>
            </tr>
            <tr>
                <td><label for="Date">Date</label></td>
                <td><input type="date" name="Date" id="Date"></td>
            </tr>
            <tr>
                <td><label for="Message">Message</label></td>
                <td><textarea name="Message" id="Message"></textarea></td>
            </tr>
            <tr>
                <td><label for="EmployeeId">EmployeeId</label></td>
                <td><input type="number" name="EmployeeId" id="EmployeeId"></td>
            </tr>
            <tr>
                <td><input type="submit" value="insertOrder" name="submit"></td>
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