package controller;

import entity.Category;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOCategory;

@WebServlet(name = "CategoryController", urlPatterns = {"/CategoryURL"})
public class CategoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOCategory dao = new DAOCategory();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllCategory";
            }

            if (service.equals("Filter")) {
                // Lấy các tham số lọc từ yêu cầu
                String sortBy = request.getParameter("sortBy");
                String categoryId = request.getParameter("categoryId");
                String categoryName = request.getParameter("categoryName");

                // Khởi tạo câu lệnh SQL với điều kiện cơ bản
                String sql = "SELECT * FROM [Category] WHERE 1=1";

                // Thêm điều kiện lọc theo CategoryId
                if (categoryId != null && !categoryId.trim().isEmpty()) {
                    sql += " AND CategoryId = '" + categoryId + "'"; // Lọc theo CategoryId
                }

                // Thêm điều kiện lọc theo CategoryName
                if (categoryName != null && !categoryName.trim().isEmpty()) {
                    sql += " AND CategoryName LIKE '%" + categoryName + "%'"; // Lọc theo CategoryName
                }

                // Thêm điều kiện sắp xếp theo CategoryName
                if ("categoryNameAsc".equals(sortBy)) {
                    sql += " ORDER BY CategoryName ASC"; // Sắp xếp tăng dần theo CategoryName
                } else if ("categoryNameDesc".equals(sortBy)) {
                    sql += " ORDER BY CategoryName DESC"; // Sắp xếp giảm dần theo CategoryName
                }

                // Thực hiện truy vấn và lấy kết quả
                Vector<Category> vector = dao.getCategory(sql);

                // Chuyển dữ liệu đến trang hiển thị
                RequestDispatcher dispath = request.getRequestDispatcher("/staff/jsp/displayCategory.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Filtered Category List");
                dispath.forward(request, response);
            }

            if (service.equals("deleteCategory")) {
                dao.deleteCategory(Integer.parseInt(request.getParameter("cid")));
                response.sendRedirect("CategoryURL?service=listAllCategory");
            }

            if (service.equals("updateCategory")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int cid = Integer.parseInt(request.getParameter("cid"));
                    Vector<Category> vector = dao.getCategory("select * from [Category] where CategoryId=" + cid);
                    request.setAttribute("vector", vector);
                    request.getRequestDispatcher("/staff/update-jsp/updateCategory.jsp").forward(request, response);
                } else {
                    int CategoryId = Integer.parseInt(request.getParameter("CategoryId"));
                    String CategoryName = request.getParameter("CategoryName");
                    // check data
                    if (CategoryName.equals("")) {
                        out.print("CategoryName is not empty");
                        return;
                    }
                    Category category = new Category(CategoryId, CategoryName);
                    int n = dao.updateCategory(category);
                    response.sendRedirect("CategoryURL?service=listAllCategory");
                }
            }

            if (service.equals("insertCategory")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/staff/insert-jsp/insertCategory.jsp").forward(request, response);
                } else {
                    String CategoryName = request.getParameter("CategoryName");
                    // check data
                    if (CategoryName.equals("")) {
                        out.print("CategoryName is not empty");
                        return;
                    }
                    Category category = new Category(CategoryName);
                    int n = dao.addCategory(category);
                    response.sendRedirect("CategoryURL?service=listAllCategory");
                }
            }

            if (service.equals("listAllCategory")) {
                String sql = "select * from [Category]";
                String submit = request.getParameter("submit");
                String categoryName = request.getParameter("categoryName");
                String categoryId = request.getParameter("categoryId");

                if (submit == null) {
                    sql = "select * from [Category]";
                } else {
                    sql = "select * from [Category] where CategoryId like '%" + categoryId + "%'";
                }
                if (categoryName != null) {
                    sql = "select * from [Category] where CategoryName like '%" + categoryName + "%'";
                }

                Vector<Category> vector = dao.getCategory(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/staff/jsp/displayCategory.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Category manager");
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