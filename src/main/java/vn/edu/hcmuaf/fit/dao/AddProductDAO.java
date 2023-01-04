package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.CategoryAdmin;
import vn.edu.hcmuaf.fit.entity.ColorAdmin;

import java.io.File;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;

public class AddProductDAO {

    PreparedStatement psAddProduct = null, psSelectProduct = null,
            psAddProductGemColor = null,
            psSelectCat = null, psSelectColor = null;

    ResultSet rsSelectProduct = null, rsSelectCat = null, rsSelectColor = null;

    public List<CategoryAdmin> getListCat(String nameCatInput) {
        List<CategoryAdmin> listCat = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {

                psSelectCat = new DBConnect().getConnection().prepareStatement("SELECT * FROM category");
                rsSelectCat = psSelectCat.executeQuery();
                while (rsSelectCat.next()) {
                    if (nameCatInput.equals(rsSelectCat.getString(3))) {
                        listCat.add(new CategoryAdmin(rsSelectCat.getInt(1),
                                rsSelectCat.getInt(2), rsSelectCat.getString(3)));
                    }
                }
//                rsSelectCat.close();
//                psSelectCat.close();
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
                psSelectColor = new DBConnect().getConnection().prepareStatement("SELECT * FROM gem_color");
                rsSelectColor = psSelectColor.executeQuery();
                while (rsSelectColor.next()) {
                    listColor.add(new ColorAdmin(rsSelectColor.getInt(1), rsSelectColor.getString(2)));
                }
//                rsSelectColor.close();
//                psSelectColor.close();
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

        String querySelectCat = "SELECT * FROM category";

        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                psAddProduct = new DBConnect().getConnection().prepareStatement(queryAddProduct);
                psAddProductGemColor = new DBConnect().getConnection().prepareStatement(queryAddProductGemColor);

                psSelectCat = new DBConnect().getConnection().prepareStatement(querySelectCat);

                rsSelectCat = psSelectCat.executeQuery();


                psAddProduct.setInt(1, id);
                psAddProduct.setString(2, title);
                psAddProduct.setInt(3, quantity);
                psAddProduct.setInt(4, price);
                psAddProduct.setString(5, keyword);
                psAddProduct.setString(6, design);
                psAddProduct.setInt(7, checkIdGem(nameGem,
                        new AddProductDAO().checkParentID(cat)));
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

                psAddProduct.close();
                psAddProductGemColor.close();
            }
        } catch (Exception e) {

        }
    }

}
