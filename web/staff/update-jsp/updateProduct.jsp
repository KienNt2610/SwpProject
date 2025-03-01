<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
    </head>
    <%
        Vector<Product> vector = (Vector<Product>) request.getAttribute("vector");
        Product product = vector.get(0);
    %>
    <body>
        <form action="ProductURL" method="post">
        <input type="hidden" name="service" value="updateProduct">
        <table>
            <caption>Update Product</caption>
            <tr>
               <td><label for="ProductId">ProductId</label></td>
               <td><input type="number" name="ProductId" id="ProductId" value="<%= product.getProductId() %>"></td>
            </tr>
            <tr>
                <td><label for="ProductName">ProductName</label></td>
                <td><input type="text" name="ProductName" id="ProductName" value="<%= product.getProductName() %>"></td>
             </tr>
             <tr>
                <td><label for="CategoryId">CategoryId</label></td>
                <td><input type="number" name="CategoryId" id="CategoryId" value="<%= product.getCategoryId() %>"></td>
             </tr>
             <tr>
                <td><label for="Price">Price</label></td>
                <td><input type="number" name="Price" id="Price" value="<%= product.getPrice() %>"></td>
             </tr>
             <tr>
                <td><label for="Quantity">Quantity</label></td>
                <td><input type="number" name="Quantity" id="Quantity" value="<%= product.getQuantity() %>"></td>
             </tr>
             <tr>
                <td><label for="Description">Description</label></td>
                <td><textarea name="Description" id="Description"><%= product.getDescription() %></textarea></td>
             </tr>
             <tr>
                <td><label for="Discontinued">Discontinued</label></td>
                <td>
                    <input type="radio" name="Discontinued" id="Discontinued" value="0" <%= product.isDiscontinued() == true ? "checked" : "" %>> Discontinued
                    <input type="radio" name="Discontinued" id="Discontinued" value="1" <%= product.isDiscontinued() == false ? "checked" : "" %>> Continued
                </td>
             </tr>
             <tr>
                <td><input type="submit" value="updateProduct" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
