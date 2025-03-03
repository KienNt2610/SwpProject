<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Category"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category List</title>
    </head>
    <body>
   <%
        Vector<Category> vector = (Vector<Category>) request.getAttribute("data");
        String title = (String) request.getAttribute("title");
    %>
    <form action="CategoryURL" method="get">
        <p>Search by Category ID: <input type="text" name="categoryId" id="">
        <input type="submit" value="Search" name="submit">
        <input type="reset" value="Clear">
    </p>
    </form>

    
    <p><a href="CategoryURL?service=insertCategory">Insert Category</a></p>
    <table border="1px">
       <caption><%= title %></caption>
        <tr>
            <th>CategoryId</th>
            <th>CategoryName</th>
            <th>update</th>
            <th>delete</th>
        </tr>
        <% for (Category category : vector) { %>
          <tr>
             <td><%= category.getCategoryId() %></td>
             <td><%= category.getCategoryName() %></td>
             <td><a href="CategoryURL?service=updateCategory&cid=<%= category.getCategoryId() %>">update</a></td>
             <td><a href="CategoryURL?service=deleteCategory&cid=<%= category.getCategoryId() %>">delete</a></td>
          </tr>  
        <% } %>
    </table>
    </body>
</html>
