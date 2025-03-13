package controller;

import model.DBCConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "RegisterForm", urlPatterns = {"/RegisterURL"})
public class RegisterForm extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Cấu hình encoding và header cho response
        response.setContentType("text/html;charset=UTF-8");

        // Lấy các tham số từ form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        String customerName = request.getParameter("customer_name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String status = request.getParameter("status");

        // Kiểm tra mật khẩu và xác nhận mật khẩu có khớp không
        if (!password.equals(confirmPassword)) {
            try (PrintWriter out = response.getWriter()) {
                out.println("<html><body>");
                out.println("<h3>Passwords do not match!</h3>");
                out.println("<a href='register.html'>Go back</a>");
                out.println("</body></html>");
            }
            return;
        }

        // Kiểm tra customerName không bị null hoặc trống
        if (customerName == null || customerName.trim().isEmpty()) {
            try (PrintWriter out = response.getWriter()) {
                out.println("<html><body>");
                out.println("<h3>Customer name cannot be empty!</h3>");
                out.println("<a href='register.html'>Go back</a>");
                out.println("</body></html>");
            }
            return;
        }

        // Sử dụng DBCConnection để kết nối và xử lý đăng ký
        try (PrintWriter out = response.getWriter()) {
            DBCConnection dbConnection = new DBCConnection(); // Dùng constructor mặc định

            // Kiểm tra kết nối
            if (dbConnection.conn == null) {
                out.println("<html><body>");
                out.println("<h3>Unable to connect to the database!</h3>");
                out.println("</body></html>");
                return; // Dừng lại nếu không thể kết nối
            }

            // Kết nối đến cơ sở dữ liệu và kiểm tra nếu username hoặc email đã tồn tại
            String checkSql = "SELECT * FROM Customer WHERE Username = ? OR Email = ?";
            try (Connection conn = dbConnection.conn;
                 PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {

                checkStmt.setString(1, username);
                checkStmt.setString(2, email);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    out.println("<html><body>");
                    out.println("<h3>Username or email already exists!</h3>");
                    out.println("<a href='register.html'>Go back</a>");
                    out.println("</body></html>");
                } else {
                    // Gán role_id mặc định là 3 (Customer)
                    int roleId = 3;

                    // Thêm người dùng mới vào cơ sở dữ liệu
                    String insertSql = "INSERT INTO Customer (CustomerName, CusBirthDate, CusGender, Phone, Email, Username, Password, Status, RoleId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                        insertStmt.setString(1, customerName);
                        insertStmt.setString(2, dob);
                        insertStmt.setString(3, gender);
                        insertStmt.setString(4, phone);
                        insertStmt.setString(5, email);
                        insertStmt.setString(6, username);
                        insertStmt.setString(7, password);
                        insertStmt.setString(8, status);
                        insertStmt.setInt(9, roleId);  // Gán giá trị roleId mặc định là 3 (Customer)

                        int rowsAffected = insertStmt.executeUpdate();

                        if (rowsAffected > 0) {
                            // Đăng ký thành công, chuyển hướng về trang login
                            response.sendRedirect("login_index.html"); // Redirect to the login page
                        } else {
                            out.println("<html><body>");
                            out.println("<h3>Registration failed, please try again!</h3>");
                            out.println("</body></html>");
                        }
                    }
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
                out.println("<html><body>");
                out.println("<h3>Database connection error!</h3>");
                out.println("<pre>" + ex.getMessage() + "</pre>"); // In thông báo chi tiết lỗi
                out.println("</body></html>");
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
        return "Servlet for handling user registration";
    }
}
