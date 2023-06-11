package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.entity.ProductAdmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "DeleteProductAdminControl", value = "/admin/doc/DeleteProductAdminControl")
public class DeleteProductAdminControl extends HttpServlet {

    public String checkStatus(int quantity){
        String status = "";
        if(quantity > 0){
            status = "success";
        }else{
            status = "danger";
        }
        return status;
    }

    public int showPrice(int price, int discount){
        int result = 0;
        if(discount == 0 ){
            result = price;
        }else{
            result = discount;
        }
        return result;
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("id"));

        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();




        try {
            new AdminDAO().DeleteUser(pid);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        List<ProductAdmin> list = new AdminDAO().getData();
        for (ProductAdmin pa : list) {
            out.println("<tbody>\n" +
                    "<tr>\n" +
                    "<td>"+pa.getId()+"</td>\n" +
                    "<td>"+pa.getName()+"</td>\n" +
                    "<td><img src=\""+pa.getImageLink()+"\" alt=\"\" width=\"100px\" height=\"50px\"></td>" +
                    "<td>"+pa.getQuantity()+"</td>" +
                    "<td>" +
                    "<span class=\"badge bg-"+checkStatus(pa.getQuantity())+"\">" +
                    pa.getStatus()+" </span></td>" +
                    //
//                    "<%if ("+pa.getDiscount()+" == 0) {%>\n" +
                    "<td>"+showPrice(pa.getPrice(), pa.getDiscount())+"</td>\n" +
//                    "<%} else {%>\n" +
//                    "<td>"+pa.getDiscount()+"</td>\n" +
//                    "<%}%>\n" +
                    //
                    "\n" +
                    "<td>"+pa.getCategory()+"\n" +
                    "</td>\n" +
                    "<td>\n" +
                    "<button class=\"btn btn-primary btn-sm trash\" title=\"Xóa\" type=\"button\"\n" +
                    "onclick=\"deleteProduct(id="+pa.getId()+")\">\n" +
                    "<i class=\"fas fa-trash-alt\"></i></button>\n" +
                    "<a class=\"btn btn-primary btn-sm edit\" title=\"Sửa\" id=\"show-emp\"\n" +
                    "href=\"DetailsProductAdminControl?edit_pid=<%=pa.getId()%>\"><i class=\"fas fa-edit\"></i></a>\n" +
                    "</td>\n" +
                    "</tr>\n" +
                    "</tbody>");
        }
    }
}
