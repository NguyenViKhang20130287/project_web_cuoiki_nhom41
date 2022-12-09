package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Category;
import vn.edu.hcmuaf.fit.entity.ColorAdmin;
import vn.edu.hcmuaf.fit.entity.ProductAdmin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class ProductAdminDAO {

    PreparedStatement ps = null;

    PreparedStatement psCat = null;

    ResultSet rs = null;

    ResultSet rsCat = null;

    public List<Category> getListCategory() {
        List<Category> ListCat = new LinkedList<>();
        try {
            psCat = new DBConnect().getConnection().prepareStatement("SELECT * FROM category");
            rsCat = psCat.executeQuery();
            while (rsCat.next()) {
                ListCat.add(new Category(rsCat.getInt(1), rsCat.getInt(2), rsCat.getString(3)));
            }

        } catch (Exception e) {

        }
        return ListCat;
    }

    public String checkCat(int idCatInProduct) {
        String cat = "";
        List<Category> listCat = getListCategory();
        for(Category c : listCat){
            if(idCatInProduct == c.getId()){
                for(Category c1 : listCat){
                    if(c.getParent_id() == c1.getId()){
                        cat = c1.getName();
                    }
                }
            }
        }
        return cat;
    }

    public List<ProductAdmin> getData() {

        List<ProductAdmin> listPro = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                String query = "select * from product";
                ps = new DBConnect().getConnection().prepareStatement(query);
                rs = ps.executeQuery();
                while (rs.next()) {

                    listPro.add(new ProductAdmin(rs.getInt(1), rs.getString(3), rs.getString(8)
                            , rs.getInt(10), new ProductAdmin().checkStatus(rs.getInt(10)),
                            rs.getInt(5), checkCat(rs.getInt(2))));
                }
            }
        } catch (Exception e) {
        }
        return listPro;
    }

    public static void main(String[] args) {

//        System.out.println(new ProductAdminDAO().getListCategory());
        System.out.println(new ProductAdminDAO().checkCat(25));
        System.out.println(new ProductAdminDAO().getData());
    }

}
