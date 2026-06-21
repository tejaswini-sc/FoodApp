package com.foodapp.dao;

import java.util.List;

import com.foodapp.model.Restaurant;

public interface RestaurantDAO {

	int addRestaurant(Restaurant r);
	Restaurant getResturant(int resturantId);
	List<Restaurant> getAllResturant();
	int updateResturant(Restaurant r);
	int deleteResturant(int resturantId);	
}
