<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.CartDetail"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update CartDetail</title>
    </head>
    <%
        Vector<CartDetail> vector = (Vector<CartDetail>) request.getAttribute("vector");
        CartDetail cartDetail = vector.get(0);
    %>
    <body>
        <form action="CartDetailURL" method="post">
        <input type="hidden" name="service" value="updateCartDetail">
        <table>
            <caption>Update CartDetail</caption>
            <tr>
               <td><label for="CartDetailId">CartDetailId</label></td>
               <td><input type="number" name="CartDetailId" id="CartDetailId" value="<%= cartDetail.getCartDetailId() %>"></td>
            </tr>
            <tr>
                <td><label for="ProductId">ProductId</label></td>
                <td><input type="number" name="ProductId" id="ProductId" value="<%= cartDetail.getProductId() %>"></td>
             </tr>
             <tr>
                <td><label for="Quantity">Quantity</label></td>
                <td><input type="number" name="Quantity" id="Quantity" value="<%= cartDetail.getQuantity() %>"></td>
             </tr>
             <tr>
                <td><label for="Price">Price</label></td>
                <td><input type="number" name="Price" id="Price" value="<%= cartDetail.getPrice() %>"></td>
             </tr>
             <tr>
                <td><label for="AddDate">AddDate</label></td>
                <td><input type="date" name="AddDate" id="AddDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(cartDetail.getAddDate()) %>"></td>
             </tr>
             <tr>
                <td><label for="AddTime">AddTime</label></td>
                <td><input type="time" name="AddTime" id="AddTime" value="<%= new java.text.SimpleDateFormat("HH:mm:ss").format(cartDetail.getAddTime()) %>"></td>
             </tr>
             <tr>
                <td><input type="submit" value="updateCartDetail" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
