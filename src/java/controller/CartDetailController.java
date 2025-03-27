package controller;

import entity.CartDetail;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOCartDetail;

@WebServlet(name = "CartDetailController", urlPatterns = {"/CartDetailURL"})
public class CartDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOCartDetail dao = new DAOCartDetail();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllCartDetail";
            }

            if (service.equals("Filter")) {
                // Lấy các tham số lọc từ yêu cầu
                String sortBy = request.getParameter("sortBy");
                String productId = request.getParameter("productId");
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");

                // Khởi tạo câu lệnh SQL với điều kiện cơ bản
                String sql = "SELECT * FROM [CartDetail] WHERE 1=1";

                // Thêm điều kiện lọc theo ProductId
                if (productId != null && !productId.trim().isEmpty()) {
                    sql += " AND ProductId = '" + productId + "'"; // Lọc theo ProductId
                }

                // Thêm điều kiện lọc theo khoảng thời gian (startDate, endDate)
                if (startDate != null && !startDate.trim().isEmpty() && endDate != null && !endDate.trim().isEmpty()) {
                    sql += " AND [AddDate] BETWEEN '" + startDate + "' AND '" + endDate + "'"; // Lọc theo khoảng thời gian
                }

                // Thêm điều kiện sắp xếp theo Quantity
                if ("quantityAsc".equals(sortBy)) {
                    sql += " ORDER BY Quantity ASC"; // Sắp xếp tăng dần theo Quantity
                } else if ("quantityDesc".equals(sortBy)) {
                    sql += " ORDER BY Quantity DESC"; // Sắp xếp giảm dần theo Quantity
                }

                // Thực hiện truy vấn và lấy kết quả
                Vector<CartDetail> vector = dao.getCartDetail(sql);

                // Chuyển dữ liệu đến trang hiển thị
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/displayCartDetail.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Filtered CartDetail List");
                dispath.forward(request, response);
            }

            if (service.equals("deleteCartDetail")) {
                dao.deleteCartDetail(Integer.parseInt(request.getParameter("cdid")));
                response.sendRedirect("CartDetailURL?service=listAllCartDetail");
            }

            if (service.equals("updateCartDetail")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int cdid = Integer.parseInt(request.getParameter("cdid"));
                    Vector<CartDetail> vector = dao.getCartDetail("select * from [CartDetail] where CartDetailId=" + cdid);
                    request.setAttribute("vector", vector);
                    request.getRequestDispatcher("/update-jsp/updateCartDetail.jsp").forward(request, response);
                } else {
                    int CartDetailId = Integer.parseInt(request.getParameter("CartDetailId"));
                    int ProductId = Integer.parseInt(request.getParameter("ProductId"));
                    int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                    double Price = Double.parseDouble(request.getParameter("Price"));
                    java.util.Date AddDate = java.sql.Date.valueOf(request.getParameter("AddDate"));
                    java.util.Date AddTime = java.sql.Time.valueOf(request.getParameter("AddTime"));
                    // check data
                    CartDetail cartDetail = new CartDetail(CartDetailId, ProductId, Quantity, Price, AddDate, AddTime);
                    int n = dao.updateCartDetail(cartDetail);
                    response.sendRedirect("CartDetailURL?service=listAllCartDetail");
                }
            }

            if (service.equals("insertCartDetail")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/insert-jsp/insertCartDetail.jsp").forward(request, response);
                } else {
                    int ProductId = Integer.parseInt(request.getParameter("ProductId"));
                    int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                    double Price = Double.parseDouble(request.getParameter("Price"));
                    java.util.Date AddDate = java.sql.Date.valueOf(request.getParameter("AddDate"));
                    java.util.Date AddTime = java.sql.Time.valueOf(request.getParameter("AddTime"));
                    // check data
                    CartDetail cartDetail = new CartDetail(ProductId, Quantity, Price, AddDate, AddTime);
                    int n = dao.addCartDetail(cartDetail);
                    response.sendRedirect("CartDetailURL?service=listAllCartDetail");
                }
            }

            if (service.equals("listAllCartDetail")) {
                String sql = "select * from [CartDetail]";
                String submit = request.getParameter("submit");
                String productId = request.getParameter("productId");
                String cartDetailId = request.getParameter("cartDetailId");

                if (submit == null) {
                    sql = "select * from [CartDetail]";
                } else {
                    sql = "select * from [CartDetail] where CartDetailId like '%" + cartDetailId + "%'";
                }
                if (productId != null) {
                    sql = "select * from [CartDetail] where ProductId like '" + productId + "'";
                }

                Vector<CartDetail> vector = dao.getCartDetail(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/displayCartDetail.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "CartDetail manager");
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
