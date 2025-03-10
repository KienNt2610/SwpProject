<%-- 
    Document   : insertProductDetail
    Created on : Feb 13, 2025, 9:16:53 PM
    Author     : Kien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="entity.ProductDetail"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert ProductDetail</title>
    </head>
    <body>
        <form action="ProductDetailURL" method="post">
        <input type="hidden" name="service" value="insertProductDetail">
        <table>
            <caption>Insert ProductDetail</caption>
            <tr>
                <td><label for="DetailId">DetailId</label></td>
                <td><input type="number" name="DetailId" id="DetailId" readonly></td>
            </tr>
            <tr>
                <td><label for="ProductId">ProductId</label></td>
                <td><input type="number" name="ProductId" id="ProductId"></td>
            </tr>
            <tr>
                <td><label for="Color">Color</label></td>
                <td><input type="text" name="Color" id="Color"></td>
            </tr>
            <tr>
                <td><label for="Size">Size</label></td>
                <td><input type="text" name="Size" id="Size"></td>
            </tr>
            <tr>
                <td><input type="submit" value="insertProductDetail" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
