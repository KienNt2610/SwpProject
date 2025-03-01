<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.OrderDetail"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update OrderDetail</title>
    </head>
    <%
        Vector<OrderDetail> vector = (Vector<OrderDetail>) request.getAttribute("vector");
        OrderDetail orderDetail = vector.get(0);
    %>
    <body>
        <form action="OrderDetailURL" method="post">
        <input type="hidden" name="service" value="updateOrderDetail">
        <table>
            <caption>Update OrderDetail</caption>
            <tr>
               <td><label for="OrderId">OrderId</label></td>
               <td><input type="number" name="OrderId" id="OrderId" value="<%= orderDetail.getOrderId() %>"></td>
            </tr>
            <tr>
                <td><label for="ProductId">ProductId</label></td>
                <td><input type="number" name="ProductId" id="ProductId" value="<%= orderDetail.getProductId() %>"></td>
             </tr>
             <tr>
                <td><label for="Quantity">Quantity</label></td>
                <td><input type="number" name="Quantity" id="Quantity" value="<%= orderDetail.getQuantity() %>"></td>
             </tr>
             <tr>
                <td><label for="Price">Price</label></td>
                <td><input type="number" name="Price" id="Price" value="<%= orderDetail.getPrice() %>"></td>
             </tr>
             <tr>
                <td><input type="submit" value="updateOrderDetail" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>