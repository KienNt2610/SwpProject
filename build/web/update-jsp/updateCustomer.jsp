<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.Customer"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Customer</title>
    </head>
    <%
        Vector<Customer> vector = (Vector<Customer>) request.getAttribute("vector");
        Customer customer = vector.get(0);
    %>
    <body>
        <form action="CustomerURL" method="post">
        <input type="hidden" name="service" value="updateCustomer">
        <table>
            <caption>Update Customer</caption>
            <tr>
               <td><label for="CustomerId">CustomerId</label></td>
               <td><input type="number" name="CustomerId" id="CustomerId" value="<%= customer.getCustomerId() %>"></td>
            </tr>
            <tr>
                <td><label for="CustomerName">CustomerName</label></td>
                <td><input type="text" name="CustomerName" id="CustomerName" value="<%= customer.getCustomerName() %>"></td>
             </tr>
             <tr>
                <td><label for="CusBirthDate">CusBirthDate</label></td>
                <td><input type="text" name="CusBirthDate" id="CusBirthDate" value="<%= customer.getCusBirthDate() %>"></td>
             </tr>
             <tr>
                <td><label for="CusGender">CusGender</label></td>
                <td><input type="text" name="CusGender" id="CusGender" value="<%= customer.getCusGender() %>"></td>
             </tr>
             <tr>
                <td><label for="Phone">Phone</label></td>
                <td><input type="text" name="Phone" id="Phone" value="<%= customer.getPhone() %>"></td>
             </tr>
             <tr>
                <td><label for="Email">Email</label></td>
                <td><input type="text" name="Email" id="Email" value="<%= customer.getEmail() %>"></td>
             </tr>
             <tr>
                <td><label for="Username">Username</label></td>
                <td><input type="text" name="Username" id="Username" value="<%= customer.getUsername() %>"></td>
             </tr>
             <tr>
                <td><label for="Password">Password</label></td>
                <td><input type="text" name="Password" id="Password" value="<%= customer.getPassword() %>"></td>
             </tr>
             <tr>
                <td><label for="Status">Status</label></td>
                <td><input type="text" name="Status" id="Status" value="<%= customer.getStatus() %>"></td>
             </tr>
             <tr>
                <td><label for="RoleId">RoleId</label></td>
                <td><input type="number" name="RoleId" id="RoleId" value="<%= customer.getRoleId() %>"></td>
             </tr>
             <tr>
                <td><input type="submit" value="updateCustomer" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
