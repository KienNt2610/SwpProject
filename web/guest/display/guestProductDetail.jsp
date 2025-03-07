<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Details</title>
</head>
<body>

    <h2>Product Details</h2>

    <div>
        <h3>${productName}</h3>
        <p>Description: ${productDescription}</p>
        <p>Price: ${productPrice} đ</p>

        <form action="addToCart" method="POST">
            <label for="color">Choose Color:</label>
            <select id="color" name="color">
                <c:forEach var="color" items="${uniqueColors}">
                    <option value="${color}">${color}</option>
                </c:forEach>
            </select><br><br>

            <label for="size">Choose Size:</label>
            <select id="size" name="size">
                <c:forEach var="size" items="${uniqueSizes}">
                    <option value="${size}">${size}</option>
                </c:forEach>
            </select><br><br>

            <button type="submit">Add to Cart</button>
        </form>
    </div>

</body>
</html>
