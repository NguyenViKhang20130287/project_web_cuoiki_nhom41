package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class orderdetailDAO {
    public String getStatusName(int orderId) {
        String result = "";

        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "SELECT order_status.`status` \n" +
                    "FROM `order` JOIN order_status ON `order`.`status` = order_status.id \n" +
                    "WHERE `order`.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    result = rs.getString(1);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public String getFullname(int orderId) {
        String result = "";

        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "SELECT `order`.full_name\n" +
                    "FROM `order` \n" +
                    "WHERE `order`.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    result = rs.getString(1);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public String getPhone(int orderId) {
        String result = "";

        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "SELECT `order`.phone_number\n" +
                    "FROM `order` \n" +
                    "WHERE `order`.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    result = rs.getString(1);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public String getPaymentMethod(int orderId) {
        String result = "";

        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "SELECT `order`.payment_method \n" +
                    "FROM `order`\n" +
                    "WHERE `order`.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    result = rs.getString(1);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public String getEmail(int orderId) {
        String result = "";

        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "SELECT `order`.email \n" +
                    "FROM `order`\n" +
                    "WHERE `order`.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    result = rs.getString(1);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public String getOrderDate(int orderId) {
        String result = "";

        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "SELECT `order`.order_date \n" +
                    "FROM `order`\n" +
                    "WHERE `order`.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    result = rs.getString(1);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public int getTotal(int orderId) {
        int result = 0;
        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "SELECT `order`.order_total\n" +
                    "FROM `order`\n" +
                    "WHERE `order`.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    result = rs.getInt(1);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public int getStatusId(int orderId) {
        int result = 0;
        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "SELECT `order`.`status` FROM `order` WHERE `order`.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    result = rs.getInt(1);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public String getAddress(int orderId) {
        String result = "";
        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "SELECT address.hnum_sname,address.ward_commune,address.county_district,address.province_city\n" +
                    "FROM `order` JOIN address ON `order`.shipping_address = address.id\n" +
                    "WHERE `order`.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    for (int i = 1; i < 4; i++) {
                        result += (rs.getString(i) + ", ");
                    }
                    result += rs.getString(4);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public void paid(int orderId) {
        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "UPDATE `order`\n" +
                    "SET `order`.`status` = 2\n" +
                    "WHERE `order`.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ps.executeUpdate();
                ps.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
    }

    public void cancel(int orderId) {
        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "UPDATE `order`\n" +
                    "SET `order`.`status` = 4\n" +
                    "WHERE `order`.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ps.executeUpdate();
                ps.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
    }

    public void updateQuantityAfterCancel(int productId, int quantity) {
        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "UPDATE product\n" +
                    "SET product.quantity = ?\n" +
                    "WHERE product.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, quantity);
                ps.setInt(2, productId);
                ps.executeUpdate();
                ps.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
    }

    public int getQuantity(int productId) {
        int result = 0;
        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "SELECT product.quantity \n" +
                    "FROM product\n" +
                    "WHERE product.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, productId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    result = rs.getInt(1);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public int getShippingCost(int orderId) {
        int result = 0;
        try {
            Statement statement = DBConnect.getInstall().get();
            String query = "SELECT `order`.shipping_cost\n" +
                    "FROM `order`\n" +
                    "WHERE `order`.id = ?";
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    result = rs.getInt(1);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }
}
