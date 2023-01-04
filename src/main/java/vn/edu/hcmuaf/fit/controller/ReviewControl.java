package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.LoginDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.dao.ReviewDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.Review;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ReviewControl", value = "/review")
public class ReviewControl extends HttpServlet {
    ReviewDAO reviewDAO = new ReviewDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String username = session.getAttribute("username").toString();
        int id = Integer.parseInt(request.getParameter("id"));
        Double rating = Double.valueOf(request.getParameter("hdrating"));
        String comment = request.getParameter("comment");
        Review review = new Review();
        ProductDAO productDAO = new ProductDAO();
        LoginDAO loginDAO = new LoginDAO();
        review.setProduct(productDAO.getProduct(id));
        review.setAccount(loginDAO.getAccount(username));
        review.setMessage(comment);
        review.setRating(rating);
        review.setDatePost(new Date());
        reviewDAO.insertReview(review);
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Đánh giá đã được gửi thành công!');");
        out.println("location='product-detail?product_id=" + id + "';");
        out.println("</script>");
    }
}
