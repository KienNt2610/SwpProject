<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.Order"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Order</title>
    </head>
    <%
        Vector<Order> vector = (Vector<Order>) request.getAttribute("vector");
        Order order = vector.get(0);
    %>
    <body>
        <form action="OrderURL" method="post">
        <input type="hidden" name="service" value="updateOrder">
        <table>
            <caption>Update Order</caption>
            <tr>
               <td><label for="OrderId">OrderId</label></td>
               <td><input type="number" name="OrderId" id="OrderId" value="<%= order.getOrderId() %>"></td>
            </tr>
            <tr>
                <td><label for="CustomerId">CustomerId</label></td>
                <td><input type="number" name="CustomerId" id="CustomerId" value="<%= order.getCustomerId() %>"></td>
             </tr>
             <tr>
                <td><label for="TotalPrice">TotalPrice</label></td>
                <td><input type="number" name="TotalPrice" id="TotalPrice" value="<%= order.getTotalPrice() %>"></td>
             </tr>
             <tr>
                <td><label for="Date">Date</label></td>
                <td><input type="date" name="Date" id="Date" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(order.getDate()) %>"></td>
             </tr>
             <tr>
                <td><label for="Message">Message</label></td>
                <td><textarea name="Message" id="Message"><%= order.getMessage() %></textarea></td>
             </tr>
             <tr>
                <td><label for="EmployeeId">EmployeeId</label></td>
                <td><input type="number" name="EmployeeId" id="EmployeeId" value="<%= order.getEmployeeId() %>"></td>
             </tr>
             <tr>
                <td><input type="submit" value="updateOrder" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>