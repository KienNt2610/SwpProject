<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="entity.Customer"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Customer</title>
    </head>
    <body>
        <form action="CustomerURL" method="post">
        <input type="hidden" name="service" value="insertCustomer">
        <table>
            <caption>Insert Customer</caption>
            <tr>
                <td><label for="CustomerId">CustomerId</label></td>
                <td><input type="number" name="CustomerId" id="CustomerId" readonly></td>
            </tr>
            <tr>
                <td><label for="CustomerName">CustomerName</label></td>
                <td><input type="text" name="CustomerName" id="CustomerName"></td>
            </tr>
            <tr>
                <td><label for="CusBirthDate">CusBirthDate</label></td>
                <td><input type="text" name="CusBirthDate" id="CusBirthDate"></td>
            </tr>
            <tr>
                <td><label for="CusGender">CusGender</label></td>
                <td><input type="text" name="CusGender" id="CusGender"></td>
            </tr>
            <tr>
                <td><label for="Phone">Phone</label></td>
                <td><input type="text" name="Phone" id="Phone"></td>
            </tr>
            <tr>
                <td><label for="Email">Email</label></td>
                <td><input type="text" name="Email" id="Email"></td>
            </tr>
            <tr>
                <td><label for="Username">Username</label></td>
                <td><input type="text" name="Username" id="Username"></td>
            </tr>
            <tr>
                <td><label for="Password">Password</label></td>
                <td><input type="text" name="Password" id="Password"></td>
            </tr>
            <tr>
                <td><label for="Status">Status</label></td>
                <td><input type="text" name="Status" id="Status"></td>
            </tr>
            <tr>
                <td><label for="RoleId">RoleId</label></td>
                <td><input type="number" name="RoleId" id="RoleId"></td>
            </tr>
            <tr>
                <td><input type="submit" value="insertCustomer" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
