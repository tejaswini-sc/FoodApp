package com.foodapp.model;

import java.sql.Timestamp;

public class Cart {

	private int cartId;

	private int userId;

	private int menuId;

	private int quantity;

	private Timestamp addedDate;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(int cartId, int userId, int menuId, int quantity, Timestamp addedDate) {
		super();
		this.cartId = cartId;
		this.userId = userId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.addedDate = addedDate;
	}

	/**
	 * @return the cartId
	 */
	public int getCartId() {
		return cartId;
	}

	/**
	 * @param cartId the cartId to set
	 */
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * @return the menuId
	 */
	public int getMenuId() {
		return menuId;
	}

	/**
	 * @param menuId the menuId to set
	 */
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return the addedDate
	 */
	public Timestamp getAddedDate() {
		return addedDate;
	}

	/**
	 * @param addedDate the addedDate to set
	 */
	public void setAddedDate(Timestamp addedDate) {
		this.addedDate = addedDate;
	}

	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", userId=" + userId + ", menuId=" + menuId + ", quantity=" + quantity
				+ ", addedDate=" + addedDate + "]";
	}
	
	
	
}
