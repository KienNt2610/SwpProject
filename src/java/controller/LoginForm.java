package controller;

import entity.Customer;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.DAOCustomer;

@WebServlet(name = "LoginForm", urlPatterns = {"/LoginURL", "/LogoutURL"})
public class LoginForm extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOCustomer daoCustomer = new DAOCustomer();

        String service = request.getParameter("service");
        if (service == null) {
            service = "loginPage";
        }

        if (service.equalsIgnoreCase("loginPage")) {
            // Hiển thị trang đăng nhập
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equalsIgnoreCase("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username != null && password != null) {
                // Kiểm tra thông tin đăng nhập
                Customer customer = daoCustomer.getCustomerByUsernameAndPassword(username, password);

                if (customer != null && customer.getRoleId() == 3) { // RoleId = 3 tức là Customer
                    // Nếu đăng nhập thành công, lưu thông tin khách hàng vào session
                    request.getSession().setAttribute("customer", customer);

                    // Chuyển hướng đến trang homepage sau khi đăng nhập thành công
                    response.sendRedirect("index_1.html");
                } else {
                    // Nếu thông tin không hợp lệ hoặc RoleId không phải Customer, hiển thị thông báo lỗi
                    request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không hợp lệ");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");
                    dispatcher.forward(request, response); // Quay lại trang đăng nhập và hiển thị lỗi
                }
            } else {
                request.setAttribute("errorMessage", "Vui lòng nhập tên đăng nhập và mật khẩu.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");
                dispatcher.forward(request, response); // Quay lại trang đăng nhập và hiển thị lỗi
            }
        }

        // Xử lý yêu cầu logout
        if (service.equalsIgnoreCase("logout")) {
            // Hủy session để đăng xuất người dùng
            request.getSession().invalidate();

            // Chuyển hướng về trang đăng nhập sau khi đăng xuất thành công
            response.sendRedirect("Login.jsp");
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
        return "Login Controller";
    }
}
