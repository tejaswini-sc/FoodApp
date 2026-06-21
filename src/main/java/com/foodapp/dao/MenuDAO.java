package com.foodapp.dao;

import java.util.List;

import com.foodapp.model.Menu;

public interface MenuDAO {

	int addMenu(Menu m);

	Menu getMenu(int menuId);
	
	List<Menu> getMenuByRestaurant(int RestaurantId);

	List<Menu> getAllMenus();

	int updateMenu(Menu m);

	int deleteMenu(int menuId);

}