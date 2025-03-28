<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Vector" %>
<%@ page import="entity.Product" %>
<%@ page import="entity.Category" %>

<%
    // Lấy danh sách sản phẩm và danh mục từ request
    Vector<Product> productList = (Vector<Product>) request.getAttribute("data");
    Vector<Category> categoryList = (Vector<Category>) request.getAttribute("categoryList");

    // Xử lý giá trị categoryId từ request
    String selectedCategoryguest = request.getParameter("categoryId");
    int selectedCategoryIdguest = -1;

    if (selectedCategoryguest != null && !selectedCategoryguest.isEmpty()) {
        try {
            selectedCategoryIdguest = Integer.parseInt(selectedCategoryguest);
        } catch (NumberFormatException e) {
            selectedCategoryIdguest = -1; // Nếu lỗi, giữ giá trị mặc định
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

            /* Sidebar */
            .sidebar {
                position: fixed;
                top: 146px;
                left: 0;
                width: 260px;
                height: calc(100vh - 120px);
                background-color: #f8f8f8;
                padding: 20px;
                overflow-y: auto;
                z-index: 1;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            /* Các box trong sidebar */
            .sidebar form, .sidebar label, .sidebar select, .sidebar button {
                margin-bottom: 20px;
            }

            .sidebar label, .sidebar select, .sidebar button {
                font-size: 16px;
                color: #333;
            }

            .sidebar select, .sidebar button {
                border-radius: 8px;
                padding: 10px 15px;
                width: 100%;
                border: 1px solid #ddd;
                background-color: #ffffff;
                font-size: 16px;
                color: #333;
                transition: background-color 0.3s ease, border 0.3s ease;
            }

            .sidebar select:hover, .sidebar button:hover {
                background-color: #f1f1f1;
                border: 1px solid #f7444e;
            }

            .sidebar select:focus, .sidebar button:focus {
                outline: none;
                box-shadow: 0 0 5px rgba(247, 68, 78, 0.3);
            }

            /* Main Content */

            .product-card {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            /* Đảm bảo hình ảnh có chiều cao và chiều rộng phù hợp */
            .product-card .bg-image img {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }

            /* Tạo khoảng cách hợp lý giữa các phần tử trong thông tin sản phẩm */
            .product-info {
                padding: 15px;
                text-align: center;
            }

            /* Các thông tin như đánh giá, số lượng, mô tả đều phải gọn gàng */
            .product-info h5 {
                font-size: 16px;
                font-weight: 600;
            }

            .product-info .rating {
                font-size: 14px;
                color: #f7444e;
                margin: 10px 0;
            }

            .product-info .available, .product-info .sold {
                font-size: 14px;
                color: #777;
                margin: 5px 0;
            }

            .product-info .product-description {
                font-size: 14px;
                color: #555;
                margin: 10px 0;
                height: 40px; /* Giới hạn chiều cao mô tả */
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .product-price {
                font-size: 16px;
                font-weight: 600;
                margin-top: 10px;
            }

            /* Định dạng nút */
            .product-info .btn {
                padding: 10px 20px;
                font-size: 14px;
                text-transform: uppercase;
                border-radius: 5px;
                background-color: #f7444e;
                color: #fff;
                border: none;
                transition: all 0.3s ease;
            }

            .product-info .btn:hover {
                background-color: #d93d3b;
            }

            /* Sắp xếp các sản phẩm trong dòng, với mỗi box có kích thước đồng đều */
            .row {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: flex-start;
            }

            /* Điều chỉnh độ rộng của các cột sản phẩm */
            .col-md-12, .col-lg-4, .col-xl-3 {
                max-width: 23%;
                width: 100%;
                margin-bottom: 30px;
            }

            /* Responsive */
            @media (max-width: 991px) {
                .col-md-12, .col-lg-4, .col-xl-3 {
                    max-width: 45%; /* Đổi sang 2 sản phẩm trong một dòng khi màn hình nhỏ */
                }
            }

            @media (max-width: 768px) {
                .col-md-12, .col-lg-4, .col-xl-3 {
                    max-width: 100%; /* Đổi sang 1 sản phẩm trong một dòng khi màn hình rất nhỏ */
                }
            }

            /* Định dạng cho giá gốc khi có sale */
            .product-price .original-price {
                text-decoration: line-through; /* Gạch bỏ giá gốc */
                font-size: 14px;
                color: #999; /* Màu xám nhạt */
                margin-right: 10px; /* Khoảng cách với giá sale */
            }

            /* Định dạng cho giá sale */
            .product-price .sale-price {
                font-size: 18px;
                font-weight: bold;
                color: #f7444e; /* Màu đỏ cho giá sale */
                display: inline-block;
                transition: all 0.3s ease;
            }

            /* Thêm hiệu ứng khi hover vào giá sale */
            .product-price .sale-price:hover {
                transform: scale(1.1); /* Tăng kích thước khi hover vào giá sale */
                color: #d93d3b; /* Màu đỏ đậm hơn khi hover */
            }

            /* Đảm bảo giá gốc và giá sale có khoảng cách hợp lý */
            .product-price {
                margin-top: 10px;
                font-size: 16px;
                font-weight: 600;
            }

            /* Sửa lại độ rộng của các phần tử bên trong box sản phẩm */
            .product-info {
                padding: 15px;
                text-align: center;
            }

            /* Footer Styling */
            footer {
                background-color: #f8f8f8; /* Màu nền sáng cho footer */
                color: #333; /* Màu chữ tối */
                padding: 50px 0;
            }

            footer .container {
                max-width: 1200px;
                margin: 0 auto;
            }

            footer .row {
                display: flex;
                justify-content: space-between; /* Chia đều không gian giữa các cột */
                flex-wrap: wrap; /* Cho phép các phần tử thừa xuống dòng khi màn hình nhỏ */
            }

            footer .col-md-4, footer .col-md-3, footer .col-md-5 {
                flex: 1 1 30%; /* Các phần tử chia đều */
                padding: 10px;
                box-sizing: border-box;
                text-align: left;
            }

            /* Logo Footer */
            footer .logo_footer {
                margin-bottom: 30px;
            }

            footer .logo_footer img {
                width: 150px; /* Điều chỉnh kích thước logo */
                display: block;
            }

            /* Thông tin liên hệ */
            footer .information_f p {
                font-size: 14px;
                margin-bottom: 10px;
            }

            footer .information_f p strong {
                font-weight: bold;
            }

            /* Widget Menu - Link Menu */
            footer .widget_menu h3 {
                font-size: 18px;
                color: #f7444e;
                font-weight: bold;
                margin-bottom: 20px;
            }

            footer .widget_menu ul {
                list-style: none;
                padding: 0;
            }

            footer .widget_menu ul li {
                margin-bottom: 10px;
            }

            footer .widget_menu ul li a {
                color: #333;
                font-size: 14px;
                text-decoration: none;
                transition: color 0.3s ease;
            }

            footer .widget_menu ul li a:hover {
                color: #f7444e;
            }

            /* Form Đăng ký */
            footer .form_sub {
                background-color: #333;
                padding: 20px;
                border-radius: 10px;
                margin-top: 20px;
            }

            footer .form_sub .field {
                display: flex;
                flex-direction: column;
            }

            footer .form_sub .field input[type="email"] {
                padding: 12px;
                font-size: 14px;
                margin-bottom: 10px;
                border: none;
                border-radius: 8px;
                outline: none;
            }

            footer .form_sub .field input[type="email"]:focus {
                box-shadow: 0 0 5px rgba(247, 68, 78, 0.3);
            }

            footer .form_sub .field input[type="submit"] {
                padding: 12px;
                font-size: 14px;
                font-weight: bold;
                background-color: #f7444e;
                color: white;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            footer .form_sub .field input[type="submit"]:hover {
                background-color: #d93d3b;
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

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Tìm kiếm theo tên sản phẩm -->
            <form action="ProductURL" method="get" class="product-filter-form">
                <input type="hidden" name="service" value="guestProduct">

                <label for="pnameguest">Search by Name:</label>
                <input type="text" name="pnameguest" id="pnameguest" value="<%= request.getParameter("pnameguest") != null ? request.getParameter("pnameguest") : "" %>" class="form-control">

                <button type="submit" class="btn btn-primary">Xác nhận</button>
            </form>

            <!-- Lọc theo Category -->
            <form method="GET" action="ProductURL" class="product-filter-form">
                <input type="hidden" name="service" value="guestProduct">

                <label for="categoryId">Danh mục:</label>
                <select name="categoryId" id="categoryId" class="form-control">
                    <option value="">Tất cả sản phẩm</option>
                    <%
                        if (categoryList != null) {
                            for (Category category : categoryList) {
                    %>
                    <option value="<%= category.getCategoryId() %>"
                            <%= category.getCategoryId() == selectedCategoryIdguest ? "selected" : "" %> >
                        <%= category.getCategoryName() %>
                    </option>
                    <%
                            }
                        }
                    %>
                </select>

                <button type="submit" class="btn btn-primary">Xác nhận</button>
            </form>

            <!-- Sắp xếp sản phẩm -->
            <form method="GET" action="ProductURL" class="product-filter-form">
                <input type="hidden" name="service" value="guestProduct">

                <label for="sortBy">Sắp xếp theo:</label>
                <select name="sortBy" id="sortBy" class="form-control">
                    <option value="">Mặc định</option>
                    <option value="priceAsc">Giá thấp đến cao</option>
                    <option value="priceDesc">Giá cao đến thấp</option>
                    <option value="nameAsc">Tên từ A-Z</option>
                    <option value="nameDesc">Tên từ Z-A</option>
                </select>

                <button type="submit" class="btn btn-primary">Xác nhận</button>
            </form>

            <!-- Filter by Hot Products -->
            <form method="GET" action="ProductURL" class="product-filter-form">
                <input type="hidden" name="service" value="guestProduct">

                <label for="isHot">Sản phẩm hot:</label>
                <select name="isHot" id="isHot" class="form-control">
                    <option value="">Tất cả</option>
                    <option value="1" <%= "1".equals(request.getAttribute("isHot")) ? "selected" : "" %>>Sản phẩm hot</option>
                </select>

                <button type="submit" class="btn btn-primary">Xác nhận</button>
            </form>
        </div>

        <div class="main-content">
            <div class="container py-5">
                <div class="row justify-content-start">
                    <%
                        if (productList != null && !productList.isEmpty()) {
                            for (Product product : productList) {
                    %>
 
                    <div class="col-md-12 col-lg-4 col-xl-3 mb-4">
                        <div class="product-card">
                            <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                <!-- Hiển thị ảnh sản phẩm -->
                                <img src="<%= product.getImage() %>" class="w-100" />
                            </div>
                            <div class="product-info">
                                <h5><%= product.getProductName() %></h5>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <p class="available"><%= product.getQuantity() %> sản phẩm có sẵn</p>
                                <p class="sold"><%= product.getSoldQuantity() %> sản phẩm đã bán</p>

                                <p class="product-description">
                                    <%= product.getDescription() %>
                                </p>

                                <% if (product.isHot()) { %>
                                <span class="badge bg-danger">Hot</span>
                                <% } %>

                                <div class="product-price">
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
