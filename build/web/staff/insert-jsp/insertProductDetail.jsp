<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.ProductDetail"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Insert ProductDetail</title>
    </head>
    <body>
        <h2>Insert ProductDetail</h2>

        <!-- Hiển thị thông báo lỗi hoặc thành công nếu có -->
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
                out.println("<p style='color:red;'>" + errorMessage + "</p>");
            }
            
            String successMessage = (String) request.getAttribute("successMessage");
            if (successMessage != null) {
                out.println("<p style='color:green;'>" + successMessage + "</p>");
            }
        %>

        <!-- Form để thêm ProductDetail -->
        <form action="ProductDetailURL" method="post">
            <input type="hidden" name="service" value="insertProductDetail">
            <table border="1">
                <caption>Insert ProductDetail</caption>
                <tr>
                    <td><label for="ProductId">ProductId</label></td>
                    <td><input type="number" name="ProductId" id="ProductId" required></td>
                </tr>
                <tr>
                    <td><label for="Color">Color</label></td>
                    <td><input type="text" name="Color" id="Color" required></td>
                </tr>
                <tr>
                    <td><label for="Size">Size</label></td>
                    <td><input type="text" name="Size" id="Size" required></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Insert ProductDetail" name="submit"></td>
                    <td><input type="reset" value="Clear"></td>
                </tr>
            </table>
        </form>

        <!-- Liên kết quay lại trang quản lý ProductDetails -->
        <p><a href="ProductDetailURL?service=listAllProductDetail">Back to ProductDetail List</a></p>
    </body>
</html>
