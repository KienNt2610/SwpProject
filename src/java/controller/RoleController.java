/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Role;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAORole;

@WebServlet(name = "RoleController", urlPatterns = {"/RoleURL"})
public class RoleController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAORole dao = new DAORole();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllRole";
            }

            if (service.equals("Filter")) {
                // Lấy các tham số lọc từ yêu cầu
                String roleName = request.getParameter("roleName");

                // Khởi tạo câu lệnh SQL với điều kiện cơ bản
                String sql = "SELECT * FROM Role WHERE 1=1";

                // Thêm điều kiện lọc theo tên vai trò
                if (roleName != null && !roleName.trim().isEmpty()) {
                    sql += " AND RoleName LIKE '%" + roleName + "%'"; // Lọc theo tên vai trò
                }

                // Thực hiện truy vấn và lấy kết quả
                Vector<Role> vector = dao.getRole(sql);

                // Chuyển dữ liệu đến trang hiển thị
                RequestDispatcher dispath = request.getRequestDispatcher("/staff/jsp/displayRole.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Filtered Role List");
                dispath.forward(request, response);
            }

            if (service.equals("deleteRole")) {
                dao.deleteRole(Integer.parseInt(request.getParameter("rid")));
                response.sendRedirect("RoleURL?service=listAllRole");
            }

            if (service.equals("updateRole")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int rid = Integer.parseInt(request.getParameter("rid"));
                    Vector<Role> vector = dao.getRole("select * from Role where RoleId=" + rid);
                    request.setAttribute("vector", vector);
                    request.getRequestDispatcher("/staff/update-jsp/updateRole.jsp").forward(request, response);
                } else {
                    int RoleId = Integer.parseInt(request.getParameter("RoleId"));
                    String RoleName = request.getParameter("RoleName");
                    // check data
                    if (RoleName.equals("")) {
                        out.print("RoleName is not empty");
                        return;
                    }
                    Role role = new Role(RoleId, RoleName);
                    int n = dao.updateRole(role);
                    response.sendRedirect("RoleURL?service=listAllRole");
                }
            }

            if (service.equals("insertRole")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/staff/insert-jsp/insertRole.jsp").forward(request, response);
                } else {
                    String RoleName = request.getParameter("RoleName");
                    // check data
                    if (RoleName.equals("")) {
                        out.print("RoleName is not empty");
                        return;
                    }
                    Role role = new Role(RoleName);
                    int n = dao.addRole(role);
                    response.sendRedirect("RoleURL?service=listAllRole");
                }
            }

            if (service.equals("listAllRole")) {
                String sql = "select * from Role";
                String roleName = request.getParameter("roleName");

                if (roleName != null) {
                    sql = "select * from Role where RoleName like '%" + roleName + "%'";
                }

                Vector<Role> vector = dao.getRole(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/staff/jsp/displayRole.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Role manager");
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
