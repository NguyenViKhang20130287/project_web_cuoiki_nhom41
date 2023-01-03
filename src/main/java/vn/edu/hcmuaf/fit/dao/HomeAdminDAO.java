package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.OrderAdmin;
import vn.edu.hcmuaf.fit.entity.Product;
import vn.edu.hcmuaf.fit.entity.ProductAdmin;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class HomeAdminDAO {
    DBConnect dbConnect = new DBConnect();

    public int getCountUser() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT COUNT(`user`.id) FROM `user`";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public int getCountProduct() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT COUNT(product.id) FROM product";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public int getCountOrder() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT COUNT(`order`.id) FROM `order`";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public int getAboutOutOfStock() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT COUNT(product.id) FROM product WHERE product.quantity <= 5 AND product.quantity > 0 ";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public int getOutOfStock() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT COUNT(product.id) FROM product WHERE product.quantity = 0";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public int getBeCanceled() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT COUNT(`order`.id) FROM `order` JOIN order_status on order_status.id = `order`.`status` WHERE `order`.`status` = 4";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getInt(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public List<OrderAdmin> getNewestOrder() {
        List<OrderAdmin> result = new ArrayList<>();
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT * FROM `order` ORDER BY `order`.order_date DESC LIMIT 4";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    OrderAdmin orderAdmin = new OrderAdmin(
                            dbConnect.rs.getInt(1),
                            dbConnect.rs.getString(4),
                            dbConnect.rs.getInt(8),
                            dbConnect.rs.getInt(10));
                    result.add(orderAdmin);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public List<Account> getNewestUser() {
        List<Account> result = new ArrayList<>();
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT * FROM `user` ORDER BY `user`.id DESC LIMIT 4";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    Account account = null;
                    if (dbConnect.rs.getString(4) != null) {
                        account = new Account(
                                dbConnect.rs.getInt(1),
                                dbConnect.rs.getString(5),
                                dbConnect.rs.getString(4),
                                dbConnect.rs.getString(6));
                    } else {
                        account = new Account(
                                dbConnect.rs.getInt(1),
                                dbConnect.rs.getString(5),
                                dbConnect.rs.getString(2),
                                dbConnect.rs.getString(6));
                    }

                    result.add(account);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }

    public long getRevenue() {

        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT SUM(`order`.order_total) FROM `order`";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    return dbConnect.rs.getLong(1);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public List<Product> getTop5() {
        List<Product> result = new ArrayList<>();
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT product.id, product.title,product.thumbnail,product.price,product.discount,  SUM(order_details.total_money)\n" +
                        "FROM product JOIN order_details on product.id = order_details.product_id\n" +
                        "GROUP BY  product.id, product.title,product.thumbnail,product.price,product.discount\n" +
                        "ORDER BY SUM(order_details.total_money) DESC\n" +
                        "LIMIT 5";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);


                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    Product product = new Product(
                            dbConnect.rs.getInt(1),
                            dbConnect.rs.getString(2),
                            dbConnect.rs.getString(6),
                            dbConnect.rs.getString(3),
                            dbConnect.rs.getInt(4),
                            dbConnect.rs.getInt(5));
                    result.add(product);
                }
                dbConnect.ps.close();
                dbConnect.rs.close();
                statement.close();
            }
        } catch (SQLException e) {

        }
        return result;
    }
    public String getNameCategoryWithID(int parent_id) {
        String result = null;
        if (parent_id == 1) {
            result = "Đá quý";
        }
        if (parent_id == 2) {
            result = "Nhẫn";
        }
        if (parent_id == 3) {
            result = "Hoa tai";
        }
        if (parent_id == 4) {
            result = "Dây chuyền";
        }
        if (parent_id == 5) {
            result = "Vòng tay";
        }
        if (parent_id == 6) {
            result = "Mặt dây chuyền";
        }
        if (parent_id == 7) {
            result = "Bộ sưu tập";
        }
        return result;
    }

    public List<ProductAdmin> getListOutOfStock() {

        List<ProductAdmin> listPro = new LinkedList<>();
        String query = "SELECT\n" +
                "\tproduct.id,\n" +
                "\tproduct.category_id,\n" +
                "\tproduct.title,\n" +
                "\tproduct.price,\n" +
                "\tproduct.discount,\n" +
                "\tproduct.description,\n" +
                "\tproduct.thumbnail,\n" +
                "\tproduct.quantity,\n" +
                "\tcategory.parent_id,\n" +
                "\tcategory.`name`,\n" +
                "\tproduct_gem_color.gem_color_id,\n" +
                "\tgem_color.color\n" +
                "FROM\n" +
                "\tproduct\n" +
                "\tJOIN category ON product.category_id = category.id\n" +
                "\tJOIN product_gem_color ON product_gem_color.product_id = product.id\n" +
                "\tJOIN gem_color ON gem_color.id = product_gem_color.gem_color_id\n" +
                "\tWHERE product.quantity = 0\n" +
                "GROUP BY\n" +
                "\tproduct.id,\n" +
                "\tproduct.category_id,\n" +
                "\tproduct.title,\n" +
                "\tproduct.price,\n" +
                "\tproduct.discount,\n" +
                "\tproduct.description,\n" +
                "\tproduct.thumbnail,\n" +
                "\tproduct.quantity,\n" +
                "\tcategory.parent_id,\n" +
                "\tcategory.`name`,\n" +
                "\tproduct_gem_color.gem_color_id,\n" +
                "\tgem_color.color";
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                dbConnect.ps = new DBConnect().getConnection().prepareStatement(query);
                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    ProductAdmin productAdmin = new ProductAdmin(dbConnect.rs.getInt(1),
                            dbConnect.rs.getString(3),
                            dbConnect.rs.getString(7),
                            dbConnect.rs.getInt(8),
                            new ProductAdmin().checkStatus(dbConnect.rs.getInt(8)),
                            dbConnect.rs.getInt(4),
                            getNameCategoryWithID(dbConnect.rs.getInt(9)),
                            dbConnect.rs.getString(10),
                            dbConnect.rs.getString(12),
                            dbConnect.rs.getInt(5)
                    );
                    listPro.add(productAdmin);
                }
                dbConnect.rs.close();
                dbConnect.ps.close();
            }
        } catch (Exception e) {
        }
        return listPro;
    }


}
