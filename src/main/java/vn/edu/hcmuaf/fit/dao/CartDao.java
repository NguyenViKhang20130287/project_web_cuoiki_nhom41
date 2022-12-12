package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Product;

import java.sql.SQLException;
import java.sql.Statement;

public class CartDao {
    DBConnect dbConnect = new DBConnect();

    public Product getProductById(String id) {
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT * FROM product WHERE product.id = ?;";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);
                dbConnect.ps.setString(1, id);
                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return new Product(dbConnect.rs.getInt(1),
                            dbConnect.rs.getInt(2),
                            dbConnect.rs.getString(3),
                            dbConnect.rs.getString(4),
                            dbConnect.rs.getInt(5),
                            dbConnect.rs.getInt(6),
                            dbConnect.rs.getString(7),
                            dbConnect.rs.getString(8),
                            dbConnect.rs.getString(9),
                            dbConnect.rs.getInt(10));
                }

            }
        } catch (SQLException e) {

        }
        return null;
    }

}
