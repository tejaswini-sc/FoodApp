package com.foodapp.model;

public class Restaurant {
	
	private int ResturantID;
	private String Name;
	private String CuisineType;
	private int DeliveryTime;
	private String Address;
	private int AdminUserId;
	private double Rating;
	private boolean isActive;
	private String imagePath;
	
	public Restaurant() {
		// TODO Auto-generated constructor stub
	}

	public Restaurant(int resturantID, String name, String cuisineType, int deliveryTime, String address,
			int adminUserId, float rating, boolean isActive, String imagePath) {
		super();
		ResturantID = resturantID;
		Name = name;
		CuisineType = cuisineType;
		DeliveryTime = deliveryTime;
		Address = address;
		AdminUserId = adminUserId;
		Rating = rating;
		this.isActive = isActive;
		this.imagePath = imagePath;
	}

	/**
	 * @return the resturantID
	 */
	public int getResturantID() {
		return ResturantID;
	}

	/**
	 * @param resturantID the resturantID to set
	 */
	public void setResturantID(int resturantID) {
		ResturantID = resturantID;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return Name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		Name = name;
	}

	/**
	 * @return the cuisineType
	 */
	public String getCuisineType() {
		return CuisineType;
	}

	/**
	 * @param cuisineType the cuisineType to set
	 */
	public void setCuisineType(String cuisineType) {
		CuisineType = cuisineType;
	}

	/**
	 * @return the deliveryTime
	 */
	public int getDeliveryTime() {
		return DeliveryTime;
	}

	/**
	 * @param deliveryTime the deliveryTime to set
	 */
	public void setDeliveryTime(int deliveryTime) {
		DeliveryTime = deliveryTime;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return Address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		Address = address;
	}

	/**
	 * @return the adminUserId
	 */
	public int getAdminUserId() {
		return AdminUserId;
	}

	/**
	 * @param adminUserId the adminUserId to set
	 */
	public void setAdminUserId(int adminUserId) {
		AdminUserId = adminUserId;
	}

	/**
	 * @return the rating
	 */
	public double getRating() {
		return Rating;
	}

	/**
	 * @param d the rating to set
	 */
	public void setRating(double d) {
		Rating = d;
	}

	/**
	 * @return the isActive
	 */
	public boolean isActive() {
		return isActive;
	}

	/**
	 * @param isActive the isActive to set
	 */
	public void setActive(boolean isActive) {
		this.isActive = isActive;
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

	@Override
	public String toString() {
		return "Resturant [ResturantID=" + ResturantID + ", Name=" + Name + ", CuisineType=" + CuisineType
				+ ", DeliveryTime=" + DeliveryTime + ", Address=" + Address + ", AdminUserId=" + AdminUserId
				+ ", Rating=" + Rating + ", isActive=" + isActive + ", imagePath=" + imagePath + "]";
	}

}
