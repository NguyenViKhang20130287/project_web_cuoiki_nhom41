package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.*;

import java.io.File;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class AdminDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // user
    public List<User> getListUser() {
        List<User> list = new ArrayList<>();
        String query = "SELECT\n" +
                "\t`user`.id,\n" +
                "\t`user`.username,\n" +
                "\t`user`.`password`,\n" +
                "\t`user`.full_name,\n" +
                "\t`user`.email,\n" +
                "\t`user`.phone_number,\n" +
                "\t`user`.role_id,\n" +
                "\trole.description \n" +
                "FROM\n" +
                "\t`user`\n" +
                "\tJOIN role ON role.id = `user`.role_id \n" +
                "GROUP BY\n" +
                "\t`user`.id,\n" +
                "\t`user`.full_name,\n" +
                "\t`user`.`password`,\n" +
                "\t`user`.full_name,\n" +
                "\t`user`.email,\n" +
                "\t`user`.phone_number,\n" +
                "\t`user`.role_id,\n" +
                "\trole.description";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ps = new DBConnect().getConnection().prepareStatement(query);
                rs = ps.executeQuery();
                while (rs.next()) {
                    User u = new User();
                    u.setId(rs.getInt(1));
                    u.setUserName(rs.getString(2));
                    u.setPassword(rs.getString(3));
                    u.setFullName(rs.getString(4));
                    u.setEmail(rs.getString(5));
                    u.setPhone(rs.getString(6));
                    u.setRole(rs.getInt(7));
                    u.setRoleDes(rs.getString(8));
                    list.add(u);
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getRoleID(String roleName){
        int id = 0;
        String query = "select * from role";
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement != null){
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    if(roleName.equals(rs.getString(2))){
                        id = rs.getInt(1);
                    }
                }
            }
        }catch (Exception e){

        }
        return id;
    }

    public void editDataUser(int id, String userName, String password, String fullName, String email, String phone, int roleName) {
        String query = "UPDATE `user`\n" +
                "SET `user`.username = ?,\n" +
                "`user`.`password` = ?,\n" +
                "`user`.full_name = ?,\n" +
                "`user`.email = ?,\n" +
                "`user`.phone_number = ?,\n" +
                "`user`.updated_at = ?,\n" +
                "`user`.role_id = ?\n" +
                "WHERE `user`.id = ?";

        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);

                ps.setString(1, userName);
                ps.setString(2, password);
                ps.setString(3, fullName);
                ps.setString(4, email);
                ps.setString(5, phone);
                ps.setDate(6, Date.valueOf(LocalDate.now()));
                ps.setInt(7, roleName);
                ps.setInt(8, id);

                ps.executeUpdate();

                System.out.println("Update successfully");
                ps.close();
            }
        } catch (Exception e) {

        }

    }

    public void deleteUser(int uid) {
        String query_del_uid_In_Order = "DELETE FROM `order` WHERE `order`.user_id = ?";
        String query_del_user = "DELETE FROM `user` WHERE `user`.id = ?";

        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement ps_order = new DBConnect().getConnection().prepareStatement(query_del_uid_In_Order);
                PreparedStatement ps_user = new DBConnect().getConnection().prepareStatement(query_del_user);

                ps_order.setInt(1, uid);

                ps_user.setInt(1, uid);

                ps_order.executeUpdate();
                ps_user.executeUpdate();

                System.out.println("Delete Successfully");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // products admin
    public String getNameCategoryWithID(int parent_id) {
        String result = null;
        if (parent_id == 1) {
            result = "Đá quý";
        }
        if (parent_id == 2) {
            result = "Nhẫn";
        }
        if (parent_id == 3) {
            result = "Hoa tai";
        }
        if (parent_id == 4) {
            result = "Vòng cổ";
        }
        if (parent_id == 5) {
            result = "Vòng tay";
        }
        if (parent_id == 6) {
            result = "Mặt dây chuyền";
        }
        if (parent_id == 7) {
            result = "Bộ sưu tập";
        }
        return result;
    }

    public List<ProductAdmin> getData() {

        List<ProductAdmin> listPro = new LinkedList<>();
        String query = "SELECT\n" +
                "\tproduct.id,\n" +
                "\tproduct.category_id,\n" +
                "\tproduct.title,\n" +
                "\tproduct.price,\n" +
                "\tproduct.discount,\n" +
                "\tproduct.description,\n" +
                "\tproduct.thumbnail,\n" +
                "\tproduct.quantity,\n" +
                "\tcategory.parent_id,\n" +
                "\tcategory.`name`,\n" +
                "\tproduct_gem_color.gem_color_id,\n" +
                "\tgem_color.color\n" +
                "FROM\n" +
                "\tproduct\n" +
                "\tJOIN category ON product.category_id = category.id\n" +
                "\tJOIN product_gem_color ON product_gem_color.product_id = product.id\n" +
                "\tJOIN gem_color ON gem_color.id = product_gem_color.gem_color_id\n" +
                "GROUP BY\n" +
                "\tproduct.id,\n" +
                "\tproduct.category_id,\n" +
                "\tproduct.title,\n" +
                "\tproduct.price,\n" +
                "\tproduct.discount,\n" +
                "\tproduct.description,\n" +
                "\tproduct.thumbnail,\n" +
                "\tproduct.quantity,\n" +
                "\tcategory.parent_id,\n" +
                "\tcategory.`name`,\n" +
                "\tproduct_gem_color.gem_color_id,\n" +
                "\tgem_color.color";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ps = new DBConnect().getConnection().prepareStatement(query);
                rs = ps.executeQuery();
                while (rs.next()) {
                    ProductAdmin productAdmin = new ProductAdmin(rs.getInt(1),
                            rs.getString(3),
                            rs.getString(7),
                            rs.getInt(8),
                            new ProductAdmin().checkStatus(rs.getInt(8)),
                            rs.getInt(4),
                            getNameCategoryWithID(rs.getInt(9)),
                            rs.getString(10),
                            rs.getString(12),
                            rs.getInt(5)
                    );
                    listPro.add(productAdmin);
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
        }
        return listPro;
    }

    // delete product
    public void Delete(int id) {

        String query_del_color = "DELETE FROM product_gem_color WHERE product_gem_color.product_id = ?";
        String query_del_product = "DELETE FROM product WHERE product.id = ?";

        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement statement_color = new DBConnect().getConnection().prepareStatement(query_del_color);
                PreparedStatement statement_product = new DBConnect().getConnection().prepareStatement(query_del_product);

                statement_color.setInt(1, id);

                statement_product.setInt(1, id);

                statement_color.executeUpdate();
                statement_product.executeUpdate();

                System.out.println("Delete Successfully");
            }
        } catch (Exception e) {

        }

    }

    // edit product

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

    public void update(int id, String name, String nameGem, String catName, int quantity, String color, int price, File image) {
        String query_color = "UPDATE product_gem_color\n" +
                "SET product_gem_color.gem_color_id = ?\n" +
                "WHERE product_gem_color.product_id = ?";

        String query_product = "UPDATE product \n" +
                "SET product.title = ?,\n" +
                "product.category_id = ?,\n" +
                "product.quantity = ?,\n" +
                "product.discount = ?, \n" +
                "product.thumbnail = ? \n" +
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
                ps_product.setString(5, checkParentFolder(checkParentID(catName)) + image.getPath());
                ps_product.setInt(6, id);

                ps_color.executeUpdate();
                ps_product.executeUpdate();

                System.out.println("Update successfully");
                ps_color.close();
                ps_product.close();
            }
        } catch (Exception e) {

        }

    }

    //    banner
    public List<Banner> getListBanner() {
        List<Banner> list = new ArrayList<>();
        String query = "SELECT * FROM banner";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ps = new DBConnect().getConnection().prepareStatement(query);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Banner b = new Banner();
                    b.setId(rs.getInt(1));
                    b.setName(rs.getString(2));
                    b.setImage(rs.getString(3));
                    list.add(b);
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void editSlider(int id, String name, File image) {
        String query = "UPDATE banner\n" +
                "SET banner.name = ?,\n" +
                "banner.image = ?\n" +
                "WHERE banner.id = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);

                ps.setString(1, name);
                ps.setString(2, "http://localhost:8080/web_nhom41_war/img/Slider/" + image.getPath());
                ps.setInt(3, id);

                System.out.println("Update successfully");
                ps.executeUpdate();
                ps.close();
            }
        } catch (Exception e) {

        }
    }

    public Banner getBannerByID(String id) {
        Banner b = null;
        String query = "SELECT * from banner WHERE banner.id = ?";
        try {
            Statement s = DBConnect.getInstall().get();
            if (s != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    b = new Banner(rs.getInt(1), rs.getString(2), rs.getString(3));
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
        }
        return b;
    }

    // add product
    public int checkParentID(String cat) {
        int result = 0;
        if (cat.equals("Đá quý")) {
            result = 1;
        } else if (cat.equals("Nhẫn")) {
            result = 2;
        } else if (cat.equals("Hoa tai")) {
            result = 3;
        } else if (cat.equals("Vòng cổ")) {
            result = 4;
        } else if (cat.equals("Vòng tay")) {
            result = 5;
        } else if (cat.equals("Mặt dây chuyền")) {
            result = 6;
        } else if (cat.equals("Bộ sưu tập")) {
            result = 7;
        }
        return result;
    }

    public String checkParentFolder(int parentID) {
        String Path = "";
        if (parentID == 2) {
            Path = "http://localhost:8080/web_nhom41_war/img/main_products/rings/";
        }
        if (parentID == 3) {
            Path = "http://localhost:8080/web_nhom41_war/img/main_products/earrings/";
        }
        if (parentID == 4) {
            Path = "http://localhost:8080/web_nhom41_war/img/main_products/necklaces/";
        }
        if (parentID == 5) {
            Path = "http://localhost:8080/web_nhom41_war/img/main_products/bracelets/";
        }
        if (parentID == 6) {
            Path = "http://localhost:8080/web_nhom41_war/img/main_products/pendants/";
        }
        return Path;
    }

    public List<ColorAdmin> getListColor() {
        List<ColorAdmin> listColor = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement psSelectColor = new DBConnect().getConnection().prepareStatement("SELECT * FROM gem_color");
                ResultSet rsSelectColor = psSelectColor.executeQuery();
                while (rsSelectColor.next()) {
                    listColor.add(new ColorAdmin(rsSelectColor.getInt(1), rsSelectColor.getString(2)));
                }
                rsSelectColor.close();
                psSelectColor.close();
            }

        } catch (Exception e) {
        }
        return listColor;
    }

    public int checkIdColor(String color) {
        List<ColorAdmin> listColor = getListColor();
        int idColor = 0;
        for (ColorAdmin ca : listColor) {
            if (color.equals(ca.getNameColor())) {
                idColor = ca.getIdColor();
            }
        }
        return idColor;
    }

    public List<CategoryAdmin> getListCat(String nameCatInput) {
        List<CategoryAdmin> listCat = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {

                PreparedStatement psSelectCat = new DBConnect().getConnection().prepareStatement("SELECT * FROM category");
                ResultSet rsSelectCat = psSelectCat.executeQuery();
                while (rsSelectCat.next()) {
                    if (nameCatInput.equals(rsSelectCat.getString(3))) {
                        listCat.add(new CategoryAdmin(rsSelectCat.getInt(1),
                                rsSelectCat.getInt(2), rsSelectCat.getString(3)));
                    }
                }
                rsSelectCat.close();
                psSelectCat.close();
            }
        } catch (Exception e) {

        }
        return listCat;
    }

    public int checkIdGem(String nameInput, int idParentInput) {
        int result = 0;
        List<CategoryAdmin> listCat = getListCat(nameInput);
        for (CategoryAdmin ca : listCat) {
            if (idParentInput == ca.getIdParent()) {
                result = ca.getIdCat();
            }
        }
        return result;
    }

    public void addProduct(int id, String title, String nameGem, int quantity, String cat,
                           String color, int price, String keyword, String design,
                           File imgLink, String description) {
        String queryAddProduct = "INSERT INTO product (" +
                "product.id," +
                "product.title," +
                "product.quantity," +
                "product.price," +
                "product.keyword," +
                "product.design," +
                "product.category_id," +
                "product.description," +
                "product.thumbnail," +
                "product.discount," +
                "product.is_on_sale," +
                "product.created_at," +
                "product.updated_at) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        String queryAddProductGemColor = "INSERT INTO product_gem_color VALUES (?, ?)";

        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement psAddProduct = new DBConnect().getConnection().prepareStatement(queryAddProduct);
                PreparedStatement psAddProductGemColor = new DBConnect().getConnection().prepareStatement(queryAddProductGemColor);

                psAddProduct.setInt(1, id);
                psAddProduct.setString(2, title);
                psAddProduct.setInt(3, quantity);
                psAddProduct.setInt(4, price);
                psAddProduct.setString(5, keyword);
                psAddProduct.setString(6, design);
                psAddProduct.setInt(7, checkIdGem(nameGem, checkParentID(cat)));
                psAddProduct.setString(8, description);
                psAddProduct.setString(9, checkParentFolder(checkParentID(cat)) + imgLink.getPath());

                psAddProduct.setInt(10, 0);
                psAddProduct.setInt(11, 0);
                psAddProduct.setDate(12, Date.valueOf(LocalDate.now()));
                psAddProduct.setDate(13, Date.valueOf(LocalDate.now()));

                psAddProductGemColor.setInt(1, id);
                psAddProductGemColor.setInt(2, checkIdColor(color));

                psAddProduct.executeUpdate();
                psAddProductGemColor.executeUpdate();

                System.out.println("ADD PRODUCT SUCCESSFULLY");

                psAddProduct.close();
                psAddProductGemColor.close();
            }
        } catch (Exception e) {

        }
    }

    public static void main(String[] args) {

//        new AdminDAO().editDataUser(2, "nguoidungthu02", "22222222"
//                , "nguoi dung thu 02", "nguoidungthu02@gmail.com", "02020202", 0);
//        System.out.println(new AdminDAO().getListUser());
//        System.out.println(new AdminDAO().getListBanner());
//        new AdminDAO().addProduct(141, "sp1", "Thạch anh vàng", 1,
//                "Hoa tai", "Đỏ", 1000, "a", "a", new File("ad"), "a");

        System.out.println(new AdminDAO().getRoleID("Khách hàng"));

    }
}
