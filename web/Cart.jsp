<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Giỏ Hàng</title>
    </head>
    <body>
        <h1>Giỏ Hàng</h1>
        <table>
            <tr>
                <th>Tên sản phẩm</th>
                <th>Hình ảnh</th>
                <th>Số lượng</th>
                <th>Giá</th>
                <th>Thao tác</th>
            </tr>
            <c:forEach items="${sessionScope.cart.items}" var="item">
                <tr>
                    <td>${item.book.productName}</td>
                    <td><img src="${item.book.link}" alt="${item.book.productName}" width="80" height="80"></td>
                    <td>
                        <a href="process?action=update&id=${item.book.productId}&quantity=${item.quantity - 1}">-</a>
                        <input type="text" readonly value="${item.quantity}" />
                        <a href="process?action=update&id=${item.book.productId}&quantity=${item.quantity + 1}">+</a>
                    </td>
                    <td><fmt:formatNumber value="${item.getTotalPrice()}" /></td>
                    <td>
                        <form action="process" method="post">
                            <input type="hidden" name="action" value="remove" />
                            <input type="hidden" name="id" value="${item.book.productId}" />
                            <input type="submit" value="Remove" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h3>Total: <fmt:formatNumber value="${sessionScope.cart.totalMoney}" /></h3>
        <a href="checkout.jsp">Checkout</a>
    </body>
</html>
