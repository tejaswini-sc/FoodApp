package com.foodapp.test;

import java.sql.Timestamp;

import com.foodapp.dao.OrderTableDAO;
import com.foodapp.daoimpl.CartDAOimp;
import com.foodapp.daoimpl.OrderTabledaoImp;
import com.foodapp.model.Cart;
import com.foodapp.model.OrderTable;

public class Testing {

	public static void main(String[] args) {

		CartDAOimp dao = new CartDAOimp();

		// ---------- INSERT ----------

		Cart cart = new Cart();
		cart.setUserId(3);
		cart.setMenuId(16);
		cart.setMenuId(1);
		int res = dao.addCartItem(cart);

		System.out.println(res);


//		// ---------- GET BY ID ----------
//
//		System.out.println("\nGet By Id");
//
//		System.out.println(dao.getOrderById(1));
//
//
//
//		// ---------- GET ALL ----------
//
//		System.out.println("\nGet All Orders");
//
//		System.out.println(dao.getAllOrder());
//
//
//
//		// ---------- GET BY USER ID ----------
//
//		System.out.println("\nGet Orders By User");
//
//		System.out.println(dao.getOrderByUserId(1));
//
//
//
//		// ---------- UPDATE STATUS ----------
//
//		System.out.println("\nUpdate Status");
//
//		System.out.println(
//				dao.udateOrderStatus(1, "Delivered")
//		);
//
//
//
//		// ---------- DELETE ----------
//
//		System.out.println("\nDelete Order");
//
//		System.out.println(
//				dao.deleteOrder(1)
//		);

	}
}