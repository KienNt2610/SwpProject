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
            String color = request.getParameter("color");
            String size = request.getParameter("size");

            if (productIdStr == null || quantityStr == null || color == null || size == null) {
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

            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa (cùng màu và size)
            boolean productExists = false;
            for (Cart cartItem : cartList) {
                if (cartItem.getProductId() == productId && 
                    cartItem.getColor().equals(color) && 
                    cartItem.getSize().equals(size)) {
                    cartItem.setQuantity(cartItem.getQuantity() + quantity);  // Cập nhật số lượng nếu sản phẩm đã có
                    productExists = true;
                    break;
                }
            }

        
            if (!productExists && product != null) {
                Cart newCartItem = new Cart(product.getProductId(), product.getProductName(),
                        product.getPrice(), quantity, color, size);
                cartList.add(newCartItem);
            }

       
            double totalCartValue = 0;
            for (Cart cartItem : cartList) {
                totalCartValue += cartItem.getTotalPrice();  // Cộng dồn giá trị của từng sản phẩm
            }

           
            session.setAttribute("cart-list", cartList);
            session.setAttribute("totalCartValue", totalCartValue);  
            request.setAttribute("message", "Thêm vào giỏ hàng thành công");

         
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


    private Product getProductById(int productId) {
        DAOProduct daoProduct = new DAOProduct();
        String sql = "SELECT * FROM Product WHERE ProductId = " + productId;
        Vector<Product> products = daoProduct.getProduct(sql);  
        if (products.size() > 0) {
            return products.get(0);  
        }
        return null;  
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
