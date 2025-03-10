package controller;

import entity.Customer;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOCustomer;

@WebServlet(name = "CustomerController", urlPatterns = {"/CustomerURL"})
public class CustomerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOCustomer dao = new DAOCustomer();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllCustomer";
            }

            if (service.equals("Filter")) {
                String sortBy = request.getParameter("sortBy");
                String roleId = request.getParameter("roleId");

                // Khởi tạo câu lệnh SQL với điều kiện cơ bản
                String sql = "SELECT * FROM Customer WHERE 1=1"; 

                // Thêm điều kiện lọc theo roleId
                if (roleId != null && !roleId.trim().isEmpty()) {
                    sql += " AND RoleId = '" + roleId + "'"; // Lọc theo RoleId
                }

                // Thêm điều kiện sắp xếp theo tên
                if ("nameAsc".equals(sortBy)) {
                    sql += " ORDER BY CustomerName ASC"; // Sắp xếp tăng dần theo tên
                } else if ("nameDesc".equals(sortBy)) {
                    sql += " ORDER BY CustomerName DESC"; // Sắp xếp giảm dần theo tên
                }

                Vector<Customer> vector = dao.getCustomer(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/displayCustomer.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Filtered Customer List");
                dispath.forward(request, response);
            }

            if (service.equals("deleteCustomer")) {
                dao.deleteCustomer(Integer.parseInt(request.getParameter("cid")));
                response.sendRedirect("CustomerURL?service=listAllCustomer");
            }

            if (service.equals("updateCustomer")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int cid = Integer.parseInt(request.getParameter("cid"));
                    Vector<Customer> vector = dao.getCustomer("SELECT * FROM Customer WHERE CustomerId=" + cid);
                    request.setAttribute("vector", vector);
                    request.getRequestDispatcher("/update-jsp/updateCustomer.jsp").forward(request, response);
                } else {
                    int CustomerId = Integer.parseInt(request.getParameter("CustomerId"));
                    String CustomerName = request.getParameter("CustomerName");
                    String CusBirthDate = request.getParameter("CusBirthDate");
                    String CusGender = request.getParameter("CusGender");
                    String Phone = request.getParameter("Phone");
                    String Email = request.getParameter("Email");
                    String Username = request.getParameter("Username");
                    String Password = request.getParameter("Password");
                    String Status = request.getParameter("Status");
                    int RoleId = Integer.parseInt(request.getParameter("RoleId"));
                    // check data
                    if (CustomerName.equals("")) {
                        out.print("Customer name is not empty");
                        return;
                    }
                    Customer customer = new Customer(CustomerId, CustomerName, CusBirthDate, CusGender, Phone, Email, Username, Password, Status, RoleId);
                    int n = dao.updateCustomer(customer);
                    response.sendRedirect("CustomerURL?service=listAllCustomer");
                }
            }

            if (service.equals("insertCustomer")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/insert-jsp/insertCustomer.jsp").forward(request, response);
                } else {
                    String CustomerName = request.getParameter("CustomerName");
                    String CusBirthDate = request.getParameter("CusBirthDate");
                    String CusGender = request.getParameter("CusGender");
                    String Phone = request.getParameter("Phone");
                    String Email = request.getParameter("Email");
                    String Username = request.getParameter("Username");
                    String Password = request.getParameter("Password");
                    String Status = request.getParameter("Status");
                    int RoleId = Integer.parseInt(request.getParameter("RoleId"));
                    // check data
                    if (CustomerName.equals("")) {
                        out.print("Customer name is not empty");
                        return;
                    }
                    Customer customer = new Customer(CustomerName, CusBirthDate, CusGender, Phone, Email, Username, Password, Status, RoleId);
                    int n = dao.addCustomer(customer);
                    response.sendRedirect("CustomerURL?service=listAllCustomer");
                }
            }

            if (service.equals("listAllCustomer")) {
                String sql = "select * from Customer";
                String submit = request.getParameter("submit");
                String cname = request.getParameter("cname");
                String roleId = request.getParameter("roleId");

                if (submit == null) {
                    sql = "select * from Customer";
                } else {
                    sql = "select * from Customer where CustomerName like '%" + cname + "%'";
                }
                if (roleId != null) {
                    sql = "select * from Customer where RoleId like '" + roleId + "'";
                }

                Vector<Customer> vector = dao.getCustomer(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/displayCustomer.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Customer manager");
                dispath.forward(request, response);
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
        return "Short description";
    }
}
