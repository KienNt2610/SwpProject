<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <title>Giỏ Hàng</title>
        <style>
            /* Reset CSS */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                line-height: 1.6;
                background-color: #f5f5f5;
                color: #333;
            }

            /* Header */
            h1 {
                text-align: center;
                color: #2c3e50;
                margin: 30px 0;
                font-size: 2.5em;
                text-transform: uppercase;
                letter-spacing: 2px;
            }

            /* Cart Table */
            table {
                width: 90%;
                max-width: 1200px;
                margin: 20px auto;
                background: white;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                border-collapse: collapse;
            }

            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #2c3e50;
                color: white;
                font-weight: 500;
            }

            tr:hover {
                background-color: #f9f9f9;
            }

            /* Quantity Controls */
            td input[type="text"] {
                width: 50px;
                text-align: center;
                border: 1px solid #ddd;
                border-radius: 4px;
                padding: 5px;
                margin: 0 10px;
            }

            td a {
                display: inline-block;
                width: 30px;
                height: 30px;
                line-height: 30px;
                text-align: center;
                background-color: #3498db;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            td a:hover {
                background-color: #2980b9;
            }

            /* Remove Button */
            input[type="submit"] {
                background-color: #e74c3c;
                color: white;
                border: none;
                padding: 8px 15px;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #c0392b;
            }

            /* Total Section */
            h3 {
                text-align: right;
                margin: 20px 5%;
                font-size: 1.5em;
                color: #2c3e50;
            }

            /* Checkout Button */
            a[href="checkout.jsp"] {
                display: inline-block;
                background-color: #2ecc71;
                color: white;
                text-decoration: none;
                padding: 12px 30px;
                border-radius: 4px;
                margin: 20px 5%;
                transition: background-color 0.3s;
            }

            a[href="checkout.jsp"]:hover {
                background-color: #27ae60;
            }

            /* Empty Cart Message */
            p {
                text-align: center;
                color: #7f8c8d;
                font-size: 1.2em;
                margin: 30px 0;
            }

            /* Error Message */
            .error {
                background-color: #fde8e8;
                color: #c53030;
                padding: 10px;
                border-radius: 4px;
                margin: 10px 5%;
                text-align: center;
            }

            /* Success Message */
            .message {
                background-color: #e8f5e9;
                color: #2e7d32;
                padding: 10px;
                border-radius: 4px;
                margin: 10px 5%;
                text-align: center;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                table {
                    width: 95%;
                    font-size: 0.9em;
                }

                th, td {
                    padding: 10px;
                }

                td input[type="text"] {
                    width: 40px;
                }

                td a {
                    width: 25px;
                    height: 25px;
                    line-height: 25px;
                }
            }
            /* Header Section */
            .header_section {
                position: sticky;
                top: 0;
                z-index: 2;
                padding: 15px 0;
                background-color: white;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            }

            .header_section .container-fluid {
                padding-right: 25px;
                padding-left: 25px;
            }

            .navbar-brand {
                font-family: 'Playfair Display', serif;
            }

            .navbar-brand span {
                font-weight: bold;
                font-size: 32px;
                color: #000000;
            }

            .custom_nav-container {
                padding: 0;
            }

            .custom_nav-container .navbar-nav {
                margin-left: auto;
            }

            .custom_nav-container .navbar-nav .nav-item .nav-link {
                padding: 5px 20px;
                color: #131313;
                text-align: center;
                text-transform: uppercase;
                border-radius: 5px;
                -webkit-transition: all 0.3s;
                transition: all 0.3s;
                font-weight: 700;
            }

            .custom_nav-container .navbar-nav .nav-item .nav-link svg {
                width: 17px;
                height: auto;
                fill: #000000;
                margin-bottom: 2px;
            }

            .custom_nav-container .navbar-nav .nav-item:hover .nav-link,
            .custom_nav-container .navbar-nav .nav-item.active .nav-link {
                color: #f7444e;
            }

            .custom_nav-container .navbar-nav .nav-item:hover .nav-link svg,
            .custom_nav-container .navbar-nav .nav-item.active .nav-link svg {
                fill: #f7444e;
            }

            .custom_nav-container .nav_search-btn {
                width: 35px;
                height: 35px;
                padding: 0;
                border: none;
                color: #000000;
            }

            .custom_nav-container .nav_search-btn:hover {
                color: #f7444e;
            }

            .custom_nav-container .navbar-toggler {
                outline: none;
            }

            .custom_nav-container .navbar-toggler {
                padding: 0;
                width: 37px;
                height: 42px;
                -webkit-transition: all 0.3s;
                transition: all 0.3s;
            }

            .custom_nav-container .navbar-toggler span {
                display: block;
                width: 35px;
                height: 4px;
                background-color: #000000;
                margin: 7px 0;
                -webkit-transition: all 0.3s;
                transition: all 0.3s;
                position: relative;
                border-radius: 5px;
                transition: all 0.3s;
            }

            .custom_nav-container .navbar-toggler span::before,
            .custom_nav-container .navbar-toggler span::after {
                content: "";
                position: absolute;
                left: 0;
                height: 100%;
                width: 100%;
                background-color: #000000;
                top: -10px;
                border-radius: 5px;
                -webkit-transition: all 0.3s;
                transition: all 0.3s;
            }

            .custom_nav-container .navbar-toggler span::after {
                top: 10px;
            }

            .custom_nav-container .navbar-toggler[aria-expanded="true"] {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }

            .custom_nav-container .navbar-toggler[aria-expanded="true"] span {
                -webkit-transform: rotate(45deg);
                transform: rotate(45deg);
            }

            .custom_nav-container .navbar-toggler[aria-expanded="true"] span::before,
            .custom_nav-container .navbar-toggler[aria-expanded="true"] span::after {
                -webkit-transform: rotate(90deg);
                transform: rotate(90deg);
                top: 0;
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
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class=""> </span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item active">
                                <a class="nav-link" href="index_1.html">Trang chủ</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"> Sản phẩm <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="about.html">Bóng đá</a></li>
                                    <li><a href="testimonial.html">Cầu lông</a></li>
                                    <li><a href="about.html">Bóng bàn</a></li>
                                    <li><a href="testimonial.html">Tennis</a></li>
                                    <li><a href="about.html">Phụ kiện thể thao</a></li>
                                    <li><a href="testimonial.html">Quần áo</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ProductURL?service=guestProduct">Tất Cả Sản Phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.html">Liên Hệ</a>
                            </li>

                        </ul>
                    </div>
                </nav>
            </div>
        </header>

        <h1>Giỏ Hàng</h1>
        <c:set var="cartList" value="${sessionScope['cart-list']}" />
        <c:if test="${empty cartList}">
            <p>Giỏ hàng của bạn đang trống</p>
        </c:if>
        <c:if test="${not empty cartList}">
            <table>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Màu sắc</th>
                    <th>Kích thước</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                    <th>Thao tác</th>
                </tr>
                <c:forEach items="${cartList}" var="item">
                    <tr>
                        <td>${item.productName}</td>
                        <td>${item.color}</td>
                        <td>${item.size}</td>
                        <td><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="VND"/></td>
                        <td>
                            <a href="CartServlet?action=update&id=${item.productId}&quantity=${item.quantity - 1}">-</a>
                            <input type="text" readonly value="${item.quantity}" />
                            <a href="CartServlet?action=update&id=${item.productId}&quantity=${item.quantity + 1}">+</a>
                        </td>
                        <td><fmt:formatNumber value="${item.totalPrice}" type="currency" currencySymbol="VND"/></td>
                        <td>
                            <form action="CartServlet" method="post">
                                <input type="hidden" name="action" value="remove" />
                                <input type="hidden" name="id" value="${item.productId}" />
                                <input type="submit" value="Xóa" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <h3>Tổng tiền: <fmt:formatNumber value="${totalCartValue}" type="currency" currencySymbol="VND"/></h3>
            <a href="checkout.jsp">Thanh toán</a>
        </c:if>
        <!-- Footer -->
        <footer>
            <div class="container">
                <p>&copy; 2025 SPORTGEARSHOP</p>
            </div>
        </footer>
    </body>
</html>
