package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.CartItem;
import vn.edu.hcmuaf.fit.entity.Product;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class CheckoutDAO {
    DBConnect dbConnect = new DBConnect();

    public int getTotalMoney(HashMap<Integer, CartItem> map) {
        int result = 0;
        for (Map.Entry<Integer, CartItem> entry : map.entrySet()) {

            if (entry.getValue().getProduct().getDiscount() != 0) {

                result += entry.getValue().getProduct().getDiscount() * entry.getValue().getQuantity();

            } else {
                result += entry.getValue().getProduct().getPrice() * entry.getValue().getQuantity();

            }
        }
        return result;
    }

    public int getIdAddress(String streetAddress, String ward, String district, String city) {
        int result = 0;
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT id FROM address WHERE hnum_sname = ? AND ward_commune = ? AND county_district = ? AND province_city = ?";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);
                dbConnect.ps.setString(1, streetAddress);
                dbConnect.ps.setString(2, ward);
                dbConnect.ps.setString(3, district);
                dbConnect.ps.setString(4, city);
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

    public void addAddress(String streetAddress, String ward, String district, String city) {
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "INSERT INTO address(hnum_sname,ward_commune,county_district,province_city) VALUES (?,?,?,?)";
                dbConnect.ps = dbConnect.getConnection().prepareStatement(query);
                dbConnect.ps.setString(1, streetAddress);
                dbConnect.ps.setString(2, ward);
                dbConnect.ps.setString(3, district);
                dbConnect.ps.setString(4, city);
                dbConnect.ps.executeUpdate();
                dbConnect.ps.close();
                statement.close();

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getOrderID(String name, int addId, String mail, String phone, int total) {
        int result = 0;
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT id FROM `order` WHERE `order`.full_name = ? AND shipping_address = ? AND email = ? AND phone_number = ? AND order_total = ?";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);

                dbConnect.ps.setString(1, name);
                dbConnect.ps.setInt(2, addId);
                dbConnect.ps.setString(3, mail);
                dbConnect.ps.setString(4, phone);
                dbConnect.ps.setInt(5, total);

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

    public void addOrderDetail(int productId, int orderId, int price, int quantity) {
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "INSERT INTO order_details(product_id,order_id,price,quantity,total_money) VALUES (?,?,?,?,?)";
                dbConnect.ps = dbConnect.getConnection().prepareStatement(query);

                dbConnect.ps.setInt(1, productId);
                dbConnect.ps.setInt(2, orderId);
                dbConnect.ps.setInt(3, price);
                dbConnect.ps.setInt(4, quantity);
                dbConnect.ps.setInt(5, price * quantity);

                dbConnect.ps.executeUpdate();
                dbConnect.ps.close();
                statement.close();

            }
        } catch (SQLException e) {
        }
    }

    public int getUserID(String username) {
        int result = 0;
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT id FROM `user` WHERE username = ?";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);

                dbConnect.ps.setString(1, username);

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

    public void addCheckout(String name, int idAdd, String mail, String phone, String note, HashMap<Integer, CartItem> map, String userId, String payment, int statusId) {
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {

                String query_order = "INSERT INTO `order`(full_name,user_id,shipping_address,email,phone_number,order_date,order_total,payment_method,`status`) VALUES (?,?,?,?,?,NOW(),?,?,?)";
                dbConnect.ps = dbConnect.connection.prepareStatement(query_order);


                int total = getTotalMoney(map);
                dbConnect.ps.setString(1, name);
                dbConnect.ps.setString(2, userId);
                dbConnect.ps.setInt(3, idAdd);
                dbConnect.ps.setString(4, mail);
                dbConnect.ps.setString(5, phone);
                dbConnect.ps.setInt(6, total);
                dbConnect.ps.setString(7, payment);
                dbConnect.ps.setInt(8, statusId);
                dbConnect.ps.executeUpdate();
                dbConnect.ps.close();
                statement.close();

            }
        } catch (SQLException e) {

        }
    }

    public Account checkEmail(String email) {
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT * FROM `user`  WHERE email = ? OR username = ?";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);

                dbConnect.ps.setString(1, email);
                dbConnect.ps.setString(2, email.substring(0, email.indexOf("@") + 1));
                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    Account ac = new Account(
                            dbConnect.rs.getInt(1),
                            dbConnect.rs.getString(2),
                            dbConnect.rs.getString(3),
                            dbConnect.rs.getString(4),
                            dbConnect.rs.getString(5),
                            dbConnect.rs.getString(6));
                    return ac;
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void registerCheckout(String password, String fullname, String email, String phone) {
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "INSERT INTO `user`(`password`,full_name,email,phone_number,created_at,updated_at,role_id,username) VALUES (?,?,?,?,NOW(),NOW(),1,?)";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);

                dbConnect.ps.setString(1, password);
                dbConnect.ps.setString(2, fullname);
                dbConnect.ps.setString(3, email);
                dbConnect.ps.setString(4, phone);
                dbConnect.ps.setString(5, email.substring(0, email.indexOf("@") + 1));
                dbConnect.ps.executeUpdate();

                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
    }

    public void updateQuantity(String id, int quantity) {
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                if (quantity > 0) {
                    String query = "UPDATE product\n" +
                            "SET quantity = ?,updated_at = NOW()\n" +
                            "WHERE id=?;";
                    dbConnect.ps = dbConnect.connection.prepareStatement(query);
                    dbConnect.ps.setInt(1, quantity);
                    dbConnect.ps.setInt(2, Integer.parseInt(id));
                    dbConnect.ps.executeUpdate();
                    dbConnect.ps.close();
                    statement.close();
                } else {
                    String query = "UPDATE product\n" +
                            "SET quantity = ?,updated_at = NOW()\n" +
                            "WHERE id=?;";
                    dbConnect.ps = dbConnect.connection.prepareStatement(query);
                    dbConnect.ps.setInt(1, quantity);
                    dbConnect.ps.setInt(2, Integer.parseInt(id));
                    dbConnect.ps.executeUpdate();
                    dbConnect.ps.close();
                    statement.close();
                }

            }
        } catch (SQLException e) {

        }
    }


}
