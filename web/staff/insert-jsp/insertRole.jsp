<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Role</title>
    </head>
    <body>
        <form action="RoleURL" method="post">
            <input type="hidden" name="service" value="insertRole">
            <table>
                <caption>Insert Role</caption>
                <tr>
                    <td><label for="RoleId">RoleId</label></td>
                    <td><input type="number" name="RoleId" id="RoleId" readonly></td>
                </tr>
                <tr>
                    <td><label for="RoleName">RoleName</label></td>
                    <td><input type="text" name="RoleName" id="RoleName"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="insertRole" name="submit"></td>
                    <td><input type="reset" value="Clear"></td>
                </tr>
            </table>
        </form>
    </body>
</html>