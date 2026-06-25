package com.foodapp.model;

import java.sql.Timestamp;

public class Menu {

	private int menuId;
	private int restaurantId;
	private String itemName;
	private String description;
	private double price;
	private boolean isAvailable;
	private String category;
	private String imagePath;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private Timestamp deletedAt;
	private String foodType;
	private float rating;
	

	public Menu() {}

	public Menu(int menuId, int restaurantId, String itemName,
			String description, double price,
			boolean isAvailable, String category,String imagePath,
			Timestamp createdAt, Timestamp updatedAt,
			Timestamp deletedAt, String foodType,float rating) {

		this.menuId = menuId;
		this.restaurantId = restaurantId;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.category = category;
		this.imagePath=imagePath;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.deletedAt = deletedAt;
		this.foodType= foodType;
		this.rating=rating;
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
	 * @return the restaurantId
	 */
	
	
	public int getRestaurantId() {
		return restaurantId;
	}

	/**
	 * @param restaurantId the restaurantId to set
	 */
	
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	/**
	 * @return the itemName
	 */
	
	public String getItemName() {
		return itemName;
	}

	/**
	 * @param itemName the itemName to set
	 */
	
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	/**
	 * @return the description
	 */
	
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the price
	 */
	
	public double getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	
	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * @return the isAvailable
	 */
	
	public boolean isAvailable() {
		return isAvailable;
	}

	/**
	 * @param isAvailable the isAvailable to set
	 */
	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}

	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}

		
	/**
	 * @return the imagePath
	 */
	public String getImagePath() {
		return imagePath;
	}

	/**
	 * @param imagePath the imagePath to set
	 */
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	/**
	 * @return the createdAt
	 */
	public Timestamp getCreatedAt() {
		return createdAt;
	}

	/**
	 * @param createdAt the createdAt to set
	 */
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	/**
	 * @return the updatedAt
	 */
	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	/**
	 * @param updatedAt the updatedAt to set
	 */
	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	/**
	 * @return the deletedAt
	 */
	public Timestamp getDeletedAt() {
		return deletedAt;
	}

	/**
	 * @param deletedAt the deletedAt to set
	 */
	public void setDeletedAt(Timestamp deletedAt) {
		this.deletedAt = deletedAt;
	}
	
	public String getFoodType() {
	    return foodType;
	}

	public void setFoodType(String foodType) {
	    this.foodType = foodType;
	}

	public float getRating() {
	    return rating;
	}

	public void setRating(float rating) {
	    this.rating = rating;
	}

	@Override
	public String toString() {
		return "Menu [menuId=" + menuId
				+ ", restaurantId=" + restaurantId
				+ ", itemName=" + itemName
				+ ", description=" + description
				+ ", price=" + price
				+ ", isAvailable=" + isAvailable
				+ ", category=" + category + "]";
	}
}