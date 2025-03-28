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
import static java.lang.System.out;
import java.sql.*;
import java.util.HashSet;
import java.util.Set;
import java.util.Vector;

@WebServlet(name = "ProductDetailController", urlPatterns = {"/ProductDetailURL"})
public class ProductDetailController extends HttpServlet {

    private DAOProductDetail dao;

    public ProductDetailController() {
        this.dao = new DAOProductDetail();
    }

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
                service = "guestProductDetail";
            }

            switch (service.toLowerCase()) {
                case "guestproductdetail":
                    handleGuestProductDetail(request, response);
                    break;
                case "insertproductdetail":
                    insertProductDetail(request, response);
                    break;
                case "updateproductdetail":
                    updateProductDetail(request, response);
                    break;
                case "deleteproductdetail":
                    deleteProductDetail(request, response);
                    break;
                case "filterproductdetail":
                    filterProductDetail(request, response);
                    break;
                case "listallproductdetail":
                    listAllProductDetail(request, response);
                    break;
                default:
                    throw new ServletException("Invalid service parameter");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/guest/error.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void handleGuestProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");
        request.setAttribute("productId", productId);

        if (productId != null && !productId.isEmpty()) {
            try (Connection connection = getConnection()) {
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

            RequestDispatcher dispatcher = request.getRequestDispatcher("guest/display/guestProductDetail.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void insertProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if (submit == null) {
            request.getRequestDispatcher("/staff/insert-jsp/insertProductDetail.jsp").forward(request, response);
        } else {
            int ProductId = Integer.parseInt(request.getParameter("ProductId"));
            String Color = request.getParameter("Color");
            String Size = request.getParameter("Size");

            if (ProductId == 0) {
                out.print("ProductId can't be 0");
                return;
            }

            ProductDetail productDetail = new ProductDetail(ProductId, Color, Size);
            int n = dao.addProductDetail(productDetail);
            response.sendRedirect("ProductDetailURL?service=listAllProductDetail");
        }
    }

    private void updateProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if (submit == null) {
            int detailId = Integer.parseInt(request.getParameter("detailId"));
            Vector<ProductDetail> vector = dao.getProductDetail("select * from ProductDetail where DetailId=" + detailId);
            request.setAttribute("vector", vector);
            request.getRequestDispatcher("/staff/update-jsp/updateProductDetail.jsp").forward(request, response);
        } else {
            int DetailId = Integer.parseInt(request.getParameter("DetailId"));
            int ProductId = Integer.parseInt(request.getParameter("ProductId"));
            String Color = request.getParameter("Color");
            String Size = request.getParameter("Size");

            if (ProductId == 0) {
                out.print("ProductId can't be 0");
                return;
            }

            ProductDetail productDetail = new ProductDetail(DetailId, ProductId, Color, Size);
            int n = dao.updateProductDetail(productDetail);
            response.sendRedirect("ProductDetailURL?service=listAllProductDetail");
        }
    }

    private void deleteProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int detailId = Integer.parseInt(request.getParameter("detailId"));
            dao.deleteProductDetail(detailId);
            // Kiểm tra trước khi thực hiện redirect
            if (!response.isCommitted()) {
                response.sendRedirect("ProductDetailURL?service=listAllProductDetail");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid detail ID");
            // Kiểm tra trước khi forward
            if (!response.isCommitted()) {
                request.getRequestDispatcher("/guest/error.jsp").forward(request, response);
            }
        }
    }

    private void filterProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if (submit == null) {
            request.getRequestDispatcher("/staff/jsp/displayProductDetail.jsp").forward(request, response);
        } else {
            String productIdParam = request.getParameter("productId");
            if (productIdParam != null && !productIdParam.isEmpty()) {
                try {
                    int productId = Integer.parseInt(productIdParam);  
                    String sql = "SELECT * FROM ProductDetail WHERE ProductId = " + productId;

                    Vector<ProductDetail> productDetails = dao.getProductDetail(sql);
                    if (productDetails != null && !productDetails.isEmpty()) {
                        request.setAttribute("data", productDetails);  
                        request.setAttribute("title", "Search Results");
                    } else {
                        request.setAttribute("errorMessage", "No product found for the given ProductId.");
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("errorMessage", "Invalid ProductId format.");
                }
            } else {
                request.setAttribute("errorMessage", "Search criteria is missing or invalid.");
            }
            request.getRequestDispatcher("/staff/jsp/displayProductDetail.jsp").forward(request, response);
        }
    }

    private void listAllProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sql = "select * from ProductDetail";
        String submit = request.getParameter("submit");
        String detailId = request.getParameter("detailId");

        if (submit == null) {
            sql = "select * from ProductDetail";
        } else {
            // Sử dụng DetailId thay vì ProductId để tìm kiếm
            if (detailId != null) {
                sql = "select * from ProductDetail where DetailId = " + detailId;
            }
        }

        Vector<ProductDetail> vector = dao.getProductDetail(sql);
        RequestDispatcher dispath = request.getRequestDispatcher("/staff/jsp/displayProductDetail.jsp");
        request.setAttribute("data", vector);
        request.setAttribute("title", "ProductDetail Manager");
        dispath.forward(request, response);
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
