<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="entity.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product</title>
    </head>
    <body>
        <form action="ProductURL" method="post">
        <input type="hidden" name="service" value="insertProduct">
        <table>
            <caption>Insert Product</caption>
            <tr>
                <td><label for="ProductId">ProductId</label></td>
                <td><input type="number" name="ProductId" id="ProductId" readonly></td>
            </tr>
            <tr>
                <td><label for="ProductName">ProductName</label></td>
                <td><input type="text" name="ProductName" id="ProductName"></td>
            </tr>
            <tr>
                <td><label for="CategoryId">CategoryId</label></td>
                <td><input type="number" name="CategoryId" id="CategoryId"></td>
            </tr>
            <tr>
                <td><label for="Price">Price</label></td>
                <td><input type="number" name="Price" id="Price"></td>
            </tr>
            <tr>
                <td><label for="Quantity">Quantity</label></td>
                <td><input type="number" name="Quantity" id="Quantity"></td>
            </tr>
            <tr>
                <td><label for="Description">Description</label></td>
                <td><textarea name="Description" id="Description"></textarea></td>
            </tr>
            <tr>
                <td><label for="Discontinued">Discontinued</label></td>
                <td>
                    <input type="radio" name="Discontinued" id="Discontinued" value="0"> Discontinued
                    <input type="radio" name="Discontinued" id="Discontinued" value="1" checked> Continued
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="insertProduct" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
