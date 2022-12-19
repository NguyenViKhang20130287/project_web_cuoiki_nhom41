package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Account;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginDAO {
    PreparedStatement ps = null;

    ResultSet rs = null;

    public Account login(String uname, String pass) {
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                String query = "select * from `user` where username = ? and password = ?";
                ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setString(1, uname);
                ps.setString(2, pass);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Account acc = new Account(rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(9));
                    int role = acc.getRole();
                    String fullName = acc.getFullName();
//                    role = rs.getInt(9);
//                    System.out.println("Role: " + role);
                    System.out.println(acc.getRole());
                    return acc;
                }
            }
        } catch (SQLException e) {
//            throw new RuntimeException(e);
        }
        return null;
    }

    public static void main(String[] args) {
        new LoginDAO().login("nguyenvikhang", "88888888");
        new LoginDAO().login("nguyenvana", "11111111");
//        System.out.println(new LoginDAO().login("nguyenvikhang", "88888888"));
    }
}
