<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="entity.OrderDetail"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert OrderDetail</title>
    </head>
    <body>
        <form action="OrderDetailURL" method="post">
        <input type="hidden" name="service" value="insertOrderDetail">
        <table>
            <caption>Insert OrderDetail</caption>
            <tr>
                <td><label for="OrderId">OrderId</label></td>
                <td><input type="number" name="OrderId" id="OrderId"></td>
            </tr>
            <tr>
                <td><label for="ProductId">ProductId</label></td>
                <td><input type="number" name="ProductId" id="ProductId"></td>
            </tr>
            <tr>
                <td><label for="Quantity">Quantity</label></td>
                <td><input type="number" name="Quantity" id="Quantity"></td>
            </tr>
            <tr>
                <td><label for="Price">Price</label></td>
                <td><input type="number" name="Price" id="Price"></td>
            </tr>
            <tr>
                <td><input type="submit" value="insertOrderDetail" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>