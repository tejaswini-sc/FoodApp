package com.foodapp.dao;

import java.util.List;

import com.foodapp.model.OrderTable;

public interface OrderTableDAO {
	
	void addOrder(OrderTable order);
	OrderTable getOrderById(int orderId);
	List<OrderTable> getAllOrder();
	List<OrderTable> getOrderByUserId(int UserId);
	boolean udateOrderStatus(int orderId,String status);
	boolean deleteOrder(int orderId);
}
