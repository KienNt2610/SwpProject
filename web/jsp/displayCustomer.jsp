<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="entity.Customer"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer List</title>
    </head>
    <body>
        <%
                 Vector<Customer> vector = (Vector<Customer>) request.getAttribute("data");
                 String title = (String) request.getAttribute("title");
        %>
        <form action="CustomerURL" method="get">
            <p>Search by Name: <input type="text" name="cname" id="">
                <input type="submit" value="Search" name="submit">
                <input type="reset" value="Clear">
            </p>
        </form>


        <p><a href="CustomerURL?service=insertCustomer">Insert Customer</a></p>
        <table border="1px">
            <caption><%// title %></caption>
            <tr>
                <th>CustomerId</th>
                <th>CustomerName</th>
                <th>CusBirthDate</th>
                <th>CusGender</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Username</th>
                <th>Password</th>
                <th>Status</th>
                <th>RoleId</th>
                <th>update</th>
                <th>delete</th>
            </tr>
            <% for (Customer customer : vector) { %>
            <tr>
                <td><%= customer.getCustomerId() %></td>
                <td><%= customer.getCustomerName() %></td>
                <td><%= customer.getCusBirthDate() %></td>
                <td><%= customer.getCusGender() %></td>
                <td><%= customer.getPhone() %></td>
                <td><%= customer.getEmail() %></td>
                <td><%= customer.getUsername() %></td>
                <td><%= customer.getPassword() %></td>
                <td><%= customer.getStatus() %></td>
                <td><%= customer.getRoleId() %></td>
                <td><a href="CustomerURL?service=updateCustomer&cid=<%= customer.getCustomerId() %>">update</a></td>
                <td><a href="CustomerURL?service=deleteCustomer&cid=<%= customer.getCustomerId() %>">delete</a></td>
            </tr>  
            <% } %>
        </table>
    </body>
</html>
