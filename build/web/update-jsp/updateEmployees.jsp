<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.Employees"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Employee</title>
    </head>
    <%
        Vector<Employees> vector = (Vector<Employees>) request.getAttribute("vector");
        Employees employee = vector.get(0);
    %>
    <body>
        <form action="EmployeeURL" method="post">
        <input type="hidden" name="service" value="updateEmployee">
        <table>
            <caption>Update Employee</caption>
            <tr>
               <td><label for="EmployeeId">EmployeeId</label></td>
               <td><input type="number" name="EmployeeId" id="EmployeeId" value="<%= employee.getEmployeeId() %>"></td>
            </tr>
            <tr>
                <td><label for="EmployeeName">EmployeeName</label></td>
                <td><input type="text" name="EmployeeName" id="EmployeeName" value="<%= employee.getEmployeeName() %>"></td>
             </tr>
             <tr>
                <td><label for="EmpBirthDate">EmpBirthDate</label></td>
                <td><input type="date" name="EmpBirthDate" id="EmpBirthDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(employee.getEmpBirthDate()) %>"></td>
             </tr>
             <tr>
                <td><label for="PhoneNumber">PhoneNumber</label></td>
                <td><input type="text" name="PhoneNumber" id="PhoneNumber" value="<%= employee.getPhoneNumber() %>"></td>
             </tr>
             <tr>
                <td><label for="Email">Email</label></td>
                <td><input type="email" name="Email" id="Email" value="<%= employee.getEmail() %>"></td>
             </tr>
             <tr>
                <td><label for="EmpGender">EmpGender</label></td>
                <td><input type="text" name="EmpGender" id="EmpGender" value="<%= employee.getEmpGender() %>"></td>
             </tr>
             <tr>
                <td><label for="RoleId">RoleId</label></td>
                <td><input type="number" name="RoleId" id="RoleId" value="<%= employee.getRoleId() %>"></td>
             </tr>
             <tr>
                <td><input type="submit" value="updateEmployee" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
