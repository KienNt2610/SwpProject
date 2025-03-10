package controller;

import entity.Employees;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOEmployees;

@WebServlet(name = "EmployeesController", urlPatterns = {"/EmployeesURL"})
public class EmployeesController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOEmployees dao = new DAOEmployees();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllEmployees";
            }

            if (service.equals("Filter")) {
                // Lấy các tham số lọc từ yêu cầu
                String sortBy = request.getParameter("sortBy");
                String name = request.getParameter("name");
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");

                // Khởi tạo câu lệnh SQL với điều kiện cơ bản
                String sql = "SELECT * FROM Employees WHERE 1=1";

                // Thêm điều kiện lọc theo tên nhân viên
                if (name != null && !name.trim().isEmpty()) {
                    sql += " AND EmployeeName LIKE '%" + name + "%'"; // Lọc theo tên
                }

                // Thêm điều kiện lọc theo khoảng thời gian (startDate, endDate)
                if (startDate != null && !startDate.trim().isEmpty() && endDate != null && !endDate.trim().isEmpty()) {
                    sql += " AND EmpBirthDate BETWEEN '" + startDate + "' AND '" + endDate + "'"; // Lọc theo khoảng thời gian
                }

                // Thêm điều kiện sắp xếp theo RoleId
                if ("roleAsc".equals(sortBy)) {
                    sql += " ORDER BY RoleId ASC"; // Sắp xếp tăng dần theo RoleId
                } else if ("roleDesc".equals(sortBy)) {
                    sql += " ORDER BY RoleId DESC"; // Sắp xếp giảm dần theo RoleId
                }

                // Thực hiện truy vấn và lấy kết quả
                Vector<Employees> vector = dao.getEmployees(sql);

                // Chuyển dữ liệu đến trang hiển thị
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/displayEmployees.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Filtered Employee List");
                dispath.forward(request, response);
            }

            if (service.equals("deleteEmployee")) {
                dao.deleteEmployees(Integer.parseInt(request.getParameter("eid")));
                response.sendRedirect("EmployeeURL?service=listAllEmployees");
            }

            if (service.equals("updateEmployee")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int eid = Integer.parseInt(request.getParameter("eid"));
                    Vector<Employees> vector = dao.getEmployees("select * from Employees where EmployeeId=" + eid);
                    request.setAttribute("vector", vector);
                    request.getRequestDispatcher("/update-jsp/updateEmployee.jsp").forward(request, response);
                } else {
                    int EmployeeId = Integer.parseInt(request.getParameter("EmployeeId"));
                    String EmployeeName = request.getParameter("EmployeeName");
                    java.util.Date EmpBirthDate = java.sql.Date.valueOf(request.getParameter("EmpBirthDate"));
                    String PhoneNumber = request.getParameter("PhoneNumber");
                    String Email = request.getParameter("Email");
                    String EmpGender = request.getParameter("EmpGender");
                    int RoleId = Integer.parseInt(request.getParameter("RoleId"));
                    // check data
                    if (EmployeeName.equals("")) {
                        out.print("EmployeeName is not empty");
                        return;
                    }
                    Employees employee = new Employees(EmployeeId, EmployeeName, EmpBirthDate, PhoneNumber, Email, EmpGender, RoleId);
                    int n = dao.updateEmployees(employee);
                    response.sendRedirect("EmployeeURL?service=listAllEmployees");
                }
            }

            if (service.equals("insertEmployee")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/insert-jsp/insertEmployee.jsp").forward(request, response);
                } else {
                    String EmployeeName = request.getParameter("EmployeeName");
                    java.util.Date EmpBirthDate = java.sql.Date.valueOf(request.getParameter("EmpBirthDate"));
                    String PhoneNumber = request.getParameter("PhoneNumber");
                    String Email = request.getParameter("Email");
                    String EmpGender = request.getParameter("EmpGender");
                    int RoleId = Integer.parseInt(request.getParameter("RoleId"));
                    // check data
                    if (EmployeeName.equals("")) {
                        out.print("EmployeeName is not empty");
                        return;
                    }
                    Employees employee = new Employees(EmployeeName, EmpBirthDate, PhoneNumber, Email, EmpGender, RoleId);
                    int n = dao.addEmployees(employee);
                    response.sendRedirect("EmployeesURL?service=listAllEmployees");
                }
            }

            if (service.equals("listAllEmployees")) {
                String sql = "select * from Employees";
                String name = request.getParameter("name");

                if (name != null) {
                    sql = "select * from Employees where EmployeeName like '%" + name + "%'";
                }

                Vector<Employees> vector = dao.getEmployees(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/displayEmployees.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "Employee manager");
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
