package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Review;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ProductDAO productDAO = new ProductDAO();
    LoginDAO loginDAO = new LoginDAO();

    /* Phương thức thêm một đánh giá mới */
    public void insertReview(Review review) {
        String query = "INSERT INTO review (product_id, username, rating, message, comment_time) VALUES(?,?,?,?,?)";
        conn = DBConnect.getInstall().getConnection();
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, review.getProduct().getId());
            ps.setString(2, review.getAccount().getUsername());
            ps.setDouble(3, review.getRating());
            ps.setString(4, review.getMessage());
            ps.setDate(5, Date.valueOf(LocalDate.now()));
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    /* Phướng thức lấy ra danh sách các đánh giá của một sản phẩm */
    public List<Review> getReviewById(int product_id){
        List<Review> reviewList = new ArrayList<>();
        String query = "SELECT * FROM review WHERE product_id = ?";
        conn = DBConnect.getInstall().getConnection();
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1,product_id);
            rs = ps.executeQuery();
            while (rs.next()){
                Review review = new Review();
                review.setId(rs.getInt(1));
                review.setProduct(productDAO.getProduct(rs.getInt(2)));
                review.setAccount(loginDAO.getAccount(rs.getString(3)));
                review.setRating(rs.getDouble(4));
                review.setMessage(rs.getString(5));
                review.setDatePost(rs.getDate(6));
                reviewList.add(review);
            }
        }catch (SQLException e){
            throw new RuntimeException();
        }
        return reviewList;
    }

    /* Phương thức tính trung bình sao đánh giá */
    public double getAverage(int product_id){
        String query = "SELECT ROUND(AVG(rating),1) FROM review WHERE product_id = ?";
        conn = DBConnect.getInstall().getConnection();
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, product_id);
            rs = ps.executeQuery();
            while (rs.next()){
                return rs.getDouble(1);
            }
        }catch (SQLException e){
            throw new RuntimeException();
        }
        return 0;
    }

}
