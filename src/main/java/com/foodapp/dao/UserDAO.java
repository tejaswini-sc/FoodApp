package com.foodapp.dao;

import java.util.List;

import com.foodapp.model.User;

public interface UserDAO {
	
	void addUser(User u);
	void updateUser(User u);
	void deleteUser(int id);
	User getUser(int id);
	List<User> getAllUser();
	

}
