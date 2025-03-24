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

    private DAOProductDetail dao;  // Khai báo biến dao

    public ProductDetailController() {
        this.dao = new DAOProductDetail(); // Khởi tạo dao
    }

    // Hàm để thiết lập kết nối cơ sở dữ liệu
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
                "jdbc:sqlserver://DESKTOP-1CRMVJM\\MSSQLSERVER01:1433;databaseName=SWP_Project", 
                "sa", "123456");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "guestProductDetail"; // Mặc định là guestProductDetail
            }

            if ("guestProductDetail".equalsIgnoreCase(service)) {
                // Xử lý thông tin cho guestProductDetail
                handleGuestProductDetail(request, response);
            } else if ("insertProductDetail".equalsIgnoreCase(service)) {
                insertProductDetail(request, response);
            } else if ("updateProductDetail".equalsIgnoreCase(service)) {
                updateProductDetail(request, response);
            } else if ("deleteProductDetail".equalsIgnoreCase(service)) {
                deleteProductDetail(request, response);
            } else if ("filterProductDetail".equalsIgnoreCase(service)) {
                filterProductDetail(request, response);
            }
        }
    }

    private void handleGuestProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");

        if (productId != null && !productId.isEmpty()) {
            try (Connection connection = getConnection()) {
                // Truy vấn thông tin sản phẩm từ bảng Product
                String query = "SELECT * FROM Product WHERE ProductId = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, productId);
                    ResultSet resultSet = preparedStatement.executeQuery();

                    if (resultSet.next()) {
                        String name = resultSet.getString("ProductName");
                        String description = resultSet.getString("Description");
                        double price = resultSet.getDouble("Price");

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

                        uniqueColors.add(color);
                        uniqueSizes.add(size);

                        productDetail.setColor(color);
                        productDetail.setSize(size);
                        productDetails.add(productDetail);
                    }

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

    private void insertProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if (submit == null) {
            request.getRequestDispatcher("/staff/insertProductDetail.jsp").forward(request, response);
        } else {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String color = request.getParameter("color");
            String size = request.getParameter("size");

            ProductDetail productDetail = new ProductDetail(productId, color, size);
            dao.addProductDetail(productDetail);
            response.sendRedirect("ProductDetailURL?service=listAllProductDetail");
        }
    }

 private void updateProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if (submit == null) {
            int detailId = Integer.parseInt(request.getParameter("detailId"));
            ProductDetail productDetail = dao.getProductDetailById(detailId);
            request.setAttribute("productDetail", productDetail);
            request.getRequestDispatcher("/staff/updateProductDetail.jsp").forward(request, response);
        } else {
            // Lấy các tham số cần thiết từ request và chuyển đổi thành String nếu cần
            int detailId = Integer.parseInt(request.getParameter("detailId"));
            int productId = Integer.parseInt(request.getParameter("productId"));
            String color = request.getParameter("color");
            String size = request.getParameter("size");

            // Tạo đối tượng ProductDetail mới
            ProductDetail productDetail = new ProductDetail(detailId, productId, color, size);

            // Cập nhật ProductDetail
            dao.updateProductDetail(productDetail);

            // Redirect lại đến danh sách ProductDetail
            response.sendRedirect("ProductDetailURL?service=listAllProductDetail");
        }
    }





    private void deleteProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int detailId = Integer.parseInt(request.getParameter("detailId"));
        dao.deleteProductDetail(detailId);
        response.sendRedirect("ProductDetailURL?service=listAllProductDetail");
    }

    private void filterProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String color = request.getParameter("color");
        String size = request.getParameter("size");

        String sql = "SELECT * FROM ProductDetail WHERE 1=1";

        if (color != null && !color.trim().isEmpty()) {
            sql += " AND Color = '" + color + "'";
        }

        if (size != null && !size.trim().isEmpty()) {
            sql += " AND Size = '" + size + "'";
        }

        Vector<ProductDetail> filteredProductDetails = dao.getProductDetail(sql);
        request.setAttribute("data", filteredProductDetails);
        request.setAttribute("title", "Filtered Product Details List");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/staff/displayProductDetail.jsp");
        dispatcher.forward(request, response);
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
