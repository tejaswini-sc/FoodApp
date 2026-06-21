package com.foodapp.dao;

import java.util.List;

import com.foodapp.model.Cart;

public interface CartDAO {

	int addCartItem(Cart c);

	List<Cart> getCartByUserId(int userId);

	int updateQuantity(int cartId,int quantity);

	int deleteCartItem(int cartId);

	int clearCart(int userId);

}
