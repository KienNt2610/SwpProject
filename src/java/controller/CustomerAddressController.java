package controller;

import entity.CustomerAddress;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOCustomerAddress;

@WebServlet(name = "CustomerAddressController", urlPatterns = {"/CustomerAddressURL"})
public class CustomerAddressController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOCustomerAddress dao = new DAOCustomerAddress();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllCustomerAddress";
            }

            if (service.equals("Filter")) {
                // Lấy các tham số lọc từ yêu cầu
                String customerId = request.getParameter("customerId");
                String address = request.getParameter("address");

                // Khởi tạo câu lệnh SQL với điều kiện cơ bản
                String sql = "SELECT * FROM [CustomerAddress] WHERE 1=1";

                // Thêm điều kiện lọc theo CustomerId
                if (customerId != null && !customerId.trim().isEmpty()) {
                    sql += " AND CustomerId = '" + customerId + "'"; // Lọc theo CustomerId
                }

                // Thêm điều kiện lọc theo Address
                if (address != null && !address.trim().isEmpty()) {
                    sql += " AND Address LIKE '%" + address + "%'"; // Lọc theo Address
                }

                // Thực hiện truy vấn và lấy kết quả
                Vector<CustomerAddress> vector = dao.getCustomerAddress(sql);

                // Chuyển dữ liệu đến trang hiển thị
                RequestDispatcher dispath = request.getRequestDispatcher("/staff/jsp/displayCustomerAddress.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Filtered CustomerAddress List");
                dispath.forward(request, response);
            }

            if (service.equals("deleteCustomerAddress")) {
                dao.deleteCustomerAddress(Integer.parseInt(request.getParameter("aid")));
                response.sendRedirect("CustomerAddressURL?service=listAllCustomerAddress");
            }

            if (service.equals("updateCustomerAddress")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int aid = Integer.parseInt(request.getParameter("aid"));
                    Vector<CustomerAddress> vector = dao.getCustomerAddress("select * from [CustomerAddress] where AddressId=" + aid);
                    request.setAttribute("vector", vector);
                    request.getRequestDispatcher("/staff/update-jsp/updateCustomerAddress.jsp").forward(request, response);
                } else {
                    int AddressId = Integer.parseInt(request.getParameter("AddressId"));
                    int CustomerId = Integer.parseInt(request.getParameter("CustomerId"));
                    String Address = request.getParameter("Address");
                    // check data
                    if (Address.equals("")) {
                        out.print("Address is not empty");
                        return;
                    }
                    CustomerAddress customerAddress = new CustomerAddress(AddressId, CustomerId, Address);
                    int n = dao.updateCustomerAddress(customerAddress);
                    response.sendRedirect("CustomerAddressURL?service=listAllCustomerAddress");
                }
            }

            if (service.equals("insertCustomerAddress")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/staff/insert-jsp/insertCustomerAddress.jsp").forward(request, response);
                } else {
                    int CustomerId = Integer.parseInt(request.getParameter("CustomerId"));
                    String Address = request.getParameter("Address");
                    // check data
                    if (Address.equals("")) {
                        out.print("Address is not empty");
                        return;
                    }
                    CustomerAddress customerAddress = new CustomerAddress(CustomerId, Address);
                    int n = dao.addCustomerAddress(customerAddress);
                    response.sendRedirect("CustomerAddressURL?service=listAllCustomerAddress");
                }
            }

            if (service.equals("listAllCustomerAddress")) {
                String sql = "select * from [CustomerAddress]";
                String submit = request.getParameter("submit");
                String address = request.getParameter("address");
                String customerId = request.getParameter("customerId");

                if (submit == null) {
                    sql = "select * from [CustomerAddress]";
                } else {
                    sql = "select * from [CustomerAddress] where AddressId like '%" + customerId + "%'";
                }
                if (address != null) {
                    sql = "select * from [CustomerAddress] where Address like '%" + address + "%'";
                }

                Vector<CustomerAddress> vector = dao.getCustomerAddress(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/staff/jsp/displayCustomerAddress.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "CustomerAddress manager");
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