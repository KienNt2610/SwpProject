package controller;

import entity.ProductDetail;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOProductDetail;

@WebServlet(name = "ProductDetailController", urlPatterns = {"/ProductDetailURL"})
public class ProductDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOProductDetail dao = new DAOProductDetail();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllProductDetail";
            }

            if (service.equals("deleteProductDetail")) {
                dao.deleteProductDetail(Integer.parseInt(request.getParameter("detailId")));
                response.sendRedirect("ProductDetailURL?service=listAllProductDetail");
            }

            if (service.equals("updateProductDetail")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int detailId = Integer.parseInt(request.getParameter("detailId"));
                    Vector<ProductDetail> vector = dao.getProductDetail("select * from ProductDetail where DetailId=" + detailId);
                    request.setAttribute("vector", vector);
                    request.getRequestDispatcher("/update-jsp/updateProductDetail.jsp").forward(request, response);
                } else {
                    int DetailId = Integer.parseInt(request.getParameter("DetailId"));
                    int ProductId = Integer.parseInt(request.getParameter("ProductId"));
                    String Color = request.getParameter("Color");
                    String Size = request.getParameter("Size");

                    if (ProductId == 0) {
                        out.print("ProductId can't be 0");
                        return;
                    }

                    ProductDetail productDetail = new ProductDetail(DetailId, ProductId, Color, Size);
                    int n = dao.updateProductDetail(productDetail);
                    response.sendRedirect("ProductDetailURL?service=listAllProductDetail");
                }
            }

            if (service.equals("insertProductDetail")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/insert-jsp/insertProductDetail.jsp").forward(request, response);
                } else {
                    int ProductId = Integer.parseInt(request.getParameter("ProductId"));
                    String Color = request.getParameter("Color");
                    String Size = request.getParameter("Size");

                    if (ProductId == 0) {
                        out.print("ProductId can't be 0");
                        return;
                    }

                    ProductDetail productDetail = new ProductDetail(ProductId, Color, Size);
                    int n = dao.addProductDetail(productDetail);
                    response.sendRedirect("ProductDetailURL?service=listAllProductDetail");
                }
            }

            if (service.equals("listAllProductDetail")) {
                String sql = "select * from ProductDetail";
                String submit = request.getParameter("submit");
                String detailId = request.getParameter("detailId");

                if (submit == null) {
                    sql = "select * from ProductDetail";
                } else {
                    // Sử dụng DetailId thay vì ProductId để tìm kiếm
                    if (detailId != null) {
                        sql = "select * from ProductDetail where DetailId = " + detailId;
                    }
                }

                Vector<ProductDetail> vector = dao.getProductDetail(sql);
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/displayProductDetail.jsp");
                request.setAttribute("data", vector);
                request.setAttribute("title", "ProductDetail Manager");
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
