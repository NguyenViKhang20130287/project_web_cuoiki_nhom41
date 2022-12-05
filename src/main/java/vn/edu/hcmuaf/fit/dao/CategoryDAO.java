package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;


    /*Nguyễn Nhất Đăng Khoa
    * Phương thức lấy ra các danh mục cha*/
    public List<Category> getMainCategory() {
        List<Category> list = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ResultSet rs = statement.executeQuery("SELECT* FROM category WHERE parent_id IS NULL");
                while (rs.next()) {
                    Category category = new Category();
                    category.setId(rs.getInt(1));
                    category.setParent_id(rs.getInt(2));
                    category.setName(rs.getString(3));
                    list.add(category);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /*Nguyễn Nhất Đăng Khoa
     * Phương thức lấy ra các danh mục con theo id của từng danh mục cha cha*/
    public List<Category> getSubCategory(int pid) {
        List<Category> list = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                conn = new DBConnect().get().getConnection();
                String query = "SELECT* FROM category WHERE parent_id = ?";
                ps = conn.prepareStatement(query);
                ps.setInt(1,pid);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Category category = new Category();
                    category.setId(rs.getInt(1));
                    category.setParent_id(rs.getInt(2));
                    category.setName(rs.getString(3));
                    list.add(category);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static void main(String[] args) {
//        CategoryDAO dao = new CategoryDAO();
//        List<Category> list = dao.getSubCategory(3);
//        for (Category c:list){
//            System.out.println(c);
//        }
    }

}
