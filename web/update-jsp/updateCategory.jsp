<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, java.util.Vector"%>
<%@page import="entity.Category"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Category</title>
    </head>
    <%
        Vector<Category> vector = (Vector<Category>) request.getAttribute("vector");
        Category category = vector.get(0);
    %>
    <body>
        <form action="CategoryURL" method="post">
        <input type="hidden" name="service" value="updateCategory">
        <table>
            <caption>Update Category</caption>
            <tr>
               <td><label for="CategoryId">CategoryId</label></td>
               <td><input type="number" name="CategoryId" id="CategoryId" value="<%= category.getCategoryId() %>"></td>
            </tr>
            <tr>
                <td><label for="CategoryName">CategoryName</label></td>
                <td><input type="text" name="CategoryName" id="CategoryName" value="<%= category.getCategoryName() %>"></td>
             </tr>
             <tr>
                <td><input type="submit" value="updateCategory" name="submit"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table