/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;

/**
 *
 * @author Kien
 */


@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("id"));
        int quantity = 0;

        // Lấy giỏ hàng từ session
        Cart cart = (Cart) request.getSession().getAttribute("cart");

        // Nếu giỏ hàng chưa có, tạo mới giỏ hàng
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }

        Product product = getProductById(productId);

        // Xử lý các hành động trong giỏ hàng
        if ("add".equals(action)) {
            quantity = Integer.parseInt(request.getParameter("quantity"));
            cart.addItem(product, quantity);
        } else if ("remove".equals(action)) {
            cart.removeItem(productId);
        } else if ("update".equals(action)) {
            quantity = Integer.parseInt(request.getParameter("quantity"));
            cart.updateItemQuantity(productId, quantity);
        }

        // Cập nhật giỏ hàng trong session
        request.getSession().setAttribute("cart", cart);

        // Điều hướng về giỏ hàng (hoặc có thể trả về thông báo)
        response.sendRedirect("cart.jsp");
    }

    // Phương thức lấy sản phẩm từ DB (giả định)
    private Product getProductById(int productId) {
        // Trong thực tế, bạn sẽ gọi database để lấy sản phẩm theo productId
        // Dưới đây là một sản phẩm mẫu
        return new Product(productId, "Sample Product", 1, 100.0, 10, "Description", false, true, 20, new java.sql.Timestamp(System.currentTimeMillis()), 90.0);
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
