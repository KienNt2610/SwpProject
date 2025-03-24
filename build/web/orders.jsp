<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="entity.Order"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Orders</title>
    </head>
    <body>
        <%
             Vector<Order> vector = (Vector<Order>) request.getAttribute("data");
             String title = (String) request.getAttribute("title");
             String customerId = request.getParameter("customerId");
        %>

        <h2>Orders for Customer ID: <%= customerId %></h2>

        <form action="OrderURL" method="get">
            <input type="hidden" name="service" value="listCustomerOrders">
            <label>Search by Customer ID: </label>
            <input type="text" name="customerId" value="<%= request.getAttribute("customerId") != null ? request.getAttribute("customerId") : "" %>">
            <input type="submit" value="Search">
            <a href="OrderURL?service=listCustomerOrders"><button type="button">Clear</button></a>
        </form>

        <%
            List<Order> orders = (List<Order>) request.getAttribute("orders");
            if (orders != null && !orders.isEmpty()) {
        %>
        <table border="1">
            <tr>
                <th>OrderId</th>
<!--                <th>CustomerId</th>-->
                <th>TotalPrice</th>
                <th>Date</th>
                <th>Message</th>
<!--                <th>EmployeeId</th>-->
<!--                <th>Update</th>
                <th>Delete</th>-->
            </tr>
            <%
                for (Order order : orders) {
            %>
            <tr>
                <td><%= order.getOrderId() %></td>
<!--                <td><%= order.getCustomerId() %></td>-->
                <td><%= order.getTotalPrice() %></td>
                <td><%= order.getDate() %></td>
                <td><%= order.getMessage() %></td>
<!--                <td><%= order.getEmployeeId() %></td>-->
<!--                <td><a href="OrderURL?service=updateOrder&orderId=<%= order.getOrderId() %>">update</a></td>
                <td><a href="OrderURL?service=deleteOrder&orderId=<%= order.getOrderId() %>">delete</a></td>-->
            </tr>
            <%
                }
            %>
        </table>
        <%
            } else {
        %>
        <p>No orders found for this Customer ID.</p>
        <%
            }
        %>

    </body>
</html>
