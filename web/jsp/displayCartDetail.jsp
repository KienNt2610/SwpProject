<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.CartDetail"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Detail List</title>
    </head>
    <body>
   <%
        Vector<CartDetail> vector = (Vector<CartDetail>) request.getAttribute("data");
        String title = (String) request.getAttribute("title");
    %>
    <form action="CartDetailURL" method="get">
        <p>Search by Cart Detail ID: <input type="text" name="cartDetailId" id="">
        <input type="submit" value="Search" name="submit">
        <input type="reset" value="Clear">
    </p>
    </form>

    
    <p><a href="CartDetailURL?service=insertCartDetail">Insert Cart Detail</a></p>
    <table border="1px">
       <caption><%= title %></caption>
        <tr>
            <th>CartDetailId</th>
            <th>ProductId</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>AddDate</th>
            <th>AddTime</th>
            <th>update</th>
            <th>delete</th>
        </tr>
        <% for (CartDetail cartDetail : vector) { %>
          <tr>
             <td><%= cartDetail.getCartDetailId() %></td>
             <td><%= cartDetail.getProductId() %></td>
             <td><%= cartDetail.getQuantity() %></td>
             <td><%= cartDetail.getPrice() %></td>
             <td><%= cartDetail.getAddDate() %></td>
             <td><%= cartDetail.getAddTime() %></td>
             <td><a href="CartDetailURL?service=updateCartDetail&cdid=<%= cartDetail.getCartDetailId() %>">update</a></td>
             <td><a href="CartDetailURL?service=deleteCartDetail&cdid=<%= cartDetail.getCartDetailId() %>">delete</a></td>
          </tr>  
        <% } %>
    </table>
    </body>
</html>
