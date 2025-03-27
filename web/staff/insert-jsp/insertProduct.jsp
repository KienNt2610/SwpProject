<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="entity.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product</title>
        <script type="text/javascript">
            function validateForm() {
                var price = document.getElementById("Price").value;
                var quantity = document.getElementById("Quantity").value;

                if (price <= 0) {
                    alert("Price must be a positive number.");
                    return false;
                }

                if (quantity <= 0 || !Number.isInteger(Number(quantity))) {
                    alert("Quantity must be a positive integer.");
                    return false;
                }

                // Tính toán SalePrice tự động (giảm giá 10% cho ví dụ)
                var salePrice = price * 0.9;  // Giảm giá 10%
                document.getElementById("SalePrice").value = salePrice.toFixed(2); // Hiển thị SalePrice

                return true;
            }
        </script>
    </head>
    <body>
        <form action="ProductURL" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="service" value="insertProduct">
        <table>
            <caption>Insert Product</caption>
            <tr>
                <td><label for="ProductName">ProductName</label></td>
                <td><input type="text" name="ProductName" id="ProductName" required></td>
            </tr>
            <tr>
                <td><label for="CategoryId">CategoryId</label></td>
                <td>
                    <select name="CategoryId" id="CategoryId" required>
                        <option value="1">Bóng đá</option>
                        <option value="2">Cầu lông</option>
                        <option value="3">Bóng bàn</option>
                        <option value="4">Tenis</option>
                        <option value="5">Phụ kiện thể thao</option>
                        <option value="6">Quần áo</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="Price">Price</label></td>
                <td><input type="number" name="Price" id="Price" onchange="validateForm()" required></td>
            </tr>
            <tr>
                <td><label for="SalePrice">Sale Price</label></td>
                <td><input type="text" name="SalePrice" id="SalePrice" readonly required></td>
            </tr>
            <tr>
                <td><label for="Quantity">Quantity</label></td>
                <td><input type="number" name="Quantity" id="Quantity" required></td>
            </tr>
            <tr>
                <td><label for="SoldQuantity">Sold Quantity</label></td>
                <td><input type="number" name="SoldQuantity" id="SoldQuantity" value="0" readonly></td>
            </tr>
            <tr>
                <td><label for="Description">Description</label></td>
                <td><textarea name="Description" id="Description" required></textarea></td>
            </tr>
            <tr>
                <td><label for="Discontinued">Business Status</label></td>
                <td>
                    <input type="radio" name="Discontinued" id="Discontinued" value="1" checked> Continued
                    <input type="radio" name="Discontinued" id="Discontinued" value="0"> Discontinued
                </td>
            </tr>
            <tr>
                <td><label for="IsHot">Hot</label></td>
                <td>
                    <input type="radio" name="IsHot" id="IsHot" value="false" checked> No
                    <input type="radio" name="IsHot" id="IsHot" value="true"> Yes
                </td>
            </tr>
            <tr>
                <td><label for="CreateTime">Create Date</label></td>
                <td><input type="datetime-local" name="CreateTime" id="CreateTime" value="<%= new java.util.Date().toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDateTime() %>"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Insert Product" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
