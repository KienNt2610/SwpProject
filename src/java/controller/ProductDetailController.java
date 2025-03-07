package controller;

import entity.ProductDetail;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOProductDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.HashSet;
import java.util.Set;
import java.util.Vector;

@WebServlet(name = "ProductDetailController", urlPatterns = {"/ProductDetailURL"})
public class ProductDetailController extends HttpServlet {

    // Hàm để thiết lập kết nối cơ sở dữ liệu
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
                "jdbc:sqlserver://DESKTOP-1CRMVJM\\MSSQLSERVER01:1433;databaseName=SWP_Project", 
                "sa", "123456");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOProductDetail dao = new DAOProductDetail();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllProductDetail";
            }

            // Xử lý cho guestProductDetail
            String productId = request.getParameter("productId"); // Lấy productId từ request

            if (productId != null && !productId.isEmpty()) {
                try (Connection connection = getConnection()) {
                    // Truy vấn thông tin sản phẩm từ bảng Product
                    String query = "SELECT * FROM Product WHERE ProductId = ?";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                        preparedStatement.setString(1, productId);
                        ResultSet resultSet = preparedStatement.executeQuery();

                        if (resultSet.next()) {
                            // Lấy thông tin sản phẩm
                            String name = resultSet.getString("ProductName");
                            String description = resultSet.getString("Description");
                            double price = resultSet.getDouble("Price");

                            // Truyền dữ liệu vào request để JSP có thể sử dụng
                            request.setAttribute("productName", name);
                            request.setAttribute("productDescription", description);
                            request.setAttribute("productPrice", price);
                        }
                    }

                    // Truy vấn chi tiết sản phẩm từ bảng ProductDetail
                    String detailQuery = "SELECT * FROM ProductDetail WHERE ProductId = ?";
                    try (PreparedStatement detailStmt = connection.prepareStatement(detailQuery)) {
                        detailStmt.setString(1, productId);
                        ResultSet detailResultSet = detailStmt.executeQuery();

                        Vector<ProductDetail> productDetails = new Vector<>();
                        Set<String> uniqueColors = new HashSet<>();
                        Set<String> uniqueSizes = new HashSet<>();
                        while (detailResultSet.next()) {
                            ProductDetail productDetail = new ProductDetail();
                            String color = detailResultSet.getString("Color");
                            String size = detailResultSet.getString("Size");

                            // Thêm màu và kích thước vào Set để loại bỏ trùng lặp
                            uniqueColors.add(color);
                            uniqueSizes.add(size);

                            productDetail.setColor(color);
                            productDetail.setSize(size);
                            productDetails.add(productDetail);
                        }

                        // Truyền chi tiết sản phẩm và màu sắc/kích thước duy nhất vào request
                        request.setAttribute("productDetails", productDetails);
                        request.setAttribute("uniqueColors", uniqueColors);
                        request.setAttribute("uniqueSizes", uniqueSizes);
                    }

                } catch (SQLException e) {
                    e.printStackTrace();
                    request.setAttribute("errorMessage", "Database error occurred");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/guest/error.jsp");
                    dispatcher.forward(request, response);
                    return;
                }

                // Chuyển tiếp đến guestProductDetail.jsp
                RequestDispatcher dispatcher = request.getRequestDispatcher("guest/display/guestProductDetail.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "ProductDetailController Servlet";
    }
}
