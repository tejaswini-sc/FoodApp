package com.foodapp.dao;

import java.util.List;

import com.foodapp.model.User;

public interface UserDAO {
	
	int addUser(User u);
	void updateUser(User u);
	void deleteUser(int id);
	User getUser(int userid);
	User getUserByEmail(String email);
	
	List<User> getAllUser();
	

}
