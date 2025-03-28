<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.CustomerAddress"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Address List</title>
    </head>
    <body>
   <%
        Vector<CustomerAddress> vector = (Vector<CustomerAddress>) request.getAttribute("data");
        String title = (String) request.getAttribute("title");
    %>
    <form action="CustomerAddressURL" method="get">
        <p>Search by Address ID: <input type="text" name="addressId" id="">
        <input type="submit" value="Search" name="submit">
        <input type="reset" value="Clear">
    </p>
    </form>

    
    <p><a href="CustomerAddressURL?service=insertCustomerAddress">Insert Customer Address</a></p>
    <table border="1px">
       <caption><%= title %></caption>
        <tr>
            <th>AddressId</th>
            <th>CustomerId</th>
            <th>Address</th>
            <th>update</th>
            <th>delete</th>
        </tr>
        <% for (CustomerAddress customerAddress : vector) { %>
          <tr>
             <td><%= customerAddress.getAddressId() %></td>
             <td><%= customerAddress.getCustomerId() %></td>
             <td><%= customerAddress.getAddress() %></td>
             <td><a href="CustomerAddressURL?service=updateCustomerAddress&aid=<%= customerAddress.getAddressId() %>">update</a></td>
             <td><a href="CustomerAddressURL?service=deleteCustomerAddress&aid=<%= customerAddress.getAddressId() %>">delete</a></td>
          </tr>  
        <% } %>
    </table>
    </body>
</html>