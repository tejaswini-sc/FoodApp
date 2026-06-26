package com.foodapp.dao;

import java.util.List;

import com.foodapp.model.OrderItem;

public interface OrderItemDAO {

    int addOrderItem(OrderItem orderItem);

    List<OrderItem> getOrderItemsByOrderId(int orderId);

}