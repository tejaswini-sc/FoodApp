package com.foodapp.model;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {

	private  Map<Integer,CartItem> items;
	
		public Cart() {
			
			items=new HashMap<Integer,CartItem>();
		}
		public Map<Integer,CartItem> getItems(){
			return items;
		}
		
		//add item
		public void addItem(CartItem cartItem) {
			int menuId = cartItem.getMenuId();
			
			if(items.containsKey(menuId)) {
				CartItem existingItem = items.get(menuId);
				existingItem.setQuantity(existingItem.getQuantity()+1);
			}
			else {
				items.put(menuId, cartItem);
			}
			
		}

		// Update Item
		
		public void updateItem(int menuId,int quantity){
			if(items.containsKey(menuId)) {
				if(quantity<=0) {
					items.remove(menuId);
				}
				else {
					items.get(menuId).setQuantity(quantity);
				}
			}
		}
		
		//remove Item
		
		public void removeItem(int menuId) {
			items.remove(menuId);
		}
		
		// Get All items
		public Collection<CartItem> getCartItems(){
			return items.values();
		}
		
		// Total Price
		 public double getTotalPrice() {

	        double total = 0;

	        for (CartItem item : items.values()) {

	            total += item.getPrice() * item.getQuantity();

	        }

	        return total;

	    }
		 // Total Items
	    public int getTotalItems() {

	        int total = 0;

	        for (CartItem item : items.values()) {

	            total += item.getQuantity();

	        }

	        return total;

	    }

	    // Clear Cart
	    public void clearCart() {

	        items.clear();

	    }		
}