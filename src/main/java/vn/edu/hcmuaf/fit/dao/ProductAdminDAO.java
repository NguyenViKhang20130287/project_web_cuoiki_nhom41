package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.ProductAdmin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class ProductAdminDAO {

    PreparedStatement ps;
    ResultSet rs;

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
            result = "Dây chuyền";
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


    public static void main(String[] args) throws SQLException {

//        System.out.println(new ProductAdminDAO().getNameCategoryWithID(4));

        System.out.println(new ProductAdminDAO().getData());
    }

}
