<%-- 
    Document   : AdminDashboard
    Created on : Mar 28, 2025, 2:46:47 PM
    Author     : Kien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }
        .sidebar {
            background-color: #343a40;
            color: white;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            padding-top: 20px;
        }
        .sidebar a {
            color: white;
            padding: 15px;
            display: block;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .card {
            margin-bottom: 20px;
        }
        .navbar {
            background-color: #343a40;
            color: white;
        }
        .navbar-brand {
            font-weight: bold;
            color: white;
        }
        .footer {
            background-color: #343a40;
            color: white;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
    <body>

<!-- Sidebar -->
<div class="sidebar">
    <h4 class="text-center">Admin Dashboard</h4>
    <hr>
    <a href="/AdminDashboard.jsp">Dashboard</a>
    <a href="/ProductURL">Quản lý sản phẩm</a>
    <a href="#">Quản lý đơn hàng</a>
    <a href="/customerHome">Quản lý khách hàng</a>
    <a href="employeeManager">Quản lý nhân viên</a>  <%-- Thêm mục Quản lý nhân viên --%>
    <a href="#">Báo cáo doanh thu</a>
    <a href="#">Cài đặt</a>
    <a href="#">Đăng xuất</a>
</div>

<!-- Content -->
<div class="content">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">Admin Panel</a>
    </nav>

    <div class="container-fluid mt-4">
        <div class="row">
            <!-- Dashboard Cards -->
            <div class="col-md-3">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">Sản phẩm</h5>
                        <p class="card-text">Quản lý sản phẩm, thêm mới và chỉnh sửa sản phẩm.</p>
                        <a href="#" class="btn btn-light">Xem chi tiết</a>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <h5 class="card-title">Đơn hàng</h5>
                        <p class="card-text">Xem và quản lý các đơn hàng của khách hàng.</p>
                        <a href="#" class="btn btn-light">Xem chi tiết</a>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card text-white bg-warning">
                    <div class="card-body">
                        <h5 class="card-title">Khách hàng</h5>
                        <p class="card-text">Quản lý thông tin khách hàng và liên hệ.</p>
                        <a href="/customerHome" class="btn btn-light">Xem chi tiết</a>
                    </div>
                </div>
            </div>

            <%-- <div class="col-md-3">
                <div class="card text-white bg-info">
                    <div class="card-body">
                        <h5 class="card-title">Nhân viên</h5>  <%-- Thẻ Quản lý nhân viên mới --%>
                        <%--<p class="card-text">Quản lý nhân viên và phân công nhiệm vụ.</p>
                        <a href="#" class="btn btn-light">Xem chi tiết</a>
                    </div>
                </div>
            </div> --%>

            <div class="col-md-3">
                <div class="card text-white bg-danger">
                    <div class="card-body">
                        <h5 class="card-title">Báo cáo</h5>
                        <p class="card-text">Xem các báo cáo doanh thu và thống kê.</p>
                        <a href="#" class="btn btn-light">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Revenue Report Section -->
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Báo cáo doanh thu</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Tháng</th>
                                <th>Số đơn hàng</th>
                                <th>Doanh thu</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Tháng 9</td>
                                <td>120</td>
                                <td>150,000,000 VND</td>
                            </tr>
                            <tr>
                                <td>Tháng 8</td>
                                <td>110</td>
                                <td>135,000,000 VND</td>
                            </tr>
                            <tr>
                                <td>Tháng 7</td>
                                <td>130</td>
                                <td>160,000,000 VND</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2024 Admin Dashboard -Sport Store. All rights reserved.</p>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
