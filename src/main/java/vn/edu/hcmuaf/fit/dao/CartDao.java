package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Product;

import java.sql.SQLException;
import java.sql.Statement;

public class CartDao {
    DBConnect dbConnect = new DBConnect();
    CategoryDAO categoryDAO = new CategoryDAO();

    public Product getProductById(String id) {
        Product product = new Product();
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT * FROM product WHERE product.id = ?;";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);
                dbConnect.ps.setString(1, id);
                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    product.setId(dbConnect.rs.getInt(1));
                    product.setCategory(categoryDAO.getCategory(dbConnect.rs.getInt(2)));
                    product.setTitle(dbConnect.rs.getString(3));
                    product.setKeyword(dbConnect.rs.getString(4));
                    product.setPrice(dbConnect.rs.getInt(5));
                    product.setDiscount(dbConnect.rs.getInt(6));
                    product.setDesign(dbConnect.rs.getString(7));
                    product.setThumbnail(dbConnect.rs.getString(8));
                    product.setDescription(dbConnect.rs.getString(9));
                    product.setQuantity(dbConnect.rs.getInt(10));
                    dbConnect.ps.executeUpdate();
                    dbConnect.ps.close();
                    statement.close();
                }
            }
        } catch (SQLException e) {

        }
        return product;
    }

    public String checkQuantity(String id) {
        String result = "";
        Product p = getProductById(id);
        if (p.getQuantity() > 0) {
            result = "";

        } else {
            result = "disabled";
        }
        return result;
    }


}
