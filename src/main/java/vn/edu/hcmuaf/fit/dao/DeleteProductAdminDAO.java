package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteProductAdminDAO {
    public void Delete(int id){

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

}
