<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Employees</title>
    </head>
    <body>
        <form action="EmployeesURL" method="post">
            <input type="hidden" name="service" value="insertEmployees">
            <table>
                <caption>Insert Employees</caption>
                <tr>
                    <td><label for="EmployeeId">EmployeeId</label></td>
                    <td><input type="number" name="EmployeeId" id="EmployeeId" readonly></td>
                </tr>
                <tr>
                    <td><label for="EmployeeName">EmployeeName</label></td>
                    <td><input type="text" name="EmployeeName" id="EmployeeName"></td>
                </tr>
                <tr>
                    <td><label for="EmpBirthDate">EmpBirthDate</label></td>
                    <td><input type="date" name="EmpBirthDate" id="EmpBirthDate"></td>
                </tr>
                <tr>
                    <td><label for="PhoneNumber">PhoneNumber</label></td>
                    <td><input type="tel" name="PhoneNumber" id="PhoneNumber"></td>
                </tr>
                <tr>
                    <td><label for="Email">Email</label></td>
                    <td><input type="email" name="Email" id="Email"></td>
                </tr>
                <tr>
                    <td><label for="EmpGender">EmpGender</label></td>
                    <td>
                        <select name="EmpGender" id="EmpGender">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="RoleId">RoleId</label></td>
                    <td><input type="number" name="RoleId" id="RoleId"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="insertEmployees" name="submit"></td>
                    <td><input type="reset" value="Clear"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
