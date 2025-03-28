package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import model.DBCConnection; // Import DBCConnection
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Kien
 */
@WebServlet(name = "DashboardServlet", urlPatterns = {"/DashboardServlet"})
public class DashboardServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        // JDBC objects
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try (PrintWriter out = response.getWriter()) {
            // Sử dụng DBCConnection để kết nối đến cơ sở dữ liệu
            DBCConnection dbConn = new DBCConnection(); // DBCConnection sẽ tự động kết nối
            conn = dbConn.conn; // Lấy kết nối từ DBCConnection

            stmt = conn.createStatement();

            // Số lượng sản phẩm trong kho
            String inventoryQuery = "SELECT SUM(Quantity) AS TotalInventory FROM Product WHERE Discontinued = 0";
            rs = stmt.executeQuery(inventoryQuery);
            rs.next();
            int totalInventory = rs.getInt("TotalInventory");

            // Tổng số lượng sản phẩm đã bán
            String soldQuery = "SELECT SUM(SoldQuantity) AS TotalSold FROM Product";
            rs = stmt.executeQuery(soldQuery);
            rs.next();
            int totalSold = rs.getInt("TotalSold");

            // Top 5 sản phẩm bán chạy nhất
            String topSellingQuery = "SELECT ProductName, SUM(SoldQuantity) AS QuantitySold FROM Product GROUP BY ProductName ORDER BY QuantitySold DESC LIMIT 5";
            rs = stmt.executeQuery(topSellingQuery);
            List<Map<String, Object>> topSellingProducts = new ArrayList<>();
            while (rs.next()) {
                Map<String, Object> productData = new HashMap<>();
                productData.put("ProductName", rs.getString("ProductName"));
                productData.put("QuantitySold", rs.getInt("QuantitySold"));
                topSellingProducts.add(productData);
            }

            // Sản phẩm có ít hơn 5 sản phẩm trong kho
            String lowStockQuery = "SELECT ProductName, Quantity FROM Product WHERE Quantity < 5 AND Discontinued = 0";
            rs = stmt.executeQuery(lowStockQuery);
            List<Map<String, Object>> lowStockProducts = new ArrayList<>();
            while (rs.next()) {
                Map<String, Object> productData = new HashMap<>();
                productData.put("ProductName", rs.getString("ProductName"));
                productData.put("Quantity", rs.getInt("Quantity"));
                lowStockProducts.add(productData);
            }

            // Doanh thu theo sản phẩm (tính tổng doanh thu)
            String revenueQuery = "SELECT ProductName, SUM(SalePrice * SoldQuantity) AS Revenue FROM Product GROUP BY ProductName";
            rs = stmt.executeQuery(revenueQuery);
            List<Map<String, Object>> revenueData = new ArrayList<>();
            while (rs.next()) {
                Map<String, Object> revenue = new HashMap<>();
                revenue.put("ProductName", rs.getString("ProductName"));
                revenue.put("Revenue", rs.getBigDecimal("Revenue"));
                revenueData.add(revenue);
            }

            // Truyền dữ liệu vào request để gửi tới JSP
            request.setAttribute("totalInventory", totalInventory);
            request.setAttribute("totalSold", totalSold);
            request.setAttribute("topSellingProducts", topSellingProducts);
            request.setAttribute("lowStockProducts", lowStockProducts);
            request.setAttribute("revenueData", revenueData);

            // Chuyển hướng tới trang dashboard.jsp
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle error and log it
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
