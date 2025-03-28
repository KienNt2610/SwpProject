package controller;

import entity.Product;
import model.DAOProduct;
import entity.Cart;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

@WebServlet(name = "AddToCartServlet", urlPatterns = {"/CartServlet"})
public class AddToCartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        
        if (action == null) {
            // Nếu không có action, xử lý thêm vào giỏ hàng
            handleAddToCart(request, response);
        } else {
            switch (action) {
                case "update":
                    handleUpdateCart(request, response);
                    break;
                case "remove":
                    handleRemoveFromCart(request, response);
                    break;
                default:
                    handleAddToCart(request, response);
            }
        }
    }

    private void handleAddToCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Kiểm tra và lấy thông tin sản phẩm và số lượng từ request
            String productIdStr = request.getParameter("productId");
            String quantityStr = request.getParameter("quantity");

            if (productIdStr == null || quantityStr == null) {
                request.setAttribute("error", "Thông tin sản phẩm không hợp lệ");
                request.getRequestDispatcher("/Cart.jsp").forward(request, response);
                return;
            }

            int productId = Integer.parseInt(productIdStr);
            int quantity = Integer.parseInt(quantityStr);

            // Lấy giỏ hàng từ session
            HttpSession session = request.getSession();
            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");

            // Nếu giỏ hàng chưa có, tạo giỏ hàng mới
            if (cartList == null) {
                cartList = new ArrayList<>();
            }

            // Lấy sản phẩm từ cơ sở dữ liệu qua DAOProduct
            Product product = getProductById(productId);

            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            boolean productExists = false;
            for (Cart cartItem : cartList) {
                if (cartItem.getProductId() == productId) {
                    cartItem.setQuantity(cartItem.getQuantity() + quantity);  // Cập nhật số lượng nếu sản phẩm đã có
                    productExists = true;
                    break;
                }
            }

            // Nếu sản phẩm chưa có trong giỏ, thêm mới vào giỏ
            if (!productExists && product != null) {
                Cart newCartItem = new Cart(product.getProductId(), product.getProductName(),
                        product.getPrice(), quantity);
                cartList.add(newCartItem);
            }

            // Tính tổng giá trị giỏ hàng
            double totalCartValue = 0;
            for (Cart cartItem : cartList) {
                totalCartValue += cartItem.getTotalPrice();  // Cộng dồn giá trị của từng sản phẩm
            }

            // Lưu giỏ hàng và tổng giá trị vào session
            session.setAttribute("cart-list", cartList);
            session.setAttribute("totalCartValue", totalCartValue);  // Lưu tổng giá trị giỏ hàng
            request.setAttribute("message", "Thêm vào giỏ hàng thành công");

            // Chuyển hướng đến trang giỏ hàng
            request.getRequestDispatcher("/Cart.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Số lượng sản phẩm không hợp lệ");
            request.getRequestDispatcher("/Cart.jsp").forward(request, response);
        }
    }

    private void handleUpdateCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            String quantityStr = request.getParameter("quantity");

            if (idStr == null || quantityStr == null) {
                response.sendRedirect("Cart.jsp");
                return;
            }

            int productId = Integer.parseInt(idStr);
            int quantity = Integer.parseInt(quantityStr);

            HttpSession session = request.getSession();
            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");

            if (cartList != null) {
                for (Cart cartItem : cartList) {
                    if (cartItem.getProductId() == productId) {
                        if (quantity > 0) {
                            cartItem.setQuantity(quantity);
                        } else {
                            cartList.remove(cartItem);
                        }
                        break;
                    }
                }

                // Cập nhật tổng giá trị giỏ hàng
                double totalCartValue = 0;
                for (Cart cartItem : cartList) {
                    totalCartValue += cartItem.getTotalPrice();
                }

                session.setAttribute("cart-list", cartList);
                session.setAttribute("totalCartValue", totalCartValue);
            }

            response.sendRedirect("Cart.jsp");
        } catch (NumberFormatException e) {
            response.sendRedirect("Cart.jsp");
        }
    }

    private void handleRemoveFromCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            if (idStr == null) {
                response.sendRedirect("Cart.jsp");
                return;
            }

            int productId = Integer.parseInt(idStr);
            HttpSession session = request.getSession();
            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");

            if (cartList != null) {
                cartList.removeIf(cartItem -> cartItem.getProductId() == productId);

                // Cập nhật tổng giá trị giỏ hàng
                double totalCartValue = 0;
                for (Cart cartItem : cartList) {
                    totalCartValue += cartItem.getTotalPrice();
                }

                session.setAttribute("cart-list", cartList);
                session.setAttribute("totalCartValue", totalCartValue);
            }

            response.sendRedirect("Cart.jsp");
        } catch (NumberFormatException e) {
            response.sendRedirect("Cart.jsp");
        }
    }

    // Sử dụng DAOProduct để lấy sản phẩm từ cơ sở dữ liệu
    private Product getProductById(int productId) {
        DAOProduct daoProduct = new DAOProduct();
        String sql = "SELECT * FROM Product WHERE ProductId = " + productId;
        Vector<Product> products = daoProduct.getProduct(sql);  // Lấy danh sách sản phẩm
        if (products.size() > 0) {
            return products.get(0);  // Giả sử ID là duy nhất, lấy sản phẩm đầu tiên
        }
        return null;  // Nếu không tìm thấy sản phẩm
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
        return "Servlet to handle Add to Cart functionality";
    }
}
