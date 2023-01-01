package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GalleryDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    CategoryDAO categoryDAO = new CategoryDAO();

    /* Phướng thức lấy ra danh sách ảnh chi tiết của từng sản phẩm theo id sản phẩm */
    public List<Gallery> getGallery(int product_id) {
        List<Gallery> galleryList = new ArrayList<>();
        String query = "SELECT * FROM gallery where product_id = " + product_id + "";
        Statement statement = DBConnect.getInstall().get();
        try {
            if (statement != null) {
                rs = statement.executeQuery(query);
                while (rs.next()) {
                    Gallery gallery = new Gallery();
                    gallery.setId(rs.getInt(1));
                    gallery.setProduct_id(rs.getInt(2));
                    gallery.setThumbnail(rs.getString(3));
                    galleryList.add(gallery);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return galleryList;
    }
    /* Phương thức lấy ra biến thể theo id danh mục sản phẩm */
    public Variation getVariation(int category_id){
        Variation variation = new Variation();
        String query = "SELECT* from variation WHERE category_id = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null){
                ps = DBConnect.getInstall().getConnection().prepareStatement(query);
                ps.setInt(1, category_id);
                rs = ps.executeQuery();
                while (rs.next()){
                    variation.setId(rs.getInt(1));
                    variation.setCategory(categoryDAO.getCategory(rs.getInt(2)));
                    variation.setName(rs.getString(3));
                }
            }

        }
        catch (SQLException e){
            throw  new RuntimeException(e);
        }
        return variation;
    }

    /* Phương thức lấy ra danh sách biến thể của sản phẩm theo id của danh mục */
    public List<Variation> getVariationList(int category_id) {
        List<Variation> variationList = new ArrayList<>();
        String query = "SELECT* from variation WHERE category_id = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ps = DBConnect.getInstall().getConnection().prepareStatement(query);
                ps.setInt(1, category_id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Variation variation = new Variation();
                    variation.setId(rs.getInt(1));
                    variation.setCategory(categoryDAO.getCategory(rs.getInt(2)));
                    variation.setName(rs.getString(3));
                    variationList.add(variation);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return variationList;
    }
    /* Phương thức lấy ra danh sách các tùy chọn của biến thể theo id của biến thể */
    public List<VariationOption> getVariationOptionList(int variation_id) {
        List<VariationOption> variationOptionsList = new ArrayList<>();
        String query = "SELECT* FROM variation_option vo INNER JOIN variation v on vo.variation_id = v.id WHERE vo.variation_id = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ps = DBConnect.getInstall().getConnection().prepareStatement(query);
                ps.setInt(1, variation_id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    VariationOption variationOption = new VariationOption();
                    variationOption.setId(rs.getInt(1));
                    Category category = categoryDAO.getCategory(rs.getInt(5));
                    Variation variation = new Variation(rs.getInt(4), category, rs.getString(6));
                    variationOption.setVariation(variation);
                    variationOption.setValue(rs.getString(3));
                    variationOptionsList.add(variationOption);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return variationOptionsList;
    }
    public List<ColorAdmin> getListGemColor(){
        List<ColorAdmin> list = new ArrayList<>();
        String query = "SELECT * FROM gem_color";
        Statement statement = DBConnect.getInstall().get();
        try {
            if(statement!=null){
                rs = statement.executeQuery(query);
                while (rs.next()){
                    ColorAdmin gemColor = new ColorAdmin();
                    gemColor.setIdColor(rs.getInt(1));
                    gemColor.setNameColor(rs.getString(2));
                    list.add(gemColor);
                }
            }
        }catch (SQLException e){
            throw new RuntimeException();
        }
        return list;
    }

    public static void main(String[] args) {
        CategoryDAO categoryDAO1 = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();
        GalleryDAO galleryDAO = new GalleryDAO();
        Product product = new Product();
        Variation variation = galleryDAO.getVariation(2);
        List<VariationOption> variationOptionList = galleryDAO.getVariationOptionList(variation.getId());
        List<ColorAdmin> list = galleryDAO.getListGemColor();
        for (ColorAdmin c : list){
            System.out.println(c);
        }
    }

}

