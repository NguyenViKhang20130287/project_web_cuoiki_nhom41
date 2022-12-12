package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.entity.Gallery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class GalleryDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Gallery> getGallery(int product_id) {
        List<Gallery> galleryList = new ArrayList<>();
        String query = "SELECT * FROM gallery where product_id = " + product_id + "";
        Statement statement = DBConnect.getInstall().get();
        try {
            if (statement != null) {
                rs = statement.executeQuery(query);
                while (rs.next()) {
                    Gallery gallery = new Gallery();
                    gallery.setId(rs.getInt(1));
                    gallery.setProduct_id(rs.getInt(2));
                    gallery.setThumbnail(rs.getString(3));
                    galleryList.add(gallery);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return galleryList;
    }
}
