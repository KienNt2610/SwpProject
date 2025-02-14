<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Product"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
    </head>
    <body>
        <%
                 Vector<Product> vector = (Vector<Product>) request.getAttribute("data");
                 String title = (String) request.getAttribute("title");
        %>
        <form action="ProductURL" method="get">
            <p>Search by Name: <input type="text" name="pname" id="">
                <input type="submit" value="Search" name="submit">
                <input type="reset" value="Clear">
            </p>
        </form>

        <form action="ProductURL" method="get">
            <input type="hidden" name="service" value="Filter">

            <!-- Sort by Price -->
            <p>Sort by Price:
                <select name="sortBy">
                    <option value="priceAsc">Price: Low to High</option>
                    <option value="priceDesc">Price: High to Low</option>
                </select>
            </p>

            <!-- Filter by CategoryId -->
            <p>Category ID:
                <input type="text" name="categoryId" placeholder="Enter Category ID">
            </p>

            <!-- Filter Button -->
            <p><input type="submit" value="Filter"></p>
        </form>




        <p><a href="ProductURL?service=insertProduct">Insert Product</a></p>
        <table border="1px">
            <caption><%// title %></caption>
            <tr>
                <th>ProductId</th>
                <th>ProductName</th>
                <th>CategoryId</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Description</th>
                <th>Discontinued</th>
                <th>update</th>
                <th>delete</th>
            </tr>
            <% for (Product product : vector) { %>
            <tr>
                <td><%= product.getProductId() %></td>
                <td><%= product.getProductName() %></td>
                <td><%= product.getCategoryId() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getQuantity() %></td>
                <td><%= product.getDescription() %></td>
                <td><%= product.isDiscontinued() %></td>
                <td><a href="ProductURL?service=updateProduct&pid=<%= product.getProductId() %>">update</a></td>
                <td><a href="ProductURL?service=deleteProduct&pid=<%= product.getProductId() %>">delete</a></td>
            </tr>  
            <% } %>
        </table>
    </body>
</html>
