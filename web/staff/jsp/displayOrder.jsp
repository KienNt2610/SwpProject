<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Order"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order List</title>
    </head>
    <body>
   <%
        Vector<Order> vector = (Vector<Order>) request.getAttribute("data");
        String title = (String) request.getAttribute("title");
    %>
    <form action="OrderURL" method="get">
        <p>Search by Order ID: <input type="text" name="orderId" id="">
        <input type="submit" value="Search" name="submit">
        <input type="reset" value="Clear">
    </p>
    </form>

    
    <p><a href="OrderURL?service=insertOrder">Insert Order</a></p>
    <table border="1px">
       <caption><%-- title --%></caption>
        <tr>
            <th>OrderId</th>
            <th>CustomerId</th>
            <th>TotalPrice</th>
            <th>Date</th>
            <th>Message</th>
            <th>EmployeeId</th>
            <th>update</th>
            <th>delete</th>
        </tr>
        <% for (Order order : vector) { %>
          <tr>
             <td><%= order.getOrderId() %></td>
             <td><%= order.getCustomerId() %></td>
             <td><%= order.getTotalPrice() %></td>
             <td><%= order.getDate() %></td>
             <td><%= order.getMessage() %></td>
             <td><%= order.getEmployeeId() %></td>
             <td><a href="OrderURL?service=updateOrder&oid=<%= order.getOrderId() %>">update</a></td>
             <td><a href="OrderURL?service=deleteOrder&oid=<%= order.getOrderId() %>">delete</a></td>
          </tr>  
        <% } %>
    </table>
    </body>
</html>