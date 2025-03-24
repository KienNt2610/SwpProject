<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.ProductDetail"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update ProductDetail</title>
    </head>
    <body>
        <h2>Update ProductDetail</h2>

        <!-- Hiển thị thông báo thành công hoặc lỗi -->
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

        <%-- Lấy thông tin sản phẩm chi tiết từ request --%>
        <%
            Vector<ProductDetail> vector = (Vector<ProductDetail>) request.getAttribute("vector");
            ProductDetail productDetail = vector.get(0);  // Lấy sản phẩm đầu tiên (sản phẩm cần cập nhật)
        %>

        <!-- Form cập nhật sản phẩm chi tiết -->
        <form action="ProductDetailURL" method="post">
            <input type="hidden" name="service" value="updateProductDetail">
            <table border="1">
                <caption>Update ProductDetail</caption>
                <tr>
                    <td><label for="DetailId">DetailId</label></td>
                    <td><input type="number" name="DetailId" id="DetailId" value="<%= productDetail.getDetailId() %>" readonly></td>
                </tr>
                <tr>
                    <td><label for="ProductId">ProductId</label></td>
                    <td><input type="number" name="ProductId" id="ProductId" value="<%= productDetail.getProductId() %>" required></td>
                </tr>
                <tr>
                    <td><label for="Color">Color</label></td>
                    <td><input type="text" name="Color" id="Color" value="<%= productDetail.getColor() %>" required></td>
                </tr>
                <tr>
                    <td><label for="Size">Size</label></td>
                    <td><input type="text" name="Size" id="Size" value="<%= productDetail.getSize() %>" required></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Update ProductDetail" name="submit"></td>
                    <td><input type="reset" value="Clear"></td>
                </tr>
            </table>
        </form>

        <!-- Liên kết quay lại trang danh sách ProductDetails -->
        <p><a href="ProductDetailURL?service=listAllProductDetail">Back to ProductDetail List</a></p>
    </body>
</html>
