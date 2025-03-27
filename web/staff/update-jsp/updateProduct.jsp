<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
        <script type="text/javascript">
            // Hàm tính toán SalePrice tự động khi Price thay đổi
            function updateSalePrice() {
                var price = document.getElementById("Price").value;
                if (price > 0) {
                    // Giảm giá 10% cho SalePrice
                    var salePrice = price * 0.9;
                    document.getElementById("SalePrice").value = salePrice.toFixed(2); // Cập nhật SalePrice
                }
            }
        </script>
    </head>
    <%
        Vector<Product> vector = (Vector<Product>) request.getAttribute("vector");
        Product product = vector.get(0); // Lấy sản phẩm từ vector
    %>
    <body>
        <form action="ProductURL" method="post" onsubmit="return updateSalePrice()">
        <input type="hidden" name="service" value="updateProduct">
        <table>
            <caption>Update Product</caption>
            <tr>
               <td><label for="ProductId">ProductId</label></td>
               <td><input type="number" name="ProductId" id="ProductId" value="<%= product.getProductId() %>" readonly></td>
            </tr>
            <tr>
                <td><label for="ProductName">ProductName</label></td>
                <td><input type="text" name="ProductName" id="ProductName" value="<%= product.getProductName() %>" required></td>
             </tr>
             <tr>
                <td><label for="CategoryId">CategoryId</label></td>
                <td><input type="number" name="CategoryId" id="CategoryId" value="<%= product.getCategoryId() %>" required></td>
             </tr>
             <tr>
                <td><label for="Price">Price</label></td>
                <td><input type="number" name="Price" id="Price" value="<%= product.getPrice() %>" onchange="updateSalePrice()" required></td>
             </tr>
             <tr>
                <td><label for="SalePrice">Sale Price</label></td>
                <td><input type="text" name="SalePrice" id="SalePrice" value="<%= product.getSalePrice() %>" readonly required></td>
             </tr>
             <tr>
                <td><label for="Quantity">Quantity</label></td>
                <td><input type="number" name="Quantity" id="Quantity" value="<%= product.getQuantity() %>" required></td>
             </tr>
             <tr>
                <td><label for="Description">Description</label></td>
                <td><textarea name="Description" id="Description" required><%= product.getDescription() %></textarea></td>
             </tr>
             <tr>
                <td><label for="Discontinued">Discontinued</label></td>
                <td>
                    <input type="radio" name="Discontinued" value="1" <%= product.isDiscontinued() ? "checked" : "" %>> Continued
                    <input type="radio" name="Discontinued" value="0" <%= !product.isDiscontinued() ? "checked" : "" %>> Discontinued
                </td>
             </tr>
             <tr>
                <td><label for="CreateTime">Create Time</label></td>
                <td><input type="datetime-local" name="CreateTime" id="CreateTime" value="<%= product.getCreateTime() != null ? product.getCreateTime().toLocalDateTime().toString() : "" %>" required></td>
             </tr>


             <tr>
                <td><input type="hidden" name="SoldQuantity" value="0"></td> 
             </tr>
             <tr>
                <td><input type="hidden" name="isHot" value="false"></td> 
             </tr>

             <tr>
                <td><input type="submit" value="Update Product" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
