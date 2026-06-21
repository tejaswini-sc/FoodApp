package com.foodapp.model;

import java.sql.Timestamp;

public class User {
		private int userid;
		private String userName;
		private String password;
		private String email;
		private String address;
		private String role;
		private Timestamp createdDate;
		private Timestamp loginDate;
		
		public User() {
			// TODO Auto-generated constructor stub
		}
		
		public User(String userName, String password, String email, String address, String role) {
			super();
			this.userName = userName;
			this.password = password;
			this.email = email;
			this.address = address;
			this.role = role;
		}
		
		

		public User(int userid, String userName, String password, String email, String address, String role,
				Timestamp createdDate, Timestamp loginDate) {
			super();
			this.userid = userid;
			this.userName = userName;
			this.password = password;
			this.email = email;
			this.address = address;
			this.role = role;
			this.createdDate = createdDate;
			this.loginDate = loginDate;
		}

		/**
		 * @return the userid
		 */
		public int getuserid() {
			return userid;
		}

		/**
		 * @param userid the userid to set
		 */
		public void setuserid(int userid) {
			this.userid = userid;
		}

		/**
		 * @return the userName
		 */
		public String getUserName() {
			return userName;
		}

		/**
		 * @param userName the userName to set
		 */
		public void setUserName(String userName) {
			this.userName = userName;
		}

		/**
		 * @return the password
		 */
		public String getPassword() {
			return password;
		}

		/**
		 * @param password the password to set
		 */
		public void setPassword(String password) {
			this.password = password;
		}


		public String getEmail() {
			return email;
		}


		public void setEmail(String email) {
			this.email = email;
		}

	
		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getRole() {
			return role;
		}

		 
		public void setRole(String role) {
			this.role = role;
		}

		
		public Timestamp getCreatedDate() {
			return createdDate;
		}

	
		public void setCreatedDate(Timestamp createdDate) {
			this.createdDate = createdDate;
		}

		
		public Timestamp getLoginDate() {
			return loginDate;
		}

		
		public void setLoginDate(Timestamp loginDate) {
			this.loginDate = loginDate;
		}

		@Override
		public String toString() {
			return "User [userid=" + userid + ", userName=" + userName + ", password=" + password + ", email=" + email
					+ ", address=" + address + ", role=" + role + ", createdDate=" + createdDate + ", loginDate="
					+ loginDate + "]";
		}
	
		
}
