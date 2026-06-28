package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.MenuDAO;
import com.foodapp.model.Menu;
import com.foodapp.utility.DBConnection;

public class MenuDAOimp implements MenuDAO {

	private static final String Insert_Query = "Insert into menu(RestaurantId,ItemName,Description,Price,IsAvailable,Category,image_path,food_type,rating) values(?,?,?,?,?,?,?,?,?)";
	private static final String Select_By_Id = "Select * from menu where MenuId=?";
	private static final String select_All_Query = "Select * from Menu";
	private static final String Update_Query = "Update Menu set RestaurantId=?,ItemName=?,Description=?,Price=?,IsAvailable=?,Category=?,image_path=?,food_type=?,rating=? where menuId=?";
	private static final String Delete_Query = "Delete from menu where menuId=?";
	private static final String Select_By_RestauranyId = "Select * from menu where RestaurantId=?";
	Connection con=DBConnection.getConnection();
	
	
	@Override
	public int addMenu(Menu m) {
		int i=0;
		try {
			PreparedStatement pstmt = con.prepareStatement(Insert_Query);
			pstmt.setInt(1, m.getRestaurantId());
			pstmt.setString(2, m.getItemName());
			pstmt.setString(3, m.getDescription());
			pstmt.setDouble(4, m.getPrice());
			pstmt.setBoolean(5, m.isAvailable());
			pstmt.setString(6, m.getCategory());
			pstmt.setString(7, m.getImagePath());
			pstmt.setString(8, m.getFoodType());
			pstmt.setFloat(9, m.getRating());
			i = pstmt.executeUpdate();
			System.out.println(i);		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public Menu getMenu(int menuId) {
		
		Menu m=null;
		try {
			PreparedStatement pstmt = con.prepareStatement(Select_By_Id);
			pstmt.setInt(1, menuId);
			ResultSet res = pstmt.executeQuery();
			m=printres(res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return m;			
	}
	
	@Override
	public List<Menu> getMenuByRestaurant(int restaurantId) {

		ArrayList<Menu> list = new ArrayList<>();

		try {

			PreparedStatement pstmt =
					con.prepareStatement(Select_By_RestauranyId);

			pstmt.setInt(1, restaurantId);

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {

				Menu m = new Menu(

						res.getInt("MenuId"),

						res.getInt("RestaurantId"),

						res.getString("ItemName"),

						res.getString("Description"),

						res.getDouble("Price"),

						res.getBoolean("IsAvailable"),

						res.getString("Category"),
						
						res.getString("image_path"),

						res.getTimestamp("CreatedAt"),

						res.getTimestamp("UpdatedAt"),

						res.getTimestamp("DeletedAt"),
						
						res.getString("food_type"),
						
						res.getFloat("rating")

				);

				list.add(m);

			}

		}
		catch(SQLException e) {

			e.printStackTrace();

		}

		return list;
	}

	@Override
	public List<Menu> getAllMenus() {
		
		ArrayList<Menu> list=new ArrayList<>();
		try {
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(select_All_Query);
			  while(res.next()) {

		            Menu m = new Menu(
		                    res.getInt("MenuId"),
		                    res.getInt("RestaurantId"),
		                    res.getString("ItemName"),
		                    res.getString("Description"),
		                    res.getDouble("Price"),
		                    res.getBoolean("IsAvailable"),
		                    res.getString("Category"),
		                    res.getString("image_path"),
		                    res.getTimestamp("CreatedAt"),
		                    res.getTimestamp("UpdatedAt"),
		                    res.getTimestamp("DeletedAt"),
		                    res.getString("food_type"),
		                    res.getFloat("rating")
		                    
		            );

		            list.add(m);
		        }		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int updateMenu(Menu m) {
		int i = 0;
		try {
			PreparedStatement pstmt = con.prepareStatement(Update_Query);
			pstmt.setInt(1, m.getRestaurantId());
			pstmt.setString(2, m.getItemName());
			pstmt.setString(3, m.getDescription());
			pstmt.setDouble(4, m.getPrice());
			pstmt.setBoolean(5, m.isAvailable());
			pstmt.setString(6, m.getCategory());
			pstmt.setString(7, m.getImagePath());
			pstmt.setString(8, m.getFoodType());
			pstmt.setFloat(9, m.getRating());
			pstmt.setInt(10, m.getMenuId());
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public int deleteMenu(int menuId) {
		int i=0;
		try {
			PreparedStatement pstmt = con.prepareStatement(Delete_Query);
			pstmt.setInt(1, menuId);
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	
	private Menu printres(ResultSet res) throws SQLException {
		Menu m=null;
		while(res.next()) {
			
			int MenuId = res.getInt("MenuId");
			int RestId = res.getInt("RestaurantId");
			String ItemName = res.getString("ItemName");
			String Desc = res.getString("Description");
			double price = res.getDouble("Price");
			boolean isAvail = res.getBoolean("IsAvailable");
			String Category = res.getString("Category");
			String imagePath = res.getString("image_path");
			Timestamp createdAt = res.getTimestamp("CreatedAt");
			Timestamp UpdatedAt = res.getTimestamp("UpdatedAt");
			Timestamp deletedAt = res.getTimestamp("DeletedAt");
			String foodType=res.getString("food_type");
			float rating=res.getFloat("rating");
			
			m=new Menu(MenuId,RestId,ItemName,Desc,price,isAvail,Category,imagePath,createdAt,UpdatedAt,deletedAt,foodType,rating);
		}
		return m;

	}


}
