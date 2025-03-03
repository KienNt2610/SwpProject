<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Category</title>
    </head>
    <body>
        <form action="CategoryURL" method="post">
            <input type="hidden" name="service" value="insertCategory">
            <table>
                <caption>Insert Category</caption>
                <tr>
                    <td><label for="CategoryId">CategoryId</label></td>
                    <td><input type="number" name="CategoryId" id="CategoryId" readonly></td>
                </tr>
                <tr>
                    <td><label for="CategoryName">CategoryName</label></td>
                    <td><input type="text" name="CategoryName" id="CategoryName"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="insertCategory" name="submit"></td>
                    <td><input type="reset" value="Clear"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
