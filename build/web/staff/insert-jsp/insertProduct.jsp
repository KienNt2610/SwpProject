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
                <td><label for="ProductId">ProductId</label></td>
                <td><input type="number" name="ProductId" id="ProductId" readonly></td>
            </tr>
            <tr>
                <td><label for="ProductName">ProductName</label></td>
                <td><input type="text" name="ProductName" id="ProductName"></td>
            </tr>
            <tr>
                <td><label for="CategoryId">CategoryId</label></td>
                <td>
                    <select name="CategoryId" id="CategoryId">
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
                <td><input type="number" name="Price" id="Price"></td>
            </tr>
            <tr>
                <td><label for="Quantity">Quantity</label></td>
                <td><input type="number" name="Quantity" id="Quantity"></td>
            </tr>
            <tr>
                <td><label for="Description">Description</label></td>
                <td><textarea name="Description" id="Description"></textarea></td>
            </tr>
            <tr>
                <td><label for="Discontinued">Bussiness Status</label></td>
                <td>
                    <input type="radio" name="Discontinued" id="Discontinued" value="1" checked> Continued
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="insertProduct" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
