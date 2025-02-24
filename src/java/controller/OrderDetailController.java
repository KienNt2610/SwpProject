package controller;

import entity.OrderDetail;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOOrderDetail;

@WebServlet(name = "OrderDetailController", urlPatterns = {"/OrderDetailURL"})
public class OrderDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOOrderDetail dao = new DAOOrderDetail();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllOrderDetail";
            }
            if (service.equals("deleteOrderDetail")) {
                int orderId = Integer.parseInt(request.getParameter("oid"));
                int productId = Integer.parseInt(request.getParameter("pid"));
                dao.deleteOrderDetail(orderId, productId);
                response.sendRedirect("OrderDetailURL?service=listAllOrderDetail");
            }

            if (service.equals("updateOrderDetail")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int oid = Integer.parseInt(request.getParameter("oid"));
                    int pid = Integer.parseInt(request.getParameter("pid"));
                    Vector<OrderDetail> vector = dao.getOrderDetail("select * from [OrderDetail] where OrderId=" + oid + " and ProductId=" + pid);
                    request.setAttribute("vector", vector);
                    request.getRequestDispatcher("/update-jsp/updateOrderDetail.jsp").forward(request, response);
                } else {
                    int OrderId = Integer.parseInt(request.getParameter("OrderId"));
                    int ProductId = Integer.parseInt(request.getParameter("ProductId"));
                    int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                    double Price = Double.parseDouble(request.getParameter("Price"));
                    OrderDetail orderDetail = new OrderDetail(OrderId, ProductId, Quantity, Price);
                    int n = dao.updateOrderDetail(orderDetail);
                    response.sendRedirect("OrderDetailURL?service=listAllOrderDetail");
                }
            }

            if (service.equals("insertOrderDetail")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/insert-jsp/insertOrderDetail.jsp").forward(request, response);
                } else {
                    int OrderId = Integer.parseInt(request.getParameter("OrderId"));
                    int ProductId = Integer.parseInt(request.getParameter("ProductId"));
                    int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                    double Price = Double.parseDouble(request.getParameter("Price"));
                    OrderDetail orderDetail = new OrderDetail(OrderId, ProductId, Quantity, Price);
                    int n = dao.addOrderDetail(orderDetail);
                    response.sendRedirect("OrderDetailURL?service=listAllOrderDetail");
                }
            }

            if (service.equals("listAllOrderDetail")) {
                String sql = "select * from [OrderDetail]";
                String submit = request.getParameter("submit");
                String message = request.getParameter("message");
                String orderId = request.getParameter("orderId");

                if (submit == null) {
                    sql = "select * from [OrderDetail]";
                } else {
                    sql = "select * from [OrderDetail] where Message like '%" + message + "%'";
                }
                if (orderId != null) {
                    sql = "select * from [OrderDetail] where OrderId like '" + orderId + "'";
                }

                Vector<OrderDetail> vector = dao.getOrderDetail(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/displayOrderDetail.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "OrderDetail manager");
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