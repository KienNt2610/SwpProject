<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Role"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Role List</title>
    </head>
    <body>
   <%
        Vector<Role> vector = (Vector<Role>) request.getAttribute("data");
        String title = (String) request.getAttribute("title");
    %>
    <form action="RoleURL" method="get">
        <p>Search by Role ID: <input type="text" name="roleId" id="">
        <input type="submit" value="Search" name="submit">
        <input type="reset" value="Clear">
    </p>
    </form>

    
    <p><a href="RoleURL?service=insertRole">Insert Role</a></p>
    <table border="1px">
       <caption><%= title %></caption>
        <tr>
            <th>RoleId</th>
            <th>RoleName</th>
            <th>update</th>
            <th>delete</th>
        </tr>
        <% for (Role role : vector) { %>
          <tr>
             <td><%= role.getRoleId() %></td>
             <td><%= role.getRoleName() %></td>
             <td><a href="RoleURL?service=updateRole&rid=<%= role.getRoleId() %>">update</a></td>
             <td><a href="RoleURL?service=deleteRole&rid=<%= role.getRoleId() %>">delete</a></td>
          </tr>  
        <% } %>
    </table>
    </body>
</html>
