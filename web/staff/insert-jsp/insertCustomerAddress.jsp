<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert CustomerAddress</title>
    </head>
    <body>
        <form action="CustomerAddressURL" method="post">
            <input type="hidden" name="service" value="insertCustomerAddress">
            <table>
                <caption>Insert Customer Address</caption>
                <tr>
                    <td><label for="AddressId">AddressId</label></td>
                    <td><input type="number" name="AddressId" id="AddressId" readonly></td>
                </tr>
                <tr>
                    <td><label for="CustomerId">CustomerId</label></td>
                    <td><input type="number" name="CustomerId" id="CustomerId"></td>
                </tr>
                <tr>
                    <td><label for="Address">Address</label></td>
                    <td><textarea name="Address" id="Address"></textarea></td>
                </tr>
                <tr>
                    <td><input type="submit" value="insertCustomerAddress" name="submit"></td>
                    <td><input type="reset" value="Clear"></td>
                </tr>
            </table>
        </form>
    </body>
</html>