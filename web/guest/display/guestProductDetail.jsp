<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Details</title>
        <!-- Thêm liên kết tới CSS từ template -->
        <link rel="stylesheet" href="css/styles_guestProductDetail.css"> <!-- Đảm bảo đường dẫn đúng -->
        <style>
            /* Header Section */
            .header_section {
                position: sticky; /* Đặt vị trí sticky để header luôn dính phía trên */
                top: 0; /* Gắn header ở đầu trang */
                z-index: 2; /* Đảm bảo header luôn nằm trên sidebar */
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
        <div class="super_container">
            <!-- Header -->
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
                                    <a class="nav-link" href="contact.html">Liên Hệ</a>
                                </li>
                                <li class="nav-item">
                                    <a href="Login.jsp" class="nav-link btn btn-primary">Đăng Nhập</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </header>

            <!-- Product Detail Section -->
            <div class="single_product">
                <div class="container-fluid" style="background-color: #fff; padding: 11px;">
                    <div class="row">
                        <div class="col-lg-2 order-lg-1 order-2">
                            <ul class="image_list">
                                <li data-image="${productImage1}"><img src="${productImage1}" alt=""></li>
                                <li data-image="${productImage2}"><img src="${productImage2}" alt=""></li>
                                <li data-image="${productImage3}"><img src="${productImage3}" alt=""></li>
                            </ul>
                        </div>
                        <div class="col-lg-4 order-lg-2 order-1">
                            <div class="image_selected"><img src="${productImage1}" alt=""></div>
                        </div>
                        <div class="col-lg-6 order-3">
                            <div class="product_description">


                                <div class="product_name">${productName}</div>
                                <div class="product-rating">
                                    <span class="badge badge-success" style="color: black;"><i class="fa fa-star"></i> 4.5 Sao</span>
                                    <span class="rating-review">35 Xếp hạng & 45 Đánh giá</span>
                                </div>
                                <div> 
                                    <span class="product_price">${productPrice} đ</span> 
                                    <strike class="product_discount"><span style="color:black">${productDiscount} </span></strike> 
                                </div>
                                <div> 

                                    <span style="color:black">${productSaved}</span> 
                                </div>
                                <hr class="singleline">
                                <div>
                                    <span class="product_info">${productInfo1}</span><br>
                                    <span class="product_info">${productInfo2}</span><br>
                                    <span class="product_info">${productInfo3}</span><br>
                                    <span class="product_info">${productInfo4}</span>
                                </div>
                                <div>
                                    <div>
                                        <form action="CartServlet" method="GET">
                                            <input type="hidden" name="service" value="addToCart"> <!-- Thông báo servlet là 'addToCart' -->
                                            <input type="hidden" name="productId" value="${product.productId}"> <!-- Truyền productId của sản phẩm -->

                                            <label for="color">Chọn màu:</label>
                                            <select id="color" name="color">
                                                <c:forEach var="color" items="${uniqueColors}">
                                                    <option value="${color}">${color}</option>
                                                </c:forEach>
                                            </select><br><br>

                                            <label for="size">Chọn size:</label>
                                            <select id="size" name="size">
                                                <c:forEach var="size" items="${uniqueSizes}">
                                                    <option value="${size}">${size}</option>
                                                </c:forEach>
                                            </select><br><br>

                                            <label for="quantity">Số lượng:</label>
                                            <input id="quantity_input" type="number" name="quantity" value="1" min="1"><br><br>

                                            <button type="submit">Thêm vào giỏ hàng</button>
                                            <button type="button" class="btn btn-success shop-button">Mua ngay</button>
                                        </form>




                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                                           <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2025 SPORTGEARSHOP</p>
        </footer>
    </body>
</html>
