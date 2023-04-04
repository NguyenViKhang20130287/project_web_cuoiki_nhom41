package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.OrderUser;
import vn.edu.hcmuaf.fit.entity.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PurchaseDAO {
    DBConnect dbConnect = new DBConnect();

    public int getOrderStatusId(int orderId) {
        int result = 0;
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT `order`.`status` FROM `order` WHERE `order`.id = ?";
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

    public String getmessage(String status) {
        String result = "";
        switch (status) {
            case "Đang giao hàng":
                result = "Đơn hàng đang được giao";
                break;
            case "Chờ thanh toán":
                result = "Đơn hàng đang chờ thanh toán";
                break;
            case "Hoàn thành":
                result = "Đơn hàng đã được giao thành công";
                break;
            case "Đã hủy":
                result = "Đơn hàng đã bị hủy";
                break;
        }
        return result;
    }

    public int getUserID(String uname) {
        int result = 0;
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT `user`.id FROM `user` WHERE username = ?";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);
                dbConnect.ps.setString(1, uname);
                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    result = dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public List<Product> getListItem(int orderId) {
        List<Product> result = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT product.id,product.thumbnail,product.title, order_details.quantity,product.price,product.discount\n" +
                        "FROM `order` JOIN order_details ON `order`.id = order_details.order_id \n" +
                        "JOIN product ON product.id = order_details.product_id \n" +
                        "JOIN order_status ON order_status.id = `order`.`status`\n" +
                        "WHERE `order`.id = ?";
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, orderId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Product product = new Product(
                            rs.getInt(1),
                            rs.getString(3),
                            rs.getInt(5),
                            rs.getInt(6),
                            rs.getString(2),
                            rs.getInt(4)
                    );
                    result.add(product);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public List<OrderUser> getDataPurchase(int userId) {
        List<OrderUser> result = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT `order`.id,`order`.order_total,order_status.`status`\n" +
                        "FROM `order` JOIN order_status ON order_status.id = `order`.`status`\n" +
                        "WHERE `order`.user_id = ?\n" +
                        "ORDER BY `order`.order_date DESC";
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int orderId = rs.getInt(1);
                    OrderUser orderUser = new OrderUser(
                            orderId,
                            getListItem(orderId),
                            rs.getInt(2),
                            rs.getString(3)
                    );
                    result.add(orderUser);
                }
                ps.close();
                rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }

        return result;
    }

    public List<OrderUser> getListStatus(int userId, int statusId) {
        List<OrderUser> result = new ArrayList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT `order`.id,`order`.order_total,order_status.`status`\n" +
                        "FROM `order` JOIN order_status ON order_status.id = `order`.`status`\n" +
                        "WHERE `order`.user_id = ? AND order_status.id = ?\n" +
                        "ORDER BY `order`.order_date DESC";
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, userId);
                ps.setInt(2, statusId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int orderId = rs.getInt(1);
                    OrderUser orderUser = new OrderUser(
                            orderId,
                            getListItem(orderId),
                            rs.getInt(2),
                            rs.getString(3)
                    );
                    result.add(orderUser);
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