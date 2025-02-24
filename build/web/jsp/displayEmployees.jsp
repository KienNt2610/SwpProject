<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Employees"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee List</title>
    </head>
    <body>
   <%
        Vector<Employees> vector = (Vector<Employees>) request.getAttribute("data");
        String title = (String) request.getAttribute("title");
    %>
    <form action="EmployeeURL" method="get">
        <p>Search by Employee ID: <input type="text" name="employeeId" id="">
        <input type="submit" value="Search" name="submit">
        <input type="reset" value="Clear">
    </p>
    </form>

    
    <p><a href="EmployeeURL?service=insertEmployee">Insert Employee</a></p>
    <table border="1px">
       <caption><%= title %></caption>
        <tr>
            <th>EmployeeId</th>
            <th>EmployeeName</th>
            <th>EmpBirthDate</th>
            <th>PhoneNumber</th>
            <th>Email</th>
            <th>EmpGender</th>
            <th>RoleId</th>
            <th>update</th>
            <th>delete</th>
        </tr>
        <% for (Employees employee : vector) { %>
          <tr>
             <td><%= employee.getEmployeeId() %></td>
             <td><%= employee.getEmployeeName() %></td>
             <td><%= employee.getEmpBirthDate() %></td>
             <td><%= employee.getPhoneNumber() %></td>
             <td><%= employee.getEmail() %></td>
             <td><%= employee.getEmpGender() %></td>
             <td><%= employee.getRoleId() %></td>
             <td><a href="EmployeeURL?service=updateEmployee&eid=<%= employee.getEmployeeId() %>">update</a></td>
             <td><a href="EmployeeURL?service=deleteEmployee&eid=<%= employee.getEmployeeId() %>">delete</a></td>
          </tr>  
        <% } %>
    </table>
    </body>
</html>
