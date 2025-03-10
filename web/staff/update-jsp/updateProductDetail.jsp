<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.ProductDetail"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update ProductDetail</title>
    </head>
    <%
        Vector<ProductDetail> vector = (Vector<ProductDetail>) request.getAttribute("vector");
        ProductDetail productDetail = vector.get(0);
    %>
    <body>
        <form action="ProductDetailURL" method="post">
        <input type="hidden" name="service" value="updateProductDetail">
        <table>
            <caption>Update ProductDetail</caption>
            <tr>
               <td><label for="DetailId">DetailId</label></td>
               <td><input type="number" name="DetailId" id="DetailId" value="<%= productDetail.getDetailId() %>" readonly></td>
            </tr>
            <tr>
                <td><label for="ProductId">ProductId</label></td>
                <td><input type="number" name="ProductId" id="ProductId" value="<%= productDetail.getProductId() %>"></td>
             </tr>
             <tr>
                <td><label for="Color">Color</label></td>
                <td><input type="text" name="Color" id="Color" value="<%= productDetail.getColor() %>"></td>
             </tr>
             <tr>
                <td><label for="Size">Size</label></td>
                <td><input type="text" name="Size" id="Size" value="<%= productDetail.getSize() %>"></td>
             </tr>
             <tr>
                <td><input type="submit" value="updateProductDetail" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
