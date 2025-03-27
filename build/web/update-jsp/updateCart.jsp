<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.Cart"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Cart</title>
    </head>
    <%
        Vector<Cart> vector = (Vector<Cart>) request.getAttribute("vector");
        Cart cart = vector.get(0);
    %>
    <body>
        <form action="CartURL" method="post">
        <input type="hidden" name="service" value="updateCart">
        <table>
            <caption>Update Cart</caption>
            <tr>
               <td><label for="CartId">CartId</label></td>
               <td><input type="number" name="CartId" id="CartId" value="<%= cart.getCartId() %>"></td>
            </tr>
            <tr>
                <td><label for="CustomerId">CustomerId</label></td>
                <td><input type="number" name="CustomerId" id="CustomerId" value="<%= cart.getCustomerId() %>"></td>
             </tr>
             <tr>
                <td><label for="TotalPrice">TotalPrice</label></td>
                <td><input type="number" name="TotalPrice" id="TotalPrice" value="<%= cart.getTotalPrice() %>"></td>
             </tr>
             <tr>
                <td><label for="AddDate">AddDate</label></td>
                <td><input type="date" name="AddDate" id="AddDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(cart.getAddDate()) %>"></td>
             </tr>
             <tr>
                <td><input type="submit" value="updateCart" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
