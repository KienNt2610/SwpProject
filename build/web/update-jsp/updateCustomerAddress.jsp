<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.CustomerAddress"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Customer Address</title>
    </head>
    <%
        Vector<CustomerAddress> vector = (Vector<CustomerAddress>) request.getAttribute("vector");
        CustomerAddress customerAddress = vector.get(0);
    %>
    <body>
        <form action="CustomerAddressURL" method="post">
        <input type="hidden" name="service" value="updateCustomerAddress">
        <table>
            <caption>Update Customer Address</caption>
            <tr>
               <td><label for="AddressId">AddressId</label></td>
               <td><input type="number" name="AddressId" id="AddressId" value="<%= customerAddress.getAddressId() %>"></td>
            </tr>
            <tr>
                <td><label for="CustomerId">CustomerId</label></td>
                <td><input type="number" name="CustomerId" id="CustomerId" value="<%= customerAddress.getCustomerId() %>"></td>
             </tr>
             <tr>
                <td><label for="Address">Address</label></td>
                <td><textarea name="Address" id="Address"><%= customerAddress.getAddress() %></textarea></td>
             </tr>
             <tr>
                <td><input type="submit" value="updateCustomerAddress" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
