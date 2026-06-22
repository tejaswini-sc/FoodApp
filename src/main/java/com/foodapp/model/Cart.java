package com.foodapp.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

	Map<Integer,CartItem> items;
	
		public Cart() {
			
			items=new HashMap<Integer,CartItem>();
		}
		public Map<Integer,CartItem> getItems(){
			return items;
		}

}