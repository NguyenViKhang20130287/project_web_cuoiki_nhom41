package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EditProductDAO {

    public String checkNameGemWithID(int id) {

        String result = "";
        String query = "SELECT\n" +
                "\tproduct.id,\n" +
                "\tproduct.category_id,\n" +
                "\tcategory.`name` \n" +
                "FROM\n" +
                "\tproduct\n" +
                "\tJOIN category ON product.category_id = category.id \n" +
                "GROUP BY\n" +
                "\tproduct.id,\n" +
                "\tproduct.category_id,\n" +
                "\tcategory.`name`";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement preSt = new DBConnect().getConnection().prepareStatement(query);
                ResultSet resultSet = preSt.executeQuery();
                while (resultSet.next()) {
                    if (resultSet.getInt(1) == id) {
                        result = resultSet.getString(3);
                    }
                }

            }
        } catch (Exception e) {
        }
        return result;
    }

    public String checkColorWithID(int id) {
        String color = "";
        String query = "SELECT\n" +
                "\tproduct.id,\n" +
                "\tproduct_gem_color.gem_color_id,\n" +
                "\tgem_color.color \n" +
                "FROM\n" +
                "\tproduct\n" +
                "\tJOIN product_gem_color ON product.id = product_gem_color.product_id\n" +
                "\tJOIN gem_color ON gem_color.id = product_gem_color.gem_color_id \n" +
                "GROUP BY\n" +
                "\tproduct.id,\n" +
                "\tproduct_gem_color.gem_color_id,\n" +
                "\tgem_color.color";

        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement preparedStatement = new DBConnect().getConnection().prepareStatement(query);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    if (resultSet.getInt(1) == id) {
                        color = resultSet.getString(3);
                    }
                }
            }
        } catch (Exception e) {

        }
        return color;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(new EditProductDAO().checkNameGemWithID(1));
        ;
        System.out.println(new EditProductDAO().checkColorWithID(1));
        ;
    }

}
