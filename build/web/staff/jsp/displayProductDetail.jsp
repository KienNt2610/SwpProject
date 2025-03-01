<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.ProductDetail"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details List</title>
    </head>
    <body>
        <%
                 Vector<ProductDetail> vector = (Vector<ProductDetail>) request.getAttribute("data");
                 String title = (String) request.getAttribute("title");
        %>
        <form action="ProductDetailURL" method="get">
            <p>Search by DetailId: <input type="number" name="detailId" id="">
                <input type="submit" value="Search" name="submit">
                <input type="reset" value="Clear">
            </p>
        </form>


        <p><a href="ProductDetailURL?service=insertProductDetail">Insert ProductDetail</a></p>
        <table border="1px">
            <caption><%= title %></caption>
            <tr>
                <th>DetailId</th>
                <th>ProductId</th>
                <th>Color</th>
                <th>Size</th>
                <th>update</th>
                <th>delete</th>
            </tr>
            <% for (ProductDetail productDetail : vector) { %>
            <tr>
                <td><%= productDetail.getDetailId() %></td>
                <td><%= productDetail.getProductId() %></td>
                <td><%= productDetail.getColor() %></td>
                <td><%= productDetail.getSize() %></td>
                <td><a href="ProductDetailURL?service=updateProductDetail&detailId=<%= productDetail.getDetailId() %>">update</a></td>
                <td><a href="ProductDetailURL?service=deleteProductDetail&detailId=<%= productDetail.getDetailId() %>">delete</a></td>
            </tr>  
            <% } %>
        </table>
    </body>
</html>
