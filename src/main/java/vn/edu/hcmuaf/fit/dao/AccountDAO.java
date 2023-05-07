package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Account;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
        }
    }

    public void updatePassword(String newPassword, String username) {
        try {
            String query = "UPDATE `user` SET password=? WHERE username=?";
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                conn = DBConnect.getInstall().connection;
                ps = conn.prepareStatement(query);
                ps.setString(1, newPassword);
                ps.setString(2, username);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
    public void lockAccount(int user_id){
        String query = "UPDATE `user` SET `user`.locked = 1 WHERE `user`.id = ?";
        try{
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null){
                ps = DBConnect.getInstall().getConnection().prepareStatement(query);
                ps.setInt(1, user_id);
                ps.executeUpdate();
            }

        }catch (SQLException e){
            throw new RuntimeException();
        }
    }
    public void unLockAccount(int user_id){
        String query = "UPDATE `user` SET `user`.locked = 0 WHERE `user`.id = ?";
        try{
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null){
                ps = DBConnect.getInstall().getConnection().prepareStatement(query);
                ps.setInt(1, user_id);
                ps.executeUpdate();
            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
    public List<Account> lockedAccountList(){
        List<Account> lockedList = new ArrayList<>();
        String query = "SELECT * FROM `user` WHERE locked = 1";
        try{
            Statement statement = DBConnect.getInstall().get();
            rs = statement.executeQuery(query);
            while (rs.next()){
                Account account = new Account();
                account.setId(rs.getInt(1));
                account.setUsername(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setFullName(rs.getString(4));
                account.setEmail(rs.getString(5));
                account.setPhone(rs.getString(6));
                account.setRole(rs.getInt(9));
                account.setLocked(rs.getInt(10));
                account.setIsSocial(rs.getInt(11));
                lockedList.add(account);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return lockedList;
    }

    public static void main(String[] args) {
//       List<Account> list = new AccountDAO().lockedAccountList();
//       for (Account account : list){
//           System.out.println(account);
//       }
        new AccountDAO().unLockAccount(15);
    }
}
