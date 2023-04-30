package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Log;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public static void main(String[] args) {
        LogDAO logDAO = new LogDAO();
        logDAO.insertLog(new Log(0, 10, "LoginControl", "Login fail", 1, "dksjds", "ahsdkasjd"));
    }
}
