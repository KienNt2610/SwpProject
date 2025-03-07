package controller;

import entity.Category;
import entity.Product;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOProduct;

@WebServlet(name = "ProductController", urlPatterns = {"/ProductURL"})
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOProduct dao = new DAOProduct();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllProduct";
            }

            if (service.equalsIgnoreCase("Filter")) {
                String sortBy = request.getParameter("sortBy");
                String categoryId = request.getParameter("categoryId");

                // Khởi tạo câu lệnh SQL với điều kiện cơ bản
                String sql = "SELECT * FROM Product WHERE 1=1";

                // Thêm điều kiện lọc theo categoryId
                if (categoryId != null && !categoryId.trim().isEmpty()) {
                    sql += " AND CategoryId = '" + categoryId + "'"; // Lọc theo CategoryId
                }

                Vector<Product> vector = dao.getProduct(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/staff/jsp/displayProduct.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Filtered Product List");
                dispath.forward(request, response);
            }
            if (service.equalsIgnoreCase("sort")) {
                String sortBy = request.getParameter("sortBy");
                String categoryId = request.getParameter("categoryId");  // Giữ lại categoryId khi sort

                String sql = "SELECT * FROM Product WHERE 1=1"; // Điều kiện mặc định

                if (categoryId != null && !categoryId.trim().isEmpty()) {
                    sql += " AND CategoryId = " + Integer.parseInt(categoryId); // Giữ filter theo categoryId
                }

                if ("priceAsc".equalsIgnoreCase(sortBy)) {
                    sql += " ORDER BY Price ASC";
                } else if ("priceDesc".equalsIgnoreCase(sortBy)) {
                    sql += " ORDER BY Price DESC";
                } else if ("nameAsc".equalsIgnoreCase(sortBy)) {
                    sql += " ORDER BY ProductName ASC";
                } else if ("nameDesc".equalsIgnoreCase(sortBy)) {
                    sql += " ORDER BY ProductName DESC";
                }

                // Debug kiểm tra SQL
                System.out.println("Executing SQL: " + sql);

                Vector<Product> vector = dao.getProduct(sql);
                request.setAttribute("data", vector);
                request.setAttribute("title", "Sorted Product List");
                request.setAttribute("selectedCategory", categoryId); // Để giữ category đã chọn khi hiển thị
                RequestDispatcher dispath = request.getRequestDispatcher("/staff/jsp/displayProduct.jsp");
                dispath.forward(request, response);
            }

            if (service.equals("deleteProduct")) {
                dao.deleteProduct(Integer.parseInt(request.getParameter("pid")));
                response.sendRedirect("ProductURL?service=listAllProduct");
            }

            if (service.equals("updateProduct")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int pid = Integer.parseInt(request.getParameter("pid"));
                    Vector<Product> vector = dao.getProduct("SELECT * FROM Product WHERE ProductId=" + pid);
                    request.setAttribute("vector", vector);
                    request.getRequestDispatcher("/staff/update-jsp/updateProduct.jsp").forward(request, response);
                } else {
                    int ProductId = Integer.parseInt(request.getParameter("ProductId"));
                    String ProductName = request.getParameter("ProductName");
                    int CategoryId = Integer.parseInt(request.getParameter("CategoryId"));
                    double Price = Double.parseDouble(request.getParameter("Price"));
                    int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                    String Description = request.getParameter("Description");
                    String Discontinued = request.getParameter("Discontinued");
                    // check data
                    if (ProductName.equals("")) {
                        out.print("Product name is not empty");
                        return;
                    }
                    boolean discontinued = (Integer.parseInt(Discontinued) == 1 ? true : false);
                    Product product = new Product(ProductId, ProductName, CategoryId, Price, Quantity, Description, discontinued);
                    int n = dao.updateProduct(product);
                    response.sendRedirect("ProductURL?service=listAllProduct");
                }
            }

            if (service.equals("insertProduct")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/staff/insert-jsp/insertProduct.jsp").forward(request, response);
                } else {
                    String ProductName = request.getParameter("ProductName");
                    int CategoryId = Integer.parseInt(request.getParameter("CategoryId"));
                    double Price = Double.parseDouble(request.getParameter("Price"));
                    int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                    String Description = request.getParameter("Description");
                    String Discontinued = request.getParameter("Discontinued");
                    // check data
                    if (ProductName.equals("")) {
                        out.print("Product name is not empty");
                        return;
                    }
                    boolean discontinued = (Integer.parseInt(Discontinued) == 1 ? true : false);
                    Product product = new Product(ProductName, CategoryId, Price, Quantity, Description, discontinued);
                    int n = dao.addProduct(product);
                    response.sendRedirect("ProductURL?service=listAllProduct");
                }
            }

            if (service.equals("listAllProduct")) {
                String sql = "select * from Product";
                String submit = request.getParameter("submit");
                String pname = request.getParameter("pname");
                String categoryId = request.getParameter("categoryId");

                if (submit == null) {
                    sql = "select * from Product";
                } else {
                    sql = "select * from Product where ProductName like '%" + pname + "%'";
                }
                if (categoryId != null) {
                    sql = "select * from Product where CategoryId like '" + categoryId + "'";
                }

                Vector<Product> vector = dao.getProduct(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/staff/jsp/displayProduct.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Product manager");
                dispath.forward(request, response);
            }

            if (service.equalsIgnoreCase("guestProduct")) {
                String sortBy = request.getParameter("sortBy");
                String categoryId = request.getParameter("categoryId");

                String sql = "SELECT * FROM Product WHERE 1=1";

                if (categoryId != null && !categoryId.trim().isEmpty()) {
                    sql += " AND CategoryId = " + Integer.parseInt(categoryId); // Lọc theo categoryId
                }

                if ("priceAsc".equalsIgnoreCase(sortBy)) {
                    sql += " ORDER BY Price ASC";
                } else if ("priceDesc".equalsIgnoreCase(sortBy)) {
                    sql += " ORDER BY Price DESC";
                } else if ("nameAsc".equalsIgnoreCase(sortBy)) {
                    sql += " ORDER BY ProductName ASC";
                } else if ("nameDesc".equalsIgnoreCase(sortBy)) {
                    sql += " ORDER BY ProductName DESC";
                }

                System.out.println("Executing SQL: " + sql); // Kiểm tra SQL

                Vector<Product> productList = dao.getProduct(sql);
                Vector<Category> categoryList = dao.getCategories(); // Lấy danh mục

                request.setAttribute("data", productList);
                request.setAttribute("categoryList", categoryList); // Gửi danh mục đến JSP
                request.setAttribute("selectedCategory", categoryId);
                RequestDispatcher dispath = request.getRequestDispatcher("/guest/display/guestProduct.jsp");
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
