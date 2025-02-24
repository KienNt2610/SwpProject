<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="entity.Order"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Order</title>
    </head>
    <body>
        <form action="OrderURL" method="post">
        <input type="hidden" name="service" value="insertOrder">
        <table>
            <caption>Insert Order</caption>
            <tr>
                <td><label for="OrderId">OrderId</label></td>
                <td><input type="number" name="OrderId" id="OrderId" readonly></td>
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
                <td><label for="Date">Date</label></td>
                <td><input type="date" name="Date" id="Date"></td>
            </tr>
            <tr>
                <td><label for="Message">Message</label></td>
                <td><textarea name="Message" id="Message"></textarea></td>
            </tr>
            <tr>
                <td><label for="EmployeeId">EmployeeId</label></td>
                <td><input type="number" name="EmployeeId" id="EmployeeId"></td>
            </tr>
            <tr>
                <td><input type="submit" value="insertOrder" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>