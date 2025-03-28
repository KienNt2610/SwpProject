<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.Role"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Role</title>
    </head>
    <%
        Vector<Role> vector = (Vector<Role>) request.getAttribute("vector");
        Role role = vector.get(0);
    %>
    <body>
        <form action="RoleURL" method="post">
        <input type="hidden" name="service" value="updateRole">
        <table>
            <caption>Update Role</caption>
            <tr>
               <td><label for="RoleId">RoleId</label></td>
               <td><input type="number" name="RoleId" id="RoleId" value="<%= role.getRoleId() %>"></td>
            </tr>
            <tr>
                <td><label for="RoleName">RoleName</label></td>
                <td><input type="text" name="RoleName" id="RoleName" value="<%= role.getRoleName() %>"></td>
             </tr>
             <tr>
                <td><input type="submit" value="updateRole" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>