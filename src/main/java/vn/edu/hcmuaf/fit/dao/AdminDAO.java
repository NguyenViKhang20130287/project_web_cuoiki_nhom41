package vn.edu.hcmuaf.fit.dao;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.*;
import vn.edu.hcmuaf.fit.entity.Color;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
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
                "WHERE locked=0\n" +
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

    public int getRoleID(String roleName) {
        int id = 0;
        String query = "select * from role";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    if (roleName.equals(rs.getString(2))) {
                        id = rs.getInt(1);
                    }
                }
            }
        } catch (Exception e) {

        }
        return id;
    }

    public void editDataUser(int id, String userName, String fullName, String email, String phone, int roleName) {
        String query = "UPDATE `user`\n" +
                "SET `user`.username = ?,\n" +
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
                ps.setString(2, fullName);
                ps.setString(3, email);
                ps.setString(4, phone);
                ps.setDate(5, Date.valueOf(LocalDate.now()));
                ps.setInt(6, roleName);
                ps.setInt(7, id);

                ps.executeUpdate();

                System.out.println("Update successfully");
                ps.close();
            }
        } catch (Exception e) {

        }

    }

    public void deleteUser(int uid) {
        String query_del_uid_logs = "DELETE FROM `logs` WHERE `logs`.`user` = ?";
        String query_del_uid_order_details = "DELETE FROM order_details WHERE order_details.order_id IN (SELECT id FROM `order` WHERE `order`.user_id = ?)";
        String query_del_uid_In_Order = "DELETE FROM `order` WHERE `order`.user_id = ?";
        String query_del_user = "DELETE FROM `user` WHERE `user`.id = ?";

        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement ps_logs = new DBConnect().getConnection().prepareStatement(query_del_uid_logs);
                PreparedStatement ps_order_details = new DBConnect().getConnection().prepareStatement(query_del_uid_order_details);
                PreparedStatement ps_order = new DBConnect().getConnection().prepareStatement(query_del_uid_In_Order);
                PreparedStatement ps_user = new DBConnect().getConnection().prepareStatement(query_del_user);

                ps_order_details.setInt(1, uid);
                ps_order_details.executeUpdate();
                ps_order.setInt(1, uid);
                ps_order.executeUpdate();
                ps_logs.setInt(1, uid);
                ps_logs.executeUpdate();
                ps_user.setInt(1, uid);
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

    public List<Color> getListColor() {
        List<Color> listColor = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement psSelectColor = new DBConnect().getConnection().prepareStatement("SELECT * FROM gem_color");
                ResultSet rsSelectColor = psSelectColor.executeQuery();
                while (rsSelectColor.next()) {
                    listColor.add(new Color(rsSelectColor.getInt(1), rsSelectColor.getString(2)));
                }
                rsSelectColor.close();
                psSelectColor.close();
            }

        } catch (Exception e) {
        }
        return listColor;
    }

    public int checkIdColor(String color) {
        List<Color> listColor = getListColor();
        int idColor = 0;
        for (Color ca : listColor) {
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

    public void writeExcel(List<OrderAdmin> list, String excelFilePath) throws IOException {
        String columns[] = {"Mã đơn", "Họ và tên", "Đơn hàng", "Số điện thoại", "Tổng tiền", "Tình trạng"};
        String query = "SELECT\n" +
                "\t`order`.id,\n" +
                "\t`order`.full_name,\n" +
                "\torder_details.product_id,\n" +
                "\tproduct.title,\n" +
                "\t`order`.phone_number,\n" +
                "\t`order`.order_total,\n" +
                "\t`order`.`status`,\n" +
                "\torder_status.`status` \n" +
                "FROM\n" +
                "\t`order`\n" +
                "\tJOIN order_details ON `order`.id = order_details.order_id\n" +
                "\tJOIN product ON product.id = order_details.product_id\n" +
                "\tJOIN order_status ON order_status.id = `order`.`status` \n" +
                "GROUP BY\n" +
                "\t`order`.id,\n" +
                "\t`order`.full_name,\n" +
                "\torder_details.product_id,\n" +
                "\tproduct.title,\n" +
                "\t`order`.phone_number,\n" +
                "\t`order`.order_total,\n" +
                "\t`order`.`status`,\n" +
                "\torder_status.`status` ";

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Sheet");

        Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerFont.setFontHeightInPoints((short) 14);
        headerFont.setColor(IndexedColors.RED.getIndex());

        // Create a CellStyle with the font
        CellStyle headerCellStyle = workbook.createCellStyle();
        headerCellStyle.setFont(headerFont);

        // Create a Row
        Row headerRow = sheet.createRow(0);

        // Create cells
        for (int i = 0; i < columns.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns[i]);
            cell.setCellStyle(headerCellStyle);
        }

        // Create Other rows and cells with employees data
        int rowNum = 1;
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Row row = sheet.createRow(rowNum++);
                    row.createCell(0)
                            .setCellValue(rs.getInt(1));
                    row.createCell(1)
                            .setCellValue(rs.getString(2));
                    row.createCell(2)
                            .setCellValue(rs.getString(4));
                    row.createCell(3)
                            .setCellValue(rs.getString(5));
                    row.createCell(4)
                            .setCellValue(rs.getInt(6));
                    row.createCell(5)
                            .setCellValue(rs.getString(8));
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {

        }
        for (OrderAdmin o : list) {

        }

        // Write the output to a file
        FileOutputStream fileOut = new FileOutputStream(excelFilePath);
        workbook.write(fileOut);
        fileOut.close();

        // Closing the workbook
        workbook.close();
        System.out.println("write successfully!");

    }

    public void DeleteUser(int id) {

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


    //   home admin
    DBConnect dbConnect = new DBConnect();

    public int getCountUser() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT COUNT(`user`.id) FROM `user`";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public int getCountProduct() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT COUNT(product.id) FROM product";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public int getCountOrder() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT COUNT(`order`.id) FROM `order`";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public int getAboutOutOfStock() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT COUNT(product.id) FROM product WHERE product.quantity <= 5 AND product.quantity > 0 ";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public int getOutOfStock() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT COUNT(product.id) FROM product WHERE product.quantity = 0";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public int getBeCanceled() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT COUNT(`order`.id) FROM `order` JOIN order_status on order_status.id = `order`.`status` WHERE `order`.`status` = 4";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public List<OrderAdmin> getNewestOrder() {
        List<OrderAdmin> result = new ArrayList<>();
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT * FROM `order` ORDER BY `order`.order_date DESC LIMIT 4";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    OrderAdmin orderAdmin = new OrderAdmin(
                            dbConnect.rs.getInt(1),
                            dbConnect.rs.getString(4),
                            dbConnect.rs.getInt(8),
                            dbConnect.rs.getInt(12),
                            dbConnect.rs.getInt(10));
                    result.add(orderAdmin);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public List<Account> getNewestUser() {
        List<Account> result = new ArrayList<>();
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT * FROM `user` ORDER BY `user`.id DESC LIMIT 4";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    Account account = null;
                    if (dbConnect.rs.getString(4) != null) {
                        account = new Account(
                                dbConnect.rs.getInt(1),
                                dbConnect.rs.getString(5),
                                dbConnect.rs.getString(4),
                                dbConnect.rs.getString(6));
                    } else {
                        account = new Account(
                                dbConnect.rs.getInt(1),
                                dbConnect.rs.getString(5),
                                dbConnect.rs.getString(2),
                                dbConnect.rs.getString(6));
                    }

                    result.add(account);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public long getRevenue() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT SUM(`order`.order_total) FROM `order`";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getLong(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public List<Product> getTop5() {
        List<Product> result = new ArrayList<>();
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT product.id, product.title,product.thumbnail,product.price,product.discount,  SUM(order_details.total_money)\n" +
                        "FROM product JOIN order_details on product.id = order_details.product_id JOIN `order` on `order`.id = order_details.order_id\n" +
                        "WHERE `order`.`status` = 3\n" +
                        "GROUP BY  product.id, product.title,product.thumbnail,product.price,product.discount\n" +
                        "ORDER BY SUM(order_details.total_money) DESC LIMIT 5";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    Product product = new Product(
                            dbConnect.rs.getInt(1),
                            dbConnect.rs.getString(2),
                            dbConnect.rs.getString(6),
                            dbConnect.rs.getString(3),
                            dbConnect.rs.getInt(4),
                            dbConnect.rs.getInt(5));
                    result.add(product);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }
//    public String getNameCategoryWithID(int parent_id) {
//        String result = null;
//        if (parent_id == 1) {
//            result = "Đá quý";
//        }
//        if (parent_id == 2) {
//            result = "Nhẫn";
//        }
//        if (parent_id == 3) {
//            result = "Hoa tai";
//        }
//        if (parent_id == 4) {
//            result = "Dây chuyền";
//        }
//        if (parent_id == 5) {
//            result = "Vòng tay";
//        }
//        if (parent_id == 6) {
//            result = "Mặt dây chuyền";
//        }
//        if (parent_id == 7) {
//            result = "Bộ sưu tập";
//        }
//        return result;
//    }

    public List<ProductAdmin> getListOutOfStock() {

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
                "\tWHERE product.quantity = 0\n" +
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
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                dbConnect.ps = new DBConnect().getConnection().prepareStatement(query);
                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    ProductAdmin productAdmin = new ProductAdmin(dbConnect.rs.getInt(1),
                            dbConnect.rs.getString(3),
                            dbConnect.rs.getString(7),
                            dbConnect.rs.getInt(8),
                            new ProductAdmin().checkStatus(dbConnect.rs.getInt(8)),
                            dbConnect.rs.getInt(4),
                            getNameCategoryWithID(dbConnect.rs.getInt(9)),
                            dbConnect.rs.getString(10),
                            dbConnect.rs.getString(12),
                            dbConnect.rs.getInt(5)
                    );
                    listPro.add(productAdmin);
                }
                dbConnect.rs.close();
                dbConnect.ps.close();
            }
        } catch (Exception e) {
        }
        return listPro;
    }

    //


    public ArrayList<Integer> get6MonthTotalRevenue() {
        ArrayList<Integer> total = new ArrayList<>();
        String query = "SELECT \n" +
                "\tYEAR( `order`.order_date ),\n" +
                "\tMONTH ( `order`.order_date ),\n" +
                "\tAVG( `order`.order_total ) \n" +
                "FROM\n" +
                "\t`order` \n" +
                "GROUP BY\n" +
                "\tYEAR( `order`.order_date ),\n" +
                "\tMONTH ( `order`.order_date )\n" +
                "ORDER BY\n" +
                "\t`order`.order_date DESC \n" +
                "\tLIMIT 6";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement preparedStatement = new DBConnect().getConnection().prepareStatement(query);

                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    total.add(rs.getInt(3));
                }
                rs.close();
                preparedStatement.close();

            }
        } catch (Exception e) {
        }
        return total;
    }

    public ArrayList<String> get6MonthLatest() {
        ArrayList<String> months = new ArrayList<>();
        String m = "Tháng ";
        String query = "SELECT \n" +
                "\tYEAR( `order`.order_date ),\n" +
                "\tMONTH ( `order`.order_date ),\n" +
                "\tAVG( `order`.order_total ) \n" +
                "FROM\n" +
                "\t`order` \n" +
                "GROUP BY\n" +
                "\tYEAR( `order`.order_date ),\n" +
                "\tMONTH ( `order`.order_date )\n" +
                "ORDER BY\n" +
                "\t`order`.order_date DESC \n" +
                "\tLIMIT 6";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement preparedStatement = new DBConnect().getConnection().prepareStatement(query);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    months.add(rs.getString(2));
                }
                rs.close();
                preparedStatement.close();
            }
        } catch (Exception e) {
        }
        return months;
    }

    public String print6MonthLatest() {
        ArrayList<String> monthList = get6MonthLatest(); // Gọi phương thức để lấy danh sách 6 tháng gần đây
        Collections.reverse(monthList);

        StringBuilder sb = new StringBuilder(); // Sử dụng StringBuilder để xây dựng chuỗi kết quả
        sb.append("["); // Thêm ký tự "[" vào đầu chuỗi

        for (int i =  0; i < monthList.size(); i++) {
            String month = monthList.get(i);
            sb.append("\"Tháng ").append(month).append("\""); // Thêm tiền tố "tháng" vào mỗi phần tử
            if (i < monthList.size() - 1) {
                sb.append(", "); // Thêm dấu phẩy và khoảng trắng sau mỗi phần tử, trừ phần tử cuối cùng
            }
        }

        sb.append("]"); // Thêm ký tự "]" vào cuối chuỗi
        String result = sb.toString(); // Chuyển StringBuilder thành chuỗi kết quả

//        System.out.println(result); //
        return result;// In ra chuỗi kết quả
    }


    //
    public List<ProductAdmin> getProductInLatestMonth() {
        List<ProductAdmin> list = new ArrayList<>();
        String query = "SELECT\n" +
                "\to.id orderid,\n" +
                "\tMONTH ( o.order_date ) AS thang,\n" +
                "\tYEAR ( o.order_date ) AS nam,\n" +
                "\tp.id,\n" +
                "\tp.title,\n" +
                "\tp.category_id,\n" +
                "\tc.parent_id,\n" +
                "\tp.thumbnail,\n" +
                "\tod.quantity,\n" +
                "\tod.total_money\n" +
                "FROM\n" +
                "\t`order` o\n" +
                "\tJOIN order_details od ON o.id = od.order_id\n" +
                "\tJOIN product p ON od.product_id = p.id \n" +
                "\tJOIN category c ON p.category_id = c.id\n" +
                "WHERE\n" +
                "\tMONTH ( o.order_date ) = (\n" +
                "\tSELECT MONTH\n" +
                "\t\t( o1.order_date ) \n" +
                "\tFROM\n" +
                "\t\t`order` o1 \n" +
                "\tORDER BY\n" +
                "\t\tYEAR ( o1.order_date ) DESC,\n" +
                "\t\tMONTH ( o1.order_date ) DESC \n" +
                "\t\tLIMIT 1 \n" +
                "\t) \n" +
                "GROUP BY\n" +
                "\to.id,\n" +
                "\tMONTH ( o.order_date ),\n" +
                "\tYEAR ( o.order_date ),\n" +
                "\tp.id,\n" +
                "\tp.title,\n" +
                "\tp.category_id,\n" +
                "\tc.parent_id,\n" +
                "\tp.thumbnail,\n" +
                "\tod.quantity,\n" +
                "\tod.total_money\n" +
                "ORDER BY\n" +
                "\tod.quantity DESC";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement ps = new DBConnect().connection.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new ProductAdmin(rs.getInt(4), rs.getString(5),
                            rs.getString(8),
                            rs.getInt(9), rs.getInt(10)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) throws IOException {

//        System.out.println(new AdminDAO().getNewestOrder());

        //        System.out.println(new AdminDAO().getProductInLatestMonth());
        System.out.println(new AdminDAO().get6MonthLatest());
        System.out.println(new AdminDAO().print6MonthLatest());

//        new AdminDAO().editDataUser(2, "nguoidungthu02", "22222222"
//                , "nguoi dung thu 02", "nguoidungthu02@gmail.com", "02020202", 0);
//        System.out.println(new AdminDAO().getListUser());
//        System.out.println(new AdminDAO().getListBanner());
//        new AdminDAO().addProduct(141, "sp1", "Thạch anh vàng", 1,
//                "Hoa tai", "Đỏ", 1000, "a", "a", new File("ad"), "a");

//        System.out.println(new AdminDAO().getRoleID("Khách hàng"));
//        System.out.println(new OrderDAO().getListOrder());
//        List<OrderAdmin> list = new OrderDAO().getListOrder();
//        String path = "..\\web_nhom41\\src\\main\\java\\vn\\edu\\hcmuaf\\fit\\excel\\result.xlsx";
//        new AdminDAO().writeExcel(list, path);
    }
}
