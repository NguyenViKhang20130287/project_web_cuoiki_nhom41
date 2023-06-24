package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.Log;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.Locale;

@WebServlet(name = "AddProductControl", value = "/admin/doc/AddProductControl")
public class AddProductControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        Locale locale = new Locale("vi", "VN");
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);

        PrintWriter out = response.getWriter();

        try {

            String nameProduct = request.getParameter("nameProduct");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String category = request.getParameter("category");
            String color = request.getParameter("color");
            int price = Integer.parseInt(request.getParameter("price"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            String keyword = request.getParameter("keyword");
            String design = request.getParameter("design");
            File imgLink = new File(request.getParameter("ImageUpload"));
            String description = request.getParameter("mota");

            LogService logService = LogService.getInstance();
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("Account");
            String roleName = account.getRole() == 0 ? "Quản trị viên" : "Nhân viên bán hàng";
            int userID = account.getId();

            System.out.println(userID);


            new AdminDAO().addProduct(nameProduct,
                    quantity, category, color, price, discount,
                    keyword, design, imgLink, description, userID);
            logService.insertNewLog(new Log(Log.INFO, account.getId(), this.getClass().getName(), roleName + " mã: " + userID + " đã thêm một sản phẩm mới vào kho hàng", 0, logService.getIpClient(request), logService.getBrowserName(request)));

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Thêm sản phẩm thành công');");
            out.println("location='ListProductAdminControl';");
            out.println("</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
