<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        </style>
    </head>
    <body>
        
        <h1>Giỏ Hàng</h1>
        <c:set var="cartList" value="${sessionScope['cart-list']}" />
        <c:if test="${empty cartList}">
            <p>Giỏ hàng của bạn đang trống</p>
        </c:if>
        <c:if test="${not empty cartList}">
            <table>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                    <th>Thao tác</th>
                </tr>
                <c:forEach items="${cartList}" var="item">
                    <tr>
                        <td>${item.productName}</td>
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
    </body>
</html>
