<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
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
        <title>Login</title>
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

        <div class="d-lg-flex half">
            <div class="bg order-1 order-md-2" style="background-image: url('images/bg_1.jpg');"></div>
            <div class="contents order-2 order-md-1">

                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7">
                            <div class="mb-4">
                                <h3>Đăng Nhập</h3>
                            </div>

                            <form action="LoginURL" method="post">
                                <input type="hidden" name="service" value="login"> <!-- Chỉ định action cho login -->

                                <div class="form-group first">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="username" name="username" required>
                                </div>

                                <div class="form-group last mb-3">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>

                                <div class="d-flex mb-5 align-items-center">


                                </div>

                                <input type="submit" value="Đăng Nhập" class="btn btn-block btn-primary">

                                <span class="d-block text-center my-4 text-muted">&mdash; or &mdash;</span>

                                <div class="social-login">
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openied 
                                       &redirect_uri=http://localhost:8080/SwpProject/LoginURL
                                       &response_type=code
                                       &client_id=2226866107-h2ejeutr11vkf4u4bki43ptk6h3jq660.apps.googleusercontent.com"
                                       &approval_prompt=force" class="google btn d-flex justify-content-center align-items-center">
                                        <span class="icon-google mr-3"></span> Đăng nhập với Google
                                    </a>
                                </div>
                                <p>Đăng ký tài khoản mới! <a href="/SwpProject/guest/display/customerRegister.jsp">Đăng ký</a></p>
                            </form>


                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger">
                                    ${errorMessage}
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <footer>
            <div class="container">
                <p>&copy; 2025 SPORTGEARSHOP</p>
            </div>
        </footer>
    </body>
</html>
