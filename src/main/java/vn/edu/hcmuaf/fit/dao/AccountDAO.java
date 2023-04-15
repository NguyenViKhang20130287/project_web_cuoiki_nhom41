package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Account;

import java.sql.*;

public class AccountDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void updateAccount(String name, String email, String phone, String username) {
        try {
            String query = "UPDATE `user` SET";
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                conn = new DBConnect().get().getConnection();
                if (!name.isEmpty()) {
                    query += " full_name=?,";
                }
                if (!email.isEmpty()) {
                    query += " email=?,";
                }
                if (!phone.isEmpty()) {
                    query += " phone_number=?,";
                }
                query = query.substring(0, query.length() - 1);
                query += " WHERE username=?";
                ps = conn.prepareStatement(query);
                int i = 1;
                if (!name.isEmpty()) {
                    ps.setString(i++, name);
                }
                if (!email.isEmpty()) {
                    ps.setString(i++, email);
                }
                if (!phone.isEmpty()) {
                    ps.setString(i++, phone);
                }
                ps.setString(i, username);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException();
        } finally {
            // Đóng kết nối đến cơ sở dữ liệu
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                // Ignored
            }
        }
    }
}
