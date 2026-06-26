package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.OrderTableDAO;
import com.foodapp.model.OrderTable;
import com.foodapp.utility.DBConnection;

public class OrderTabledaoImp implements OrderTableDAO {

	private static final String Insert_Query = "insert into OrderTable(UserID,RestaurantID,OrderDate,TotalAmount,Status,PaymentMethod)values(?,?,?,?,?,?);";
	private static final String Select_Oid_Query = "Select * from OrderTable where OrderId=?";
	private static final String Selct_all_Query = "Select * from OrderTable";
	private static final String Select_Uid_Query = "Select * from OrderTable where UserId=?";
	private static final String Upadate_Status_Query = "Update OrderTable set Status=? where orderId=?";
	private static final String Delete_Query = "Delete from OrderTable where OrderId=?";
	Connection con = DBConnection.getConnection();

	@Override
	public int addOrder(OrderTable o) {

		try {

			PreparedStatement pstmt = con.prepareStatement(Insert_Query, Statement.RETURN_GENERATED_KEYS);

			pstmt.setInt(1, o.getUserId());
			pstmt.setInt(2, o.getResturantId());
			pstmt.setTimestamp(3, o.getOrderDate());
			pstmt.setFloat(4, o.getTotalAmount());
			pstmt.setString(5, o.getStatus());
			pstmt.setString(6, o.getPaymentMethod());

			int rows = pstmt.executeUpdate();

			if (rows > 0) {

				ResultSet rs = pstmt.getGeneratedKeys();

				if (rs.next()) {

					return rs.getInt(1);

				}
			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return 0;
	}

	@Override
	public OrderTable getOrderById(int orderId) {
		OrderTable o = null;
		try {
			PreparedStatement pstmt = con.prepareStatement(Select_Oid_Query);
			pstmt.setInt(1, orderId);
			ResultSet res = pstmt.executeQuery();
			o = printres(res);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return o;
	}

	@Override
	public List<OrderTable> getAllOrder() {

		ArrayList<OrderTable> l = new ArrayList<>();

		try {

			Statement stmt = con.createStatement();

			ResultSet res = stmt.executeQuery(Selct_all_Query);

			while (res.next()) {

				OrderTable o = new OrderTable(

						res.getInt("OrderId"),

						res.getInt("UserId"),

						res.getInt("RestaurantId"),

						res.getTimestamp("OrderDate"),

						res.getFloat("TotalAmount"),

						res.getString("Status"),

						res.getString("PaymentMethod")

				);

				l.add(o);

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return l;
	}

	@Override
	public List<OrderTable> getOrderByUserId(int UserId) {
		ArrayList<OrderTable> l = new ArrayList<OrderTable>();

		try {
			PreparedStatement pstmt = con.prepareStatement(Select_Uid_Query);
			pstmt.setInt(1, UserId);
			ResultSet res = pstmt.executeQuery();
			while (res.next()) {

				OrderTable o = new OrderTable(

						res.getInt("OrderId"),

						res.getInt("UserId"),

						res.getInt("RestaurantId"),

						res.getTimestamp("OrderDate"),

						res.getFloat("TotalAmount"),

						res.getString("Status"),

						res.getString("PaymentMethod")

				);

				l.add(o);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public boolean udateOrderStatus(int orderId, String status) {
		int i = 0;
		try {
			PreparedStatement pstmt = con.prepareStatement(Upadate_Status_Query);
			pstmt.setString(1, status);
			pstmt.setInt(2, orderId);
			i = pstmt.executeUpdate();
			return i > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteOrder(int orderId) {
		try {
			PreparedStatement pstmt = con.prepareStatement(Delete_Query);
			pstmt.setInt(1, orderId);
			int i = pstmt.executeUpdate();
			return i > 0;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

	private OrderTable printres(ResultSet res) throws SQLException {
		OrderTable o = null;
		while (res.next()) {
			int OrderId = res.getInt("OrderId");
			int UserId = res.getInt("UserId");
			int resId = res.getInt("RestaurantId");
			Timestamp orderDate = res.getTimestamp("OrderDate");
			float totalamt = res.getFloat("TotalAmount");
			String status = res.getString("Status");
			String payment = res.getString("PaymentMethod");
			o = new OrderTable(OrderId, UserId, resId, orderDate, totalamt, status, payment);
		}
		return o;

	}
}
