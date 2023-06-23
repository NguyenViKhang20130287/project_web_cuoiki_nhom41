package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.Log;
import vn.edu.hcmuaf.fit.entity.ProductAdmin;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "EditProductAdminControl", value = "/admin/doc/EditProductAdminControl")
public class EditProductAdminControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("Account");
        String roleName = account.getRole() == 0 ? "Quản trị viên" : "Nhân viên kế toán";
        LogService logService = LogService.getInstance();

        try {
            int id = Integer.parseInt(request.getParameter("edit_product-id"));
            String name = request.getParameter("edit_product-name");
            String nameGem = request.getParameter("edit_product-nameGem");
            String catName = request.getParameter("edit_product-cat_name");
            int quantity = Integer.parseInt(request.getParameter("edit_product-quantity"));
            String color = request.getParameter("edit_product-color");
            int price = Integer.parseInt(request.getParameter("edit_product-price"));
            File image = new File(request.getParameter("ImageUpload"));

            new AdminDAO().update(id, name, nameGem, catName, quantity, color, price, image);
            logService.insertNewLog(new Log(Log.INFO, account.getId(), this.getClass().getName(), roleName + " mã: " + account.getId() + " đã cập nhật sản phẩm có mã: " + id, 0, logService.getIpClient(request), logService.getBrowserName(request)));

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cập nhật sản phẩm thành công');");
            out.println("location='ListProductAdminControl';");
            out.println("</script>");
        } catch (Exception e) {

        }

    }

    public static void main(String[] args) {
        List<ProductAdmin> listPro = new AdminDAO().getData();
        System.out.println(listPro);
    }
}
