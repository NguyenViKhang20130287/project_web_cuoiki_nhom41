package vn.edu.hcmuaf.fit.database;

import vn.edu.hcmuaf.fit.entity.Account;

import java.sql.*;

public class dbConnect {
    private String url = "jdbc:mysql://localhost:3306/webbanhang";
    private String user = "root";
    private String pass = "";

    Connection connection;
    PreparedStatement ps = null;

    ResultSet rs = null;
    private static dbConnect install;

    public dbConnect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(this.url, this.user, this.pass);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static dbConnect getInstall() {
        if (install == null) install = new dbConnect();
        return install;
    }

    public Statement get() {
        try {
            if (connection == null) return null;
            return connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (SQLException e) {
            return null;
        }
    }

    public Account checkAccount(String email, String pass) {
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "select * from `user` where email = ? and password = ?";
                ps = connection.prepareStatement(query);
                ps.setString(1, email);
                ps.setString(2, pass);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Account ac = new Account(rs.getString(5), rs.getString(3));
                    return ac;
                }
            }
        } catch (Exception e) {
//            throw new RuntimeException(e);
        }
        return null;
    }

    public Account checkAccountWithUname(String uname, String pass) {
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "select * from `user` where username = ? and password = ?";
                ps = connection.prepareStatement(query);
                ps.setString(1, uname);
                ps.setString(2, pass);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Account ac = new Account(rs.getString(2), rs.getString(3));
                    return ac;
                }
            }
        } catch (Exception e) {
//            throw new RuntimeException(e);
        }
        return null;
    }

    public Account checkAccountUnameAndEmail(String username, String email) {
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "select * from `user` where username = ? or email = ?";
                ps = connection.prepareStatement(query);
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
        String query = "INSERT INTO `user` (`user`.username, `user`.email, `user`.`password`) VALUES(?, ?, ?)";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public static void main(String[] args) {

        new dbConnect().checkAccount("a123@gmail.com", "123");

//        try {
//            Statement statement = DBConnect.getInstall().get();
//            if (statement != null) {
//                ResultSet rs = statement.executeQuery("select * from `user`");
//                while (rs.next()) {
//                    String email = rs.getString(5);
//                    String pass = rs.getString(3);
//                    System.out.print(email + " ----- ");
//                    System.out.println(pass);
//                }
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
    }
}

