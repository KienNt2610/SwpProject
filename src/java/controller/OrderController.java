package controller;

import entity.Order;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOOrder;

@WebServlet(name = "OrderController", urlPatterns = {"/OrderURL"})
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOOrder dao = new DAOOrder();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllOrder";
            }

            if (service.equals("Filter")) {
                // Lấy các tham số lọc từ yêu cầu
                String sortBy = request.getParameter("sortBy");
                String customerId = request.getParameter("customerId");
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");

                // Khởi tạo câu lệnh SQL với điều kiện cơ bản
                String sql = "SELECT * FROM [Order] WHERE 1=1"; 

                // Thêm điều kiện lọc theo CustomerId
                if (customerId != null && !customerId.trim().isEmpty()) {
                    sql += " AND CustomerId = '" + customerId + "'"; // Lọc theo CustomerId
                }

                // Thêm điều kiện lọc theo khoảng thời gian (startDate, endDate)
                if (startDate != null && !startDate.trim().isEmpty() && endDate != null && !endDate.trim().isEmpty()) {
                    sql += " AND [Date] BETWEEN '" + startDate + "' AND '" + endDate + "'"; // Lọc theo khoảng thời gian
                }

                // Thêm điều kiện sắp xếp theo TotalPrice
                if ("totalPriceAsc".equals(sortBy)) {
                    sql += " ORDER BY TotalPrice ASC"; // Sắp xếp tăng dần theo TotalPrice
                } else if ("totalPriceDesc".equals(sortBy)) {
                    sql += " ORDER BY TotalPrice DESC"; // Sắp xếp giảm dần theo TotalPrice
                }

                // Thực hiện truy vấn và lấy kết quả
                Vector<Order> vector = dao.getOrder(sql);

                // Chuyển dữ liệu đến trang hiển thị
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/displayOrder.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Filtered Order List");
                dispath.forward(request, response);
            }

            if (service.equals("deleteOrder")) {
                dao.deleteOrder(Integer.parseInt(request.getParameter("oid")));
                response.sendRedirect("OrderURL?service=listAllOrder");
            }

            if (service.equals("updateOrder")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int oid = Integer.parseInt(request.getParameter("oid"));
                    Vector<Order> vector = dao.getOrder("select * from [Order] where OrderId=" + oid);
                    request.setAttribute("vector", vector);
                    request.getRequestDispatcher("/update-jsp/updateOrder.jsp").forward(request, response);
                } else {
                    int OrderId = Integer.parseInt(request.getParameter("OrderId"));
                    int CustomerId = Integer.parseInt(request.getParameter("CustomerId"));
                    double TotalPrice = Double.parseDouble(request.getParameter("TotalPrice"));
                    java.util.Date Date = java.sql.Date.valueOf(request.getParameter("Date"));
                    String Message = request.getParameter("Message");
                    int EmployeeId = Integer.parseInt(request.getParameter("EmployeeId"));
                    // check data
                    if (Message.equals("")) {
                        out.print("Message is not empty");
                        return;
                    }
                    Order order = new Order(OrderId, CustomerId, TotalPrice, Date, Message, EmployeeId);
                    int n = dao.updateOrder(order);
                    response.sendRedirect("OrderURL?service=listAllOrder");
                }
            }

            if (service.equals("insertOrder")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/insert-jsp/insertOrder.jsp").forward(request, response);
                } else {
                    int CustomerId = Integer.parseInt(request.getParameter("CustomerId"));
                    double TotalPrice = Double.parseDouble(request.getParameter("TotalPrice"));
                    java.util.Date Date = java.sql.Date.valueOf(request.getParameter("Date"));
                    String Message = request.getParameter("Message");
                    int EmployeeId = Integer.parseInt(request.getParameter("EmployeeId"));
                    // check data
                    if (Message.equals("")) {
                        out.print("Message is not empty");
                        return;
                    }
                    Order order = new Order(CustomerId, TotalPrice, Date, Message, EmployeeId);
                    int n = dao.addOrder(order);
                    response.sendRedirect("OrderURL?service=listAllOrder");
                }
            }

            if (service.equals("listAllOrder")) {
                String sql = "select * from [Order]";
                String submit = request.getParameter("submit");
                String message = request.getParameter("message");
                String customerId = request.getParameter("customerId");
                String orderId = request.getParameter("orderId");

                if (submit == null) {
                    sql = "select * from [Order]";
                } else {
                    sql = "select * from [Order] where OrderId like '%" + orderId + "%'";
                }
                if (customerId != null) {
                    sql = "select * from [Order] where CustomerId like '" + customerId + "'";
                }

                Vector<Order> vector = dao.getOrder(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/displayOrder.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Order manager");
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
