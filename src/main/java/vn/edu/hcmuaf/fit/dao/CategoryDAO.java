package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Category;
import vn.edu.hcmuaf.fit.entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;


    /* Nguyễn Nhất Đăng Khoa
     * Phương thức lấy ra danh sách các danh mục cha */
    public List<Category> getMainCategory() {
        List<Category> list = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                rs = statement.executeQuery("SELECT* FROM category WHERE parent_id IS NULL");
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

    /* Nguyễn Nhất Đăng Khoa
     * Phương thức lấy ra các danh mục con theo id của từng danh mục cha cha */
    public List<Category> getSubCategory(int pid) {
        List<Category> list = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT* FROM category WHERE parent_id = ?";
                conn = new DBConnect().get().getConnection();
                ps = conn.prepareStatement(query);
                ps.setInt(1, pid);
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

    /* Phương thức lấy ra danh mục sản phẩm theo id */
    public Category getCategory(int category_id) {
        Category category = new Category();
        String query = "SELECT * FROM category WHERE id = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ps = DBConnect.getInstall().getConnection().prepareStatement(query);
                ps.setInt(1, category_id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    category.setId(rs.getInt(1));
                    category.setParent_id(rs.getInt(2));
                    category.setName(rs.getString(3));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return category;
    }

    /* Phương thức lấy ra danh mục theo id danh mục con */
    public Category getCategoryBySubId(int subcategory_id) {
        Category category = new Category();
        String query = "SELECT * from category c1 INNER JOIN category c2 on c1.id = c2.parent_id WHERE c2.id = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ps = DBConnect.getInstall().getConnection().prepareStatement(query);
                ps.setInt(1, subcategory_id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    category.setId(rs.getInt(1));
                    category.setParent_id(rs.getInt(2));
                    category.setName(rs.getString(3));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return category;
    }

    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProduct(6);
        Category category = dao.getCategoryBySubId(30);
        System.out.println(product.getCategory().getId());
        System.out.println(category.getId());
    }

}
