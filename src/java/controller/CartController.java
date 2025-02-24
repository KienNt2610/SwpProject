package controller;

import entity.Cart;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOCart;

@WebServlet(name = "CartController", urlPatterns = {"/CartURL"})
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOCart dao = new DAOCart();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllCart";
            }

            if (service.equals("Filter")) {
                // Lấy các tham số lọc từ yêu cầu
                String sortBy = request.getParameter("sortBy");
                String customerId = request.getParameter("customerId");
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");

                // Khởi tạo câu lệnh SQL với điều kiện cơ bản
                String sql = "SELECT * FROM [Cart] WHERE 1=1";

                // Thêm điều kiện lọc theo CustomerId
                if (customerId != null && !customerId.trim().isEmpty()) {
                    sql += " AND CustomerId = '" + customerId + "'"; // Lọc theo CustomerId
                }

                // Thêm điều kiện lọc theo khoảng thời gian (startDate, endDate)
                if (startDate != null && !startDate.trim().isEmpty() && endDate != null && !endDate.trim().isEmpty()) {
                    sql += " AND [AddDate] BETWEEN '" + startDate + "' AND '" + endDate + "'"; // Lọc theo khoảng thời gian
                }

                // Thêm điều kiện sắp xếp theo TotalPrice
                if ("totalPriceAsc".equals(sortBy)) {
                    sql += " ORDER BY TotalPrice ASC"; // Sắp xếp tăng dần theo TotalPrice
                } else if ("totalPriceDesc".equals(sortBy)) {
                    sql += " ORDER BY TotalPrice DESC"; // Sắp xếp giảm dần theo TotalPrice
                }

                // Thực hiện truy vấn và lấy kết quả
                Vector<Cart> vector = dao.getCart(sql);

                // Chuyển dữ liệu đến trang hiển thị
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/displayCart.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Filtered Cart List");
                dispath.forward(request, response);
            }

            if (service.equals("deleteCart")) {
                dao.deleteCart(Integer.parseInt(request.getParameter("cid")));
                response.sendRedirect("CartURL?service=listAllCart");
            }

            if (service.equals("updateCart")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int cid = Integer.parseInt(request.getParameter("cid"));
                    Vector<Cart> vector = dao.getCart("select * from [Cart] where CartId=" + cid);
                    request.setAttribute("vector", vector);
                    request.getRequestDispatcher("/update-jsp/updateCart.jsp").forward(request, response);
                } else {
                    int CartId = Integer.parseInt(request.getParameter("CartId"));
                    int CustomerId = Integer.parseInt(request.getParameter("CustomerId"));
                    double TotalPrice = Double.parseDouble(request.getParameter("TotalPrice"));
                    java.util.Date AddDate = java.sql.Date.valueOf(request.getParameter("AddDate"));
                    // check data
                    Cart cart = new Cart(CartId, CustomerId, TotalPrice, AddDate);
                    int n = dao.updateCart(cart);
                    response.sendRedirect("CartURL?service=listAllCart");
                }
            }

            if (service.equals("insertCart")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/insert-jsp/insertCart.jsp").forward(request, response);
                } else {
                    int CustomerId = Integer.parseInt(request.getParameter("CustomerId"));
                    double TotalPrice = Double.parseDouble(request.getParameter("TotalPrice"));
                    java.util.Date AddDate = java.sql.Date.valueOf(request.getParameter("AddDate"));
                    // check data
                    Cart cart = new Cart(CustomerId, TotalPrice, AddDate);
                    int n = dao.addCart(cart);
                    response.sendRedirect("CartURL?service=listAllCart");
                }
            }

            if (service.equals("listAllCart")) {
                String sql = "select * from [Cart]";
                String submit = request.getParameter("submit");
                String customerId = request.getParameter("customerId");
                String cartId = request.getParameter("cartId");

                if (submit == null) {
                    sql = "select * from [Cart]";
                } else {
                    sql = "select * from [Cart] where CartId like '%" + cartId + "%'";
                }
                if (customerId != null) {
                    sql = "select * from [Cart] where CustomerId like '" + customerId + "'";
                }

                Vector<Cart> vector = dao.getCart(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/displayCart.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Cart manager");
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
