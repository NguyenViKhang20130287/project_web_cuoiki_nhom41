package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.CategoryAdmin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class EditProductDAO {

    public int getIdCategory(String nameGem, String nameCat) {
        int id = 0;
        String query = "SELECT * FROM category WHERE parent_id IN (SELECT id FROM category WHERE category.`name` = ?) " +
                "AND id IN (SELECT id FROM category WHERE category.`name` = ?)";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setString(1, nameCat);
                ps.setString(2, nameGem);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    id = rs.getInt(1);
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
        }
        return id;
    }

    public int getIdColor(String color) {
        int id = 0;
        String query = "SELECT * FROM gem_color";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    if (rs.getString(2).equalsIgnoreCase(color)) {
                        id = rs.getInt(1);
                    }
                }
            }

        } catch (Exception e) {
        }
        return id;
    }

    public void update(int id, String name, String nameGem, String catName, int quantity, String color, int price) {
        String query_color = "UPDATE product_gem_color\n" +
                "SET product_gem_color.gem_color_id = ?\n" +
                "WHERE product_gem_color.product_id = ?";

        String query_product = "UPDATE product \n" +
                "SET product.title = ?,\n" +
                "product.category_id = ?,\n" +
                "product.quantity = ?,\n" +
                "product.discount = ? \n" +
                "WHERE product.id = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement ps_color = new DBConnect().getConnection().prepareStatement(query_color);
                PreparedStatement ps_product = new DBConnect().getConnection().prepareStatement(query_product);

                ps_color.setInt(1, getIdColor(color));
                ps_color.setInt(2, id);

                ps_product.setString(1, name);
                ps_product.setInt(2, getIdCategory(nameGem, catName));
                ps_product.setInt(3, quantity);
                ps_product.setInt(4, price);
                ps_product.setInt(5, id);

                ps_color.executeUpdate();
                ps_product.executeUpdate();

                System.out.println("Update successfully");
                ps_color.close();
                ps_product.close();
            }
        } catch (Exception e) {

        }

    }

    public static void main(String[] args) throws SQLException {
//        System.out.println(new EditProductDAO().checkNameGemWithID(1));
//        ;
//        System.out.println(new EditProductDAO().checkColorWithID(1));
//        ;

        System.out.println(new EditProductDAO().getIdCategory("Ngọc trai", "Nhẫn"));
        new EditProductDAO().update(69, "sanphamupdate#69", "Kim cương",
                "Dây chuyền", 10, "Đen", 20000000);
    }

}
