package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.CartItem;
import vn.edu.hcmuaf.fit.entity.Product;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CartDao {
    DBConnect dbConnect = new DBConnect();
    CategoryDAO categoryDAO = new CategoryDAO();

    public Product getProductById(String id) {
        Product product = new Product();
        try {
            Statement statement = dbConnect.getInstall().get();
            if (statement != null) {
                String query = "SELECT * FROM product WHERE product.id = ?;";
                dbConnect.ps = dbConnect.connection.prepareStatement(query);
                dbConnect.ps.setString(1, id);
                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    product.setId(dbConnect.rs.getInt(1));
                    product.setCategory(categoryDAO.getCategory(dbConnect.rs.getInt(2)));
                    product.setTitle(dbConnect.rs.getString(3));
                    product.setKeyword(dbConnect.rs.getString(4));
                    product.setPrice(dbConnect.rs.getInt(5));
                    product.setDiscount(dbConnect.rs.getInt(6));
                    product.setDesign(dbConnect.rs.getString(7));
                    product.setThumbnail(dbConnect.rs.getString(8));
                    product.setDescription(dbConnect.rs.getString(9));
                    product.setQuantity(dbConnect.rs.getInt(10));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }

    public String checkQuantity(String id) {
        String result = "";
        Product p = getProductById(id);
        if (p.getQuantity() > 0) {
            result = "";

        } else {
            result = "disabled";
        }
        return result;
    }

    public boolean checkQuantityInput(int quantity, String id) {
        boolean result = true;
        Product p = getProductById(id);
        if (quantity > p.getQuantity() || quantity < 1) {
            result = false;
        }
        return result;
    }


    public void addCartItem(CartItem cartItem) {
        String query = "INSERT INTO cart_items (product_id, quantity, user_id) VALUES (?, ?, ?)";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                dbConnect.ps = dbConnect.connection.prepareStatement(query);
                dbConnect.ps.setInt(1, cartItem.getProduct().getId());
                dbConnect.ps.setInt(2, cartItem.getQuantity());
                dbConnect.ps.setInt(3, cartItem.getAccount().getId());
                dbConnect.ps.executeUpdate();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateCartItem(CartItem cartItem) {
        String query = "UPDATE cart_items SET quantity = ? WHERE product_id = ? AND user_id = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                dbConnect.ps = dbConnect.connection.prepareStatement(query);
                dbConnect.ps.setInt(1, cartItem.getQuantity());
                dbConnect.ps.setInt(2, cartItem.getProduct().getId());
                dbConnect.ps.setInt(3, cartItem.getAccount().getId());
                dbConnect.ps.executeUpdate();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteCartItem(int product_id, int user_id) {
        String query = "DELETE FROM cart_items WHERE product_id = ? AND user_id = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                dbConnect.ps = dbConnect.connection.prepareStatement(query);
                dbConnect.ps.setInt(1, product_id);
                dbConnect.ps.setInt(2, user_id);
                dbConnect.ps.executeUpdate();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void deleteAllCartItem(int user_id) {
        String query = "DELETE FROM cart_items WHERE user_id = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                dbConnect.ps = dbConnect.connection.prepareStatement(query);
                dbConnect.ps.setInt(1, user_id);
                dbConnect.ps.executeUpdate();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<CartItem> getListCartItem(int user_id) {
        List<CartItem> list = new ArrayList<>();
        String query = "SELECT* FROM cart_items WHERE user_id = ?";
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                dbConnect.ps = dbConnect.connection.prepareStatement(query);
                dbConnect.ps.setInt(1, user_id);
                dbConnect.rs = dbConnect.ps.executeQuery();
                while (dbConnect.rs.next()) {
                    CartItem cartItem = new CartItem();
                    cartItem.setProduct(new ProductDAO().getProduct(dbConnect.rs.getInt(2)));
                    cartItem.setQuantity(dbConnect.rs.getInt(3));
                    cartItem.setAccount(new LoginDAO().getAccount(dbConnect.rs.getInt(4)));
                    list.add(cartItem);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }


}
