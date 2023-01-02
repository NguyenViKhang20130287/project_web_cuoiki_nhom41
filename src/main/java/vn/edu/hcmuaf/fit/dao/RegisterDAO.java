package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Account;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;

public class RegisterDAO {

    PreparedStatement ps = null;

    ResultSet rs = null;

    public Account checkAccountUnameAndEmail(String username, String email) {
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                String query = "select * from `user` where username = ? or email = ?";
                ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, email);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Account ac = new Account(rs.getString(2), rs.getString(5));
                    return ac;
                }
            }
        } catch (Exception e) {
//            throw new RuntimeException(e);
        }
        return null;
    }

    public void signUp(String username, String email, String password) {
        String query = "INSERT INTO `user` (`user`.username, `user`.email, " +
                "`user`.`password`, `user`.role_id, `user`.created_at, `user`.updated_at) VALUES(?, ?, ?, ?, ?, ?)";

        try {
            ps = new DBConnect().getConnection().prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setInt(4, 1);
            ps.setDate(5, Date.valueOf(LocalDate.now()));
            ps.setDate(6, Date.valueOf(LocalDate.now()));
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
}
