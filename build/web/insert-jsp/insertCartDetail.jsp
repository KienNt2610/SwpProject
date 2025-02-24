<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert CartDetail</title>
    </head>
    <body>
        <form action="CartDetailURL" method="post">
            <input type="hidden" name="service" value="insertCartDetail">
            <table>
                <caption>Insert CartDetail</caption>
                <tr>
                    <td><label for="CartDetailId">CartDetailId</label></td>
                    <td><input type="number" name="CartDetailId" id="CartDetailId" readonly></td>
                </tr>
                <tr>
                    <td><label for="ProductId">ProductId</label></td>
                    <td><input type="number" name="ProductId" id="ProductId"></td>
                </tr>
                <tr>
                    <td><label for="Quantity">Quantity</label></td>
                    <td><input type="number" name="Quantity" id="Quantity"></td>
                </tr>
                <tr>
                    <td><label for="Price">Price</label></td>
                    <td><input type="number" name="Price" id="Price"></td>
                </tr>
                <tr>
                    <td><label for="AddDate">AddDate</label></td>
                    <td><input type="date" name="AddDate" id="AddDate"></td>
                </tr>
                <tr>
                    <td><label for="AddTime">AddTime</label></td>
                    <td><input type="time" name="AddTime" id="AddTime"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="insertCartDetail" name="submit"></td>
                    <td><input type="reset" value="Clear"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
