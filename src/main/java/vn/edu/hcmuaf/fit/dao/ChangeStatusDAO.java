package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;

import java.sql.SQLException;
import java.sql.Statement;

public class ChangeStatusDAO {
    DBConnect dbConnect = new DBConnect();

    public void updateStatus(int id, int status) {
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "UPDATE `order`\n" +
                        "SET `order`.`status` = ?\n" +
                        "WHERE `order`.id = ?";

                dbConnect.ps = dbConnect.connection.prepareStatement(query);
                if (status >= 4) {
                    return;

                } else {

                    dbConnect.ps.setInt(1, status + 1);
                }
                dbConnect.ps.setInt(2, id);
                dbConnect.ps.executeUpdate();
                dbConnect.ps.close();
                statement.close();
            }
        } catch (SQLException e) {

        }

    }

}
