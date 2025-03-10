<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
</head>
<body>

    <h2>Product Details</h2>

    <!-- Display Product Information -->
    <div>
        <!-- Display Product Name -->
        <h3>${productName}</h3>

        <!-- Display Product Description -->
        <p>Description: ${productDescription}</p>

        <!-- Display Product Price -->
        <p>Price: ${productPrice} đ</p>

        <!-- Add to Cart Form -->
        <form action="addToCart" method="POST">
            <!-- Choose Color -->
            <label for="color">Choose Color:</label>
            <select id="color" name="color">
                <c:forEach var="color" items="${uniqueColors}">
                    <option value="${color}">${color}</option>
                </c:forEach>
            </select><br><br>

            <!-- Choose Size -->
            <label for="size">Choose Size:</label>
            <select id="size" name="size">
                <c:forEach var="size" items="${uniqueSizes}">
                    <option value="${size}">${size}</option>
                </c:forEach>
            </select><br><br>

            <!-- Submit Button -->
            <button type="submit">Add to Cart</button>
        </form>
    </div>

</body>
</html>
