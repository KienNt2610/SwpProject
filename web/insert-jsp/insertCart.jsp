<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="entity.Cart"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Cart</title>
    </head>
    <body>
        <form action="CartURL" method="post">
        <input type="hidden" name="service" value="insertCart">
        <table>
            <caption>Insert Cart</caption>
            <tr>
                <td><label for="CartId">CartId</label></td>
                <td><input type="number" name="CartId" id="CartId" readonly></td>
            </tr>
            <tr>
                <td><label for="CustomerId">CustomerId</label></td>
                <td><input type="number" name="CustomerId" id="CustomerId"></td>
            </tr>
            <tr>
                <td><label for="TotalPrice">TotalPrice</label></td>
                <td><input type="number" name="TotalPrice" id="TotalPrice"></td>
            </tr>
            <tr>
                <td><label for="AddDate">AddDate</label></td>
                <td><input type="date" name="AddDate" id="AddDate"></td>
            </tr>
            <tr>
                <td><input type="submit" value="insertCart" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
