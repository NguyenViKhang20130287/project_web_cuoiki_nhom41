package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Account;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ForgotPasswordDAO {

    public Account checkEmailExists(String email) {
        String query = "select `user`.username, `user`.email from `user` where `user`.email = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement preparedStatement = new DBConnect().getConnection().prepareStatement(query);
                preparedStatement.setString(1, email);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    Account acc = new Account(resultSet.getString(1), resultSet.getString(2));
                    return acc;
                }
            }

        } catch (Exception e) {

        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new ForgotPasswordDAO().checkEmailExists("vikhang17112002@gmail.com"));
    }

}
