<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.OrderDetail"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OrderDetail List</title>
    </head>
    <body>
   <%
        Vector<OrderDetail> vector = (Vector<OrderDetail>) request.getAttribute("data");
        String title = (String) request.getAttribute("title");
    %>
    <form action="OrderDetailURL" method="get">
        <p>Search by Order ID: <input type="text" name="orderId" id="">
        <input type="submit" value="Search" name="submit">
        <input type="reset" value="Clear">
    </p>
    </form>

    <p><a href="OrderDetailURL?service=insertOrderDetail">Insert OrderDetail</a></p>
    <table border="1px">
       <caption><%-- title --%></caption>
        <tr>
            <th>OrderId</th>
            <th>ProductId</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>update</th>
            <th>delete</th>
        </tr>
        <% for (OrderDetail orderDetail : vector) { %>
          <tr>
             <td><%= orderDetail.getOrderId() %></td>
             <td><%= orderDetail.getProductId() %></td>
             <td><%= orderDetail.getQuantity() %></td>
             <td><%= orderDetail.getPrice() %></td>
             <td><a href="OrderDetailURL?service=updateOrderDetail&oid=<%= orderDetail.getOrderId() %>&pid=<%= orderDetail.getProductId() %>">update</a></td>
             <td><a href="OrderDetailURL?service=deleteOrderDetail&oid=<%= orderDetail.getOrderId() %>&pid=<%= orderDetail.getProductId() %>">delete</a></td>
          </tr>  
        <% } %>
    </table>
    </body>
</html>