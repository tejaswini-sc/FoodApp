package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.CartDAO;
import com.foodapp.model.Cart;
import com.foodapp.utility.DBConnection;

public class CartDAOimp implements CartDAO {
	
    private static final String Insert_Query = "insert into Cart(UserId,MenuId,Quantity) values(?,?,?);";
	private static final String Select_All_Query = null;
	Connection con = DBConnection.getConnection();

	@Override
	public int addCartItem(Cart c) {
		
		try {
			PreparedStatement pstmt = con.prepareStatement(Insert_Query);
			pstmt.setInt(1, c.getUserId());
			pstmt.setInt(2, c.getMenuId());
			pstmt.setInt(3, c.getQuantity());
			int i = pstmt.executeUpdate();
			return i;		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}

	@Override
	public List<Cart> getCartByUserId(int userId) {
		ArrayList<Cart> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement(Select_All_Query);
			pstmt.setInt(1, userId);
			ResultSet res = pstmt.executeQuery();
			while(res.next()){
				Cart c=new Cart(
						res.getInt("CartId"),
						res.getInt("UserId"),
						res.getInt("MenuId"),
						res.getInt("Quantity"),
						res.getTimestamp("AddedDate")
						);
				list.add(c);
				
				}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	private void print(ResultSet res) throws SQLException {
		Cart c=null;
		while(res.next()) {
			int cartid = res.getInt("CartId");
			int userid = res.getInt("UserId");
			int menuid = res.getInt("MenuId");
			int quantity = res.getInt("Quantity");
			Timestamp AddedDate = res.getTimestamp("AddedDate");
		}
	}

	@Override
	public int updateQuantity(int cartId, int quantity) {
		
	}

	@Override
	public int deleteCartItem(int cartId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int clearCart(int userId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
