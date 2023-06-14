package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.OrderAdmin;
import vn.edu.hcmuaf.fit.entity.ProductAdmin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class OrderDAO {

    public List<ProductAdmin> getListProductInOrder(int idOrder) {
        List<ProductAdmin> list = new LinkedList<>();
        String query = "SELECT\n" +
                "\torder_details.order_id,\n" +
                "\torder_details.product_id,\n" +
                "\tproduct.category_id,\n" +
                "\tproduct.title,\n" +
                "\tproduct.price,\n" +
                "\tproduct.discount,\n" +
                "\tproduct.description,\n" +
                "\tproduct.thumbnail,\n" +
                "\torder_details.quantity \n" +
                "FROM\n" +
                "\torder_details\n" +
                "\tJOIN product ON product.id = order_details.product_id \n" +
                "WHERE\n" +
                "\torder_details.order_id = ? \n" +
                "GROUP BY\n" +
                "\torder_details.order_id,\n" +
                "\torder_details.product_id,\n" +
                "\tproduct.category_id,\n" +
                "\tproduct.title,\n" +
                "\tproduct.price,\n" +
                "\tproduct.discount,\n" +
                "\tproduct.description,\n" +
                "\tproduct.thumbnail,\n" +
                "\torder_details.quantity";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ps.setInt(1, idOrder);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new ProductAdmin(rs.getInt(2), rs.getString(4),
                            rs.getInt(9), rs.getInt(5)));
                }
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<OrderAdmin> getListOrder() {
        List<OrderAdmin> list = new LinkedList<>();
        String query = "SELECT\n" +
                "\t`order`.id,\n" +
                "\t`order`.full_name,\n" +
                "\t`order`.order_total,\n" +
                "\t`order`.shipping_cost,\n" +
                "\torder_status.id,\n" +
                "\torder_status.`status`,\n" +
                "\t`order`.phone_number\n" +
                "FROM\n" +
                "\t`order`\n" +
                "\tJOIN order_details ON `order`.id = order_details.order_id\n" +
                "\tJOIN order_status ON order_status.id = `order`.`status`\n" +
                "GROUP BY\n" +
                "\t`order`.id,\n" +
                "\t`order`.full_name,\n" +
                "\t`order`.order_total,\n" +
                "\t`order`.shipping_cost,\n" +
                "\torder_status.id,\n" +
                "\torder_status.`status`,\n" +
                "\t`order`.phone_number";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                PreparedStatement ps = new DBConnect().getConnection().prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new OrderAdmin(rs.getInt(1), rs.getString(2),
                            getListProductInOrder(rs.getInt(1)),
                            rs.getInt(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getString(6),
                            rs.getString(7)));
                }
            }
        } catch (Exception e) {

        }
        return list;
    }

}
