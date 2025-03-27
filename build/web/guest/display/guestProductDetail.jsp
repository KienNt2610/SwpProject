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
    </head>
    <body>
        <div class="super_container">
            <!-- Header -->
            <header class="header" style="display: none;">
                <div class="header_main">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
                                <div class="header_search">
                                    <div class="header_search_content">
                                        <div class="header_search_form_container">
                                            <form action="#" class="header_search_form clearfix">
                                                <div class="custom_dropdown">
                                                    <div class="custom_dropdown_list"> <span class="custom_dropdown_placeholder clc">All Categories</span> <i class="fas fa-chevron-down"></i>
                                                        <ul class="custom_list clc">
                                                            <li><a class="clc" href="#">All Categories</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
                                <nav>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index_1.html">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="ProductURL?service=guestProduct">Tất cả sản phẩm</a></li>
                                        <li class="breadcrumb-item active">${categoryName}</li>
                                    </ol>
                                </nav>

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
    </body>
</html>
