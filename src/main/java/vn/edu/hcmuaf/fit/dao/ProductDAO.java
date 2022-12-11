package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Phương thức thực hiện truy vấn lấy danh sách sản phẩm
    private List<Product> getListProductQuery(String query) {
        List<Product> list = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                conn = new DBConnect().get().getConnection();
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt(1));
                    product.setCategory_id((rs.getInt(2)));
                    product.setTitle(rs.getString(3));
                    product.setKeyword(rs.getString(4));
                    product.setPrice(rs.getInt(5));
                    product.setDiscount(rs.getInt(6));
                    product.setDesign(rs.getString(7));
                    product.setThumbnail(rs.getString(8));
                    product.setDescription(rs.getString(9));
                    product.setQuantity(rs.getInt(10));
                    list.add(product);
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    // Phương thức lấy tất cả các sản phẩm từ cơ sở dữ liệu
    public List<Product> getAllProducts() {
        String query = "SELECT* FROM product WHERE is_on_sale = TRUE";
        return getListProductQuery(query);
    }

    // Phương thức lấy tất cả các sản phẩm theo category_id của danh mục
    public List<Product> getAllProductsFromACategory(int category_id) {
        String query = "SELECT * FROM category c INNER JOIN product p on c.id = p.category_id WHERE (c.parent_id = " + category_id + " OR p.category_id = " + category_id + ") AND p.is_on_sale = TRUE ";
        List<Product> list = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                conn = new DBConnect().get().getConnection();
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt(1));
                    product.setTitle(rs.getString(6));
                    product.setPrice(rs.getInt(8));
                    product.setDiscount(rs.getInt(9));
                    product.setThumbnail(rs.getString(11));
                    product.setDescription(rs.getString(12));
                    list.add(product);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    // Phương thức tìm kiếm tất cả các sản phẩm có liên quan đến từ khóa đã nhập vào
    public List<Product> searchProducts(String keyword) {
        String query = "SELECT * FROM product WHERE title LIKE '%" + keyword + "%' AND is_on_sale = TRUE";
        return getListProductQuery(query);
    }

//    public List<Product> sortProductsFromAToZ() {
//        String query = "";
//        return getListProductQuery(query);
//    }

    public List<Product> getFeaturedProduct() {
        String query = "SELECT * FROM product WHERE is_on_sale = TRUE ORDER BY RAND() LIMIT 3";
        return getListProductQuery(query);
    }

    //    public List<Product> filteredByPrice(int min, int max) {
//        String query = "SELECT * FROM product WHERE discount BETWEEN" + min + " AND" + max + " ORDER BY discount ASC";
//    }
    public List<Product> getLatestProduct() {
        String query = "SELECT * FROM product WHERE is_on_sale = TRUE ORDER BY id DESC LIMIT 15";
        return getListProductQuery(query);
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProductsFromACategory(2);
        for (Product p : list) {
            System.out.println(p);
        }
    }
}
