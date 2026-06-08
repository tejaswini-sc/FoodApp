package com.foodapp.model;

import java.sql.Timestamp;

public class OrderTable {
	private int OredrId;
	private int UserId;
	private int ResturantId;
	private Timestamp OrderDate;
	private float TotalAmount;
	private String Status;
	private String PaymentMethod;
	
	public OrderTable() {
		// TODO Auto-generated constructor stub
	}

	public OrderTable(int oredrId,int userId, int resturantId, Timestamp orderDate, float totalAmount, String status,
			String paymentMethod) {
		super();
		OredrId = oredrId;
		UserId=userId;
		ResturantId = resturantId;
		OrderDate = orderDate;
		TotalAmount = totalAmount;
		Status = status;
		PaymentMethod = paymentMethod;
	}

	/**
	 * @return the oredrId
	 */
	public int getOredrId() {
		return OredrId;
	}

	/**
	 * @param oredrId the oredrId to set
	 */
	public void setOredrId(int oredrId) {
		OredrId = oredrId;
	}
	
	/**
	 * @return the userId
	 */
	public int getUserId() {
		return UserId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		UserId = userId;
	}

	/**
	 * @return the resturantId
	 */
	public int getResturantId() {
		return ResturantId;
	}

	/**
	 * @param resturantId the resturantId to set
	 */
	public void setResturantId(int resturantId) {
		ResturantId = resturantId;
	}

	/**
	 * @return the orderDate
	 */
	public Timestamp getOrderDate() {
		return OrderDate;
	}

	/**
	 * @param orderDate the orderDate to set
	 */
	public void setOrderDate(Timestamp orderDate) {
		OrderDate = orderDate;
	}

	/**
	 * @return the totalAmount
	 */
	public float getTotalAmount() {
		return TotalAmount;
	}

	/**
	 * @param totalAmount the totalAmount to set
	 */
	public void setTotalAmount(float totalAmount) {
		TotalAmount = totalAmount;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return Status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		Status = status;
	}

	/**
	 * @return the paymentMethod
	 */
	public String getPaymentMethod() {
		return PaymentMethod;
	}

	/**
	 * @param paymentMethod the paymentMethod to set
	 */
	public void setPaymentMethod(String paymentMethod) {
		PaymentMethod = paymentMethod;
	}

	@Override
	public String toString() {
		return "OrderTable [OredrId=" + OredrId + ", UserId=" + UserId + ", ResturantId=" + ResturantId + ", OrderDate="
				+ OrderDate + ", TotalAmount=" + TotalAmount + ", Status=" + Status + ", PaymentMethod=" + PaymentMethod
				+ "]";
	}

	
}
