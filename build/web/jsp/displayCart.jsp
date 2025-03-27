<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Cart"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart List</title>
    </head>
    <body>
   <%
        Vector<Cart> vector = (Vector<Cart>) request.getAttribute("data");
        String title = (String) request.getAttribute("title");
    %>
    <form action="CartURL" method="get">
        <p>Search by Cart ID: <input type="text" name="cartId" id="">
        <input type="submit" value="Search" name="submit">
        <input type="reset" value="Clear">
    </p>
    </form>

    
    <p><a href="CartURL?service=insertCart">Insert Cart</a></p>
    <table border="1px">
       <caption><%= title %></caption>
        <tr>
            <th>CartId</th>
            <th>CustomerId</th>
            <th>TotalPrice</th>
            <th>AddDate</th>
            <th>update</th>
            <th>delete</th>
        </tr>
        <% for (Cart cart : vector) { %>
          <tr>
             <td><%= cart.getCartId() %></td>
             <td><%= cart.getCustomerId() %></td>
             <td><%= cart.getTotalPrice() %></td>
             <td><%= cart.getAddDate() %></td>
             <td><a href="CartURL?service=updateCart&cid=<%= cart.getCartId() %>">update</a></td>
             <td><a href="CartURL?service=deleteCart&cid=<%= cart.getCartId() %>">delete</a></td>
          </tr>  
        <% } %>
    </table>
    </body>
</html>
