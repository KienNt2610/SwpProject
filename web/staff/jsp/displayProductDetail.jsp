<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.ProductDetail"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Details List</title>
    </head>
    <body>
        <h2>Product Details List</h2>

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

        <!-- Form tìm kiếm theo DetailId -->
        <form action="ProductDetailURL" method="get">
            <p>Search by DetailId: 
                <input type="number" name="detailId" id="detailId">
                <input type="submit" value="Search" name="submit">
                <input type="reset" value="Clear">
            </p>
        </form>

        <!-- Link thêm mới ProductDetail -->
        <p><a href="ProductDetailURL?service=insertProductDetail">Insert ProductDetail</a></p>

        <!-- Bảng hiển thị danh sách chi tiết sản phẩm -->
        <table border="1px">
            <caption><%= title %></caption>
            <tr>
                <th>DetailId</th>
                <th>ProductId</th>
                <th>Color</th>
                <th>Size</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <% 
                Vector<ProductDetail> vector = (Vector<ProductDetail>) request.getAttribute("data");
                for (ProductDetail productDetail : vector) { 
            %>
            <tr>
                <td><%= productDetail.getDetailId() %></td>
                <td><%= productDetail.getProductId() %></td>
                <td><%= productDetail.getColor() %></td>
                <td><%= productDetail.getSize() %></td>
                <td><a href="ProductDetailURL?service=updateProductDetail&detailId=<%= productDetail.getDetailId() %>">update</a></td>
                <td><a href="ProductDetailURL?service=deleteProductDetail&detailId=<%= productDetail.getDetailId() %>">delete</a></td>
            </tr>  
            <% } %>
        </table>
    </body>
</html>
