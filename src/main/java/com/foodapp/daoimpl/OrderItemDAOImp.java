package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.OrderItemDAO;
import com.foodapp.model.OrderItem;
import com.foodapp.utility.DBConnection;

public class OrderItemDAOImp implements OrderItemDAO {

    private static final String INSERT_QUERY =
            "INSERT INTO OrderItem(OrderId,MenuId,Quantity,ItemTotal) VALUES(?,?,?,?)";

    private static final String SELECT_BY_ORDERID =
            "SELECT * FROM OrderItem WHERE OrderId=?";

    Connection con = DBConnection.getConnection();

    @Override
    public int addOrderItem(OrderItem item) {

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(INSERT_QUERY);

            pstmt.setInt(1, item.getOrderId());

            pstmt.setInt(2, item.getMenuId());

            pstmt.setInt(3, item.getQuantity());

            pstmt.setDouble(4, item.getItemTotal());

            return pstmt.executeUpdate();

        }
        catch(SQLException e) {

            e.printStackTrace();

        }

        return 0;
    }

    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        ArrayList<OrderItem> list =
                new ArrayList<>();

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(SELECT_BY_ORDERID);

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {

                OrderItem item =
                        new OrderItem(

                        rs.getInt("OrderItemId"),

                        rs.getInt("OrderId"),

                        rs.getInt("MenuId"),

                        rs.getInt("Quantity"),

                        rs.getDouble("ItemTotal")

                );

                list.add(item);

            }

        }
        catch(SQLException e) {

            e.printStackTrace();

        }

        return list;
    }

}