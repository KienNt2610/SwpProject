<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <title>Bootstrap Simple Registration Form</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #fff;
                background: #ffffff;
                font-family: 'Roboto', sans-serif;
            }
            .form-control {
                height: 40px;
                box-shadow: none;
                color: #969fa4;
            }
            .form-control:focus {
                border-color: #5cb85c;
            }
            .form-control, .btn {
                border-radius: 3px;
            }
            .signup-form {
                width: 450px;
                margin: 0 auto;
                padding: 30px 0;
                font-size: 15px;
            }
            .signup-form h2 {
                color: #636363;
                margin: 0 0 15px;
                position: relative;
                text-align: center;
            }
            .signup-form h2:before, .signup-form h2:after {
                content: "";
                height: 2px;
                width: 30%;
                background: #d4d4d4;
                position: absolute;
                top: 50%;
                z-index: 2;
            }
            .signup-form h2:before {
                left: 0;
            }
            .signup-form h2:after {
                right: 0;
            }
            .signup-form .hint-text {
                color: #999;
                margin-bottom: 30px;
                text-align: center;
            }
            .signup-form form {
                color: #999;
                border-radius: 3px;
                margin-bottom: 15px;
                background: #f2f3f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }
            .signup-form .form-group {
                margin-bottom: 20px;
            }
            .signup-form input[type="checkbox"] {
                margin-top: 3px;
            }
            .signup-form .btn {
                font-size: 16px;
                font-weight: bold;
                min-width: 140px;
                outline: none !important;
                background-color: #FFA500; /* Đổi màu nút thành cam nhạt */
                color: white;
                border: none;
            }
            .signup-form .row div:first-child {
                padding-right: 10px;
            }
            .signup-form .row div:last-child {
                padding-left: 10px;
            }
            .signup-form a {
                color: #fff;
                text-decoration: underline;
            }
            .signup-form a:hover {
                text-decoration: none;
            }
            .signup-form form a {
                color: #5cb85c;
                text-decoration: none;
            }
            .signup-form form a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="signup-form">
            <form action="<c:url value='/RegisterURL'/>" method="POST">
                <h2>Đăng ký</h2>
                <p class="hint-text">Đăng ký tài khoản mới cho bạn ngay bây giờ. Chỉ trong một vài phút.</p>
                <!-- Adding the previous fields from the JSP -->

                <div class="form-group">
                    <input type="text" class="form-control" name="customer_name" placeholder="Tên đầy đủ" required="required">
                </div>

                <div class="form-group">
                    <input type="text" id="username" name="username" placeholder="Tên đăng nhập" class="input_field form-control" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required="required">
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" name="email" placeholder="Email" required="required">
                </div>

                <div class="form-group">
                    <input type="password" class="form-control" name="confirm_password" placeholder="Xác nhận mật khẩu" required="required">
                </div>

                <!-- Adding your specific fields (textbox fields from JSP) -->

                <div class="form-group">
                    <label for="dob">Ngày sinh:</label>
                    <input type="date" id="dob" name="dob" class="input_field form-control">
                </div>

                <div class="form-group">
                    <label for="gender">Giới tính:</label>
                    <select id="gender" name="gender" class="input_field form-control">
                        <option value="Male">Nam</option>
                        <option value="Female">Nữ</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="phone">Số điện thoại:</label>
                    <input type="text" id="phone" name="phone" class="input_field form-control">
                </div>

                <div class="form-group">

                    <!-- Hiding the Status field -->
                    <input type="hidden" id="status" name="status" value="active">
                </div>

                <!-- Terms acceptance -->
                <div class="form-group">
                    <label class="form-check-label">
                        <input type="checkbox" required="required"> Tôi đảm bảo những thông tin trên là chính xác 
                    </label>
                </div>

                <!-- Submit Button -->
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-lg btn-block">Xác Nhận</button>
                </div>
            </form>
           
        </div>
    </body>
</html>
