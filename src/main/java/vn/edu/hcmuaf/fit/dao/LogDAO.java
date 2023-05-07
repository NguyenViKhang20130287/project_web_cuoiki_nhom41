package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Log;

import java.sql.*;

public class LogDAO {
    Connection conn;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void insertLog(Log log) {
        String query = "INSERT INTO `logs`(`level`, `user`, src, content, `status`, clientIP, browserInfo) VALUES (?,?,?,?,?,?,?)";
        try {
            conn = DBConnect.getInstall().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, log.getLevel());
            ps.setInt(2, log.getUser_id());
            ps.setString(3, log.getSource());
            ps.setString(4, log.getContent());
            ps.setInt(5, log.getStatus());
            ps.setString(6, log.getClientIP());
            ps.setString(7, log.getBrowserInfo());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateStatus(int user_id) {
        String query = "UPDATE `logs` SET `status` = 1 WHERE `user` = ? AND content = 'Đăng nhập thất bại' AND DATE(created_at) = CURDATE()";
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null){
                ps = DBConnect.getInstall().getConnection().prepareStatement(query);
                ps.setInt(1, user_id);
                ps.executeUpdate();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        LogDAO logDAO = new LogDAO();
        logDAO.insertLog(new Log(0, 10, "LoginControl", "Login fail", 1, "dksjds", "ahsdkasjd"));
    }
}
