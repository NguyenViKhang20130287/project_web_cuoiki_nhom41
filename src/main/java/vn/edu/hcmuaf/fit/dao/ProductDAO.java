package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ProductDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    CategoryDAO categoryDAO = new CategoryDAO();

    /* Phương thức thực hiện truy vấn lấy danh sách sản phẩm */
    private List<Product> getListProductQuery(String query) {
        List<Product> list = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                rs = statement.executeQuery(query);
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt(1));
                    product.setCategory(categoryDAO.getCategory(2));
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

    /* Phương thức lấy ra danh sách tất cả các sản phẩm từ cơ sở dữ liệu */
    public List<Product> getAllProducts() {
        String query = "SELECT* FROM product WHERE is_on_sale = TRUE";
        return getListProductQuery(query);
    }

    /* Phương thức lấy ra danh sách tất cả các sản phẩm theo category_id của danh mục */
    public List<Product> getAllProductsFromACategory(int category_id) {
        String query = "SELECT p.* FROM category c INNER JOIN product p on c.id = p.category_id WHERE (c.parent_id = " + category_id + " OR p.category_id = " + category_id + ") AND p.is_on_sale = TRUE ";
        return getListProductQuery(query);
    }

    // Phương thức tìm kiếm tất cả các sản phẩm có liên quan đến từ khóa đã nhập vào
    public List<Product> searchProducts(String keyword) {
        String query = "SELECT * FROM product WHERE title LIKE '%" + keyword + "%' AND is_on_sale = TRUE";
        return getListProductQuery(query);
    }

    public List<Product> getRelatedProduct(String categoryName, int product_id) {
        String query = "SELECT * FROM product p INNER JOIN category c ON p.category_id = c.id WHERE p.title LIKE '%" + categoryName + "%' AND p.id != " + product_id + " AND is_on_sale = TRUE";
        return getListProductQuery(query);
    }

    /* Phương thức lấy ra danh sách các sản phẩm nổi bật */
    public List<Product> getFeaturedProduct() {
        String query = "SELECT * FROM product WHERE is_on_sale = TRUE ORDER BY RAND() LIMIT 3";
        return getListProductQuery(query);
    }

    /* Phương thức lấy ra danh sách các sản phẩm liên quan */
    public List<Product> getLatestProduct() {
        String query = "SELECT * FROM product WHERE is_on_sale = TRUE ORDER BY id DESC LIMIT 15";
        return getListProductQuery(query);
    }

    /* Phương thức lấy ra sản phẩm theo id */
    public Product getProduct(int id) {
        Product product = new Product();
        String query = "SELECT * FROM product WHERE id = " + id + " AND is_on_sale = TRUE";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                rs = statement.executeQuery(query);
                while (rs.next()) {
                    product.setId(rs.getInt(1));
                    product.setCategory(categoryDAO.getCategory(rs.getInt(2)));
                    product.setTitle(rs.getString(3));
                    product.setKeyword(rs.getString(4));
                    product.setPrice(rs.getInt(5));
                    product.setDiscount(rs.getInt(6));
                    product.setDesign(rs.getString(7));
                    product.setThumbnail(rs.getString(8));
                    product.setDescription(rs.getString(9));
                    product.setQuantity(rs.getInt(10));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return product;
    }

    /* Phương thức lấy ra tổng số lượng tất cả các sản phẩm trong cơ sở dữ liệu */
    public int getTotalProducts() {
        String query = "SELECT COUNT(*) FROM product";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                rs = statement.executeQuery(query);
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return 0;
    }

    /* Phương thức phân chia số lượng sản phẩm trên một trang */
    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM PRODUCT ORDER BY ID LIMIT ?,12";
        try {
            conn = DBConnect.getInstall().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 12);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setCategory(categoryDAO.getCategory(2));
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
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return list;
    }

    /* Phương thức lấy ra số lượng tổng các sản phẩm của một danh mục */
    public int getTotalProductOfACategory(int category_id) {
        String query = "SELECT COUNT(*) FROM category c INNER JOIN product p on c.id = p.category_id WHERE (c.parent_id = ? OR p.category_id = ?) AND p.is_on_sale = TRUE ";
        try {
            conn = DBConnect.getInstall().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, category_id);
            ps.setInt(2, category_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return 0;
    }

    public List<Product> pagingProductOfCategory(int category_id, int index) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.* FROM category c INNER JOIN product p on c.id = p.category_id \n" +
                "WHERE (c.id = ? OR c.parent_id = ?) AND p.is_on_sale = TRUE ORDER BY c.id LIMIT ?,12";
        try {
            conn = DBConnect.getInstall().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, category_id);
            ps.setInt(2, category_id);
            ps.setInt(3, (index - 1) * 12);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setCategory(categoryDAO.getCategory(2));
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
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return list;
    }

    public List<Product> pagingProductByGemColor(int color_id, int index) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.* FROM product p INNER JOIN product_gem_color pg ON p.id = pg.product_id \n" +
                "INNER JOIN gem_color g ON pg.gem_color_id = g.id WHERE g.id = ? AND p.is_on_sale = TRUE ORDER BY p.id LIMIT ?, 12";
        try {
            conn = DBConnect.getInstall().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, color_id);
            ps.setInt(2, (index - 1) * 12);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setCategory(categoryDAO.getCategory(2));
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
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return list;
    }

    public List<Product> loadProductByGemColor(int color_id) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.* FROM product p INNER JOIN product_gem_color pg ON p.id = pg.product_id \n" +
                "INNER JOIN gem_color g ON pg.gem_color_id = g.id WHERE g.id = ? AND p.is_on_sale = TRUE";
        try {
            conn = DBConnect.getInstall().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, color_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setCategory(categoryDAO.getCategory(2));
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
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return list;
    }

    public int getTotalProductByGemColor(int color_id) {
        String query = "SELECT COUNT(*) FROM product p INNER JOIN product_gem_color pg ON p.id = pg.product_id \n" +
                "INNER JOIN gem_color g ON pg.gem_color_id = g.id WHERE g.id = ? AND p.is_on_sale = TRUE";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                conn = DBConnect.getInstall().getConnection();
                ps = conn.prepareStatement(query);
                ps.setInt(1, color_id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return 0;
    }

    public List<Product> getTop5Product() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product ORDER BY id DESC LIMIT 5";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                rs = statement.executeQuery(query);
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt(1));
                    product.setCategory(categoryDAO.getCategory(2));
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
            throw new RuntimeException();
        }
        return list;
    }

    public List<Product> getNextTop5Product(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product ORDER BY id DESC LIMIT 5 OFFSET ?";
        try {
            conn = DBConnect.getInstall().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setCategory(categoryDAO.getCategory(2));
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
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return list;
    }


    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
    }
}

