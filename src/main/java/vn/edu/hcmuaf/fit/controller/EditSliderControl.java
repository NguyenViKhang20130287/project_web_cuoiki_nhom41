package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditSliderControl", value = "/admin/doc/EditSliderControl")
public class EditSliderControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            File image = new File(request.getParameter("ImageUpload"));

            new AdminDAO().editSlider(id, name, image);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cập nhật Slider thành công');");
            out.println("location='LoadListBannerControl';");
            out.println("</script>");
        } catch (Exception e) {

        }
    }
}
