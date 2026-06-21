package com.foodapp.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.RestaurantDAO;
import com.foodapp.model.Restaurant;
import com.foodapp.utility.DBConnection;

public class RestaurantDAOImp implements RestaurantDAO {


    private static final String INSERT =
            "INSERT INTO restaurant(name,cuisinetype,deliverytime,address,adminuserid,rating,isactive,image_path) VALUES(?,?,?,?,?,?,?,?)";

    private static final String GET_ONE =
            "SELECT * FROM restaurant WHERE restaurant_id=?";

    private static final String GET_ALL =
            "SELECT * FROM restaurant";

    private static final String UPDATE =
            "UPDATE restaurant SET name=?,cuisine_type=?,delivery_time=?,address=?,admin_user_id=?,rating=?,is_active=?,image_path=? WHERE restaurant_id=?";

    private static final String DELETE =
            "DELETE FROM restaurant WHERE restaurant_id=?";

//
//    public RestaurantDAOImp() {
//
//        con = DBConnection.getConnection();
//
//    }
    Connection con = DBConnection.getConnection();


    @Override
    public int addRestaurant(Restaurant r) {

        try {

            PreparedStatement ps = con.prepareStatement(INSERT);

            ps.setString(1, r.getName());
            ps.setString(2, r.getCuisineType());
            ps.setInt(3, r.getDeliveryTime());
            ps.setString(4, r.getAddress());
            ps.setInt(5, r.getAdminUserId());
            ps.setDouble(6, r.getRating());
            ps.setBoolean(7, r.isActive());
            ps.setString(8, r.getImagePath());

            return ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return 0;
    }



    @Override
    public Restaurant getResturant(int resturantId) {

        Restaurant r = null;

        try {

            PreparedStatement ps = con.prepareStatement(GET_ONE);

            ps.setInt(1, resturantId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                r = new Restaurant();

                r.setResturantID(rs.getInt("restaurant_id"));
                r.setName(rs.getString("name"));
                r.setCuisineType(rs.getString("cuisine_type"));
                r.setDeliveryTime(rs.getInt("delivery_time"));
                r.setAddress(rs.getString("address"));
                r.setAdminUserId(rs.getInt("admin_user_id"));
                r.setRating(rs.getDouble("rating"));
                r.setActive(rs.getBoolean("is_active"));
                r.setImagePath(rs.getString("image_path"));

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return r;
    }



    @Override
    public List<Restaurant> getAllResturant() {

        List<Restaurant> list = new ArrayList<>();

        try {

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(GET_ALL);

            while (rs.next()) {

                Restaurant r = new Restaurant();

                r.setResturantID(rs.getInt("RestaurantId"));
                r.setName(rs.getString("name"));
                r.setCuisineType(rs.getString("cuisinetype"));
                r.setDeliveryTime(rs.getInt("deliverytime"));
                r.setAddress(rs.getString("address"));
                r.setAdminUserId(rs.getInt("adminuserid"));
                r.setRating(rs.getDouble("rating"));
                r.setActive(rs.getBoolean("isactive"));
                r.setImagePath(rs.getString("image_path"));

                list.add(r);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return list;
    }



    @Override
    public int updateResturant(Restaurant r) {

        try {

            PreparedStatement ps = con.prepareStatement(UPDATE);

            ps.setString(1, r.getName());
            ps.setString(2, r.getCuisineType());
            ps.setInt(3, r.getDeliveryTime());
            ps.setString(4, r.getAddress());
            ps.setInt(5, r.getAdminUserId());
            ps.setDouble(6, r.getRating());
            ps.setBoolean(7, r.isActive());
            ps.setString(8, r.getImagePath());

            ps.setInt(9, r.getResturantID());

            return ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return 0;
    }



    @Override
    public int deleteResturant(int resturantId) {

        try {

            PreparedStatement ps = con.prepareStatement(DELETE);

            ps.setInt(1, resturantId);

            return ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return 0;
    }

}