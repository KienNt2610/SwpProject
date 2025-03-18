<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Product"%>

<%
    Vector<Product> vector = (Vector<Product>) request.getAttribute("data");
    String title = (String) request.getAttribute("title");
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            /* Thêm CSS để căn giữa tiêu đề bảng */
            .table-title {
                text-align: center;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-12"><h2><%= title != null ? title : "Product List" %></h2></div>
                        </div>
                    </div>

                    <!-- Search & Filter Form -->
                    <form action="ProductURL" method="get">
                        <p>Search by Name: <input type="text" name="pname" id="">
                            <input type="submit" value="Search" name="submit">
                            <input type="reset" value="Clear">
                        </p>
                    </form>


                    <form action="ProductURL" method="GET">
                        <input type="hidden" name="service" value="sort">
                        <input type="hidden" name="categoryId" value="<%= request.getParameter("categoryId") != null ? request.getParameter("categoryId") : "" %>">

                        <label for="sort">Sort By:</label>
                        <select name="sortBy" id="sort">
                            <option value="priceAsc" <%= "priceAsc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Price: Low to High</option>
                            <option value="priceDesc" <%= "priceDesc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Price: High to Low</option>
                            <option value="nameAsc" <%= "nameAsc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Name: A-Z</option>
                            <option value="nameDesc" <%= "nameDesc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Name: Z-A</option>
                        </select>

                        <button type="submit">Sort</button>
                    </form>


                    <form action="ProductURL" method="get">
                        <input type="hidden" name="service" value="filter">

                        <!-- Filter by CategoryId -->
                        <p>Category ID:
                            <input type="text" name="categoryId" value="<%= request.getParameter("categoryId") %>" placeholder="Enter Category ID">
                            <input type="submit" value="Filter">
                        </p>
                    </form>
                    <p><a href="ProductURL?service=insertProduct" class="btn btn-success">Insert New Product</a></p>


                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>ProductId</th>
                                <th>ProductName <i class="fa fa-sort"></i></th>
                                <th>CategoryId</th>
                                <th>Price <i class="fa fa-sort"></i></th>
                                <th>Quantity</th>
                                <th>Description</th>
                                <th>Discontinued</th>
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
                                <td><%= product.getQuantity() %></td>
                                <td><%= product.getDescription() %></td>
                                <td><%= product.isDiscontinued() ? "Yes" : "No" %></td>
                                <td>
                                    <a href="ProductURL?service=updateProduct&pid=<%= product.getProductId() %>" class="edit" title="Update" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a href="ProductURL?service=deleteProduct&pid=<%= product.getProductId() %>" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <% } %>
                            <% } else { %>
                            <tr>
                                <td colspan="8" class="text-center">No products found.</td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>

                    <p><a href="ProductURL?service=insertProduct" class="btn btn-success">Insert New Product</a></p>
                </div>
            </div>  
        </div>  
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
                                    <h3>Đăng ký ngay</h3>
                                    <div class="information_f">
                                        <p>Đăng ký ngay nào</p>
                                    </div>
                                    <div class="form_sub">
                                        <form>
                                            <fieldset>
                                                <div class="field">
                                                    <input type="email" placeholder="Enter Your Mail" name="email" />
                                                    <input type="submit" value="Subscribe" />
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>