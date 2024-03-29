package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.User;

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

    public Account getAccount(String username) {
        Account account = new Account();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT * FROM `user` WHERE username = ?";
                ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setString(1, username);
                rs = ps.executeQuery();
                while (rs.next()) {
                    account.setId(rs.getInt(1));
                    account.setUsername(rs.getString(2));
                    account.setPassword(rs.getString(3));
                    account.setFullName(rs.getString(4));
                    account.setEmail(rs.getString(5));
                    account.setPhone(rs.getString(6));
                    account.setRole(rs.getInt(9));
                    account.setLocked(rs.getInt(10));
                    account.setIsSocial(rs.getInt(11));
                    return account;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return null;
    }
    public Account getAccount(int id) {
        Account account = new Account();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT * FROM `user` WHERE id = ?";
                ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    account.setId(rs.getInt(1));
                    account.setUsername(rs.getString(2));
                    account.setPassword(rs.getString(3));
                    account.setFullName(rs.getString(4));
                    account.setEmail(rs.getString(5));
                    account.setPhone(rs.getString(6));
                    account.setRole(rs.getInt(9));
                    account.setLocked(rs.getInt(10));
                    account.setIsSocial(rs.getInt(11));
                    return account;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return null;
    }

    public int countLoginFail(int user_id) {
        String query = "SELECT COUNT(`user`) FROM `logs` WHERE `user` = ? AND content = 'Đăng nhập thất bại' AND status = 0 AND DATE(created_at) = CURDATE()";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ps = DBConnect.getInstall().getConnection().prepareStatement(query);
                ps.setInt(1, user_id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return 0;
    }

    public static void main(String[] args) {
        LoginDAO loginDAO = new LoginDAO();
        System.out.println(loginDAO.countLoginFail(13));
    }

}
