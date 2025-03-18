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
                    double SalePrice = Double.parseDouble(request.getParameter("SalePrice"));
                    int SoldQuantity = Integer.parseInt(request.getParameter("SoldQuantity"));
                    String CreateTimeStr = request.getParameter("CreateTime");
                    java.sql.Timestamp CreateTime = null;
                    if (CreateTimeStr != null && !CreateTimeStr.isEmpty()) {
                        CreateTime = java.sql.Timestamp.valueOf(CreateTimeStr);
                    }

                    if (ProductName.equals("")) {
                        out.print("Product name is not empty");
                        return;
                    }

                    boolean discontinued = (Integer.parseInt(Discontinued) == 1);
                    Product product = new Product(ProductId, ProductName, CategoryId, Price, Quantity, Description, discontinued, false, SoldQuantity, CreateTime, SalePrice);
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
                    double SalePrice = Double.parseDouble(request.getParameter("SalePrice"));
                    int SoldQuantity = Integer.parseInt(request.getParameter("SoldQuantity"));
                    String CreateTimeStr = request.getParameter("CreateTime");
                    java.sql.Timestamp CreateTime = null;
                    if (CreateTimeStr != null && !CreateTimeStr.isEmpty()) {
                        CreateTime = java.sql.Timestamp.valueOf(CreateTimeStr);
                    }

                    if (ProductName.equals("")) {
                        out.print("Product name is not empty");
                        return;
                    }

                    boolean discontinued = (Integer.parseInt(Discontinued) == 1);
                    Product product = new Product(ProductName, CategoryId, Price, Quantity, Description, discontinued, false, SoldQuantity, CreateTime, SalePrice);
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

            // Guest product list
            if (service.equalsIgnoreCase("guestProduct")) {
                String sortBy = request.getParameter("sortBy");
                String categoryId = request.getParameter("categoryId");
                String isHot = request.getParameter("isHot");  // Lấy giá trị isHot từ request

                // Bắt đầu câu lệnh SQL để lấy tất cả các sản phẩm
                String sql = "SELECT * FROM Product WHERE 1=1";

                // Kiểm tra nếu tham số lọc "isHot" được đặt, thì chỉ lấy sản phẩm hot
                if ("1".equals(isHot)) {  // Kiểm tra nếu người dùng đã chọn lọc sản phẩm Hot
                    sql += " AND IsHot = 1"; // Lọc theo sản phẩm hot
                }

                // Lọc theo categoryId nếu có
                if (categoryId != null && !categoryId.trim().isEmpty()) {
                    sql += " AND CategoryId = " + Integer.parseInt(categoryId); // Lọc theo categoryId
                }

                // Logic sắp xếp
                if ("priceAsc".equalsIgnoreCase(sortBy)) {
                    sql += " ORDER BY Price ASC";
                } else if ("priceDesc".equalsIgnoreCase(sortBy)) {
                    sql += " ORDER BY Price DESC";
                } else if ("nameAsc".equalsIgnoreCase(sortBy)) {
                    sql += " ORDER BY ProductName ASC";
                } else if ("nameDesc".equalsIgnoreCase(sortBy)) {
                    sql += " ORDER BY ProductName DESC";
                }

                // Thực hiện câu lệnh SQL
                Vector<Product> productList = dao.getProduct(sql);
                Vector<Category> categoryList = dao.getCategories(); // Lấy danh mục cho việc lọc

                // Truyền dữ liệu vào request
                request.setAttribute("data", productList);
                request.setAttribute("categoryList", categoryList);
                request.setAttribute("selectedCategory", categoryId);
                request.setAttribute("isHot", isHot);  // Truyền giá trị lọc isHot vào JSP

                // Chuyển đến trang JSP
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
