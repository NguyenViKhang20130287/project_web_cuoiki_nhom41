package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Account;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ForgotPasswordDAO {

    public Account checkEmailExists(String email) {
        String query = "select `user`.id, `user`.username, `user`.email, `user`.password from `user` where `user`.email = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement preparedStatement = new DBConnect().getConnection().prepareStatement(query);
                preparedStatement.setString(1, email);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    Account acc = new Account(resultSet.getInt(1), resultSet.getString(2),
                            resultSet.getString(3), resultSet.getString(4));
                    System.out.println(acc.getId());
                    System.out.println(acc.getPassword());
                    return acc;
                }
            }

        } catch (Exception e) {

        }
        return null;
    }

    public void changePassword(int id, String newPassword) {
        String query = "UPDATE `user`\n" +
                "SET `user`.`password` = ?" +
                "WHERE `user`.id = ?";

        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement preparedStatement = new DBConnect().getConnection().prepareStatement(query);

                preparedStatement.setString(1, newPassword);
                preparedStatement.setInt(2, id);
                preparedStatement.executeUpdate();

                System.out.println("Change password successfully");
            }

        } catch (Exception e) {

        }
    }

}
