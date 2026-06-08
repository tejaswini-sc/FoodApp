package com.foodapp.test;

import java.sql.Timestamp;
import java.util.List;

import com.foodapp.dao.OrderTableDAO;
import com.foodapp.daoimpl.OrderTabledaoImp;
import com.foodapp.model.OrderTable;


public class Testing {
	
	public static void main(String[] args) {
//		Connection con = DBConnection.getConnection();
//		System.out.println("Connection created");
//		
	// ADD USER
//		Scanner sc=new Scanner(System.in);
//		System.out.println("enter username");
//		String username=sc.next();
//		System.out.println("enter password");
//		String password=sc.next();
//		System.out.println("enter email");
//		String email=sc.next();
//		System.out.println("enter address");
//		String address=sc.next();
//		System.out.println("enter role");
//		String role=sc.next();
//		
//		User u = new User(username, password, email, address, role);
//		
//		UserDaoImp udao = new UserDaoImp();
//		udao.addUser(u);
//		System.out.println("user added");
		
		//GET USER
//		UserDaoImp udao = new UserDaoImp();
//		User u=udao.getUser(3);
//		System.out.println(u);
		
		// GET ALL USER
//		UserDaoImp udao =new UserDaoImp();
//		List<User> allUser = udao.getAllUser();
//		for(User u:allUser) {
//			System.out.println(u);
//		}
//		UserDaoImp udao =new UserDaoImp();
//		System.out.print("enetr user id");
//		Scanner sc=new Scanner(System.in);
//		int id=sc.nextInt();
//		
//		User u = udao.getUser(id);
//		System.out.println(u);
//		u.setAddress("bgk");
//		udao.updateUser(u);
//		System.out.println(u);
		
//		UserDaoImp udao = new UserDaoImp();
//		System.out.print("enetr user id");
//		Scanner sc=new Scanner(System.in);
//		int id=sc.nextInt();
//		udao.deleteUser(id);
//		System.out.println("delected");
		
		
	//insert order
		
//		OrderTabledaoImp orderDAO = new OrderTabledaoImp();
//		OrderTable order = new OrderTable();
//	        
//		 order.setUserId(1);
//	        order.setResturantId(1);
//	        order.setOrderDate(new Timestamp(System.currentTimeMillis()));
//	        order.setTotalAmount(450.00f);
//	        order.setStatus("Pending");
//	        order.setPaymentMethod("UPI");
//	        orderDAO.addOrder(order);
//	        System.out.println("created successfull");
//		OrderTabledaoImp odao = new OrderTabledaoImp();
//		OrderTable o=odao.getOrderById(1);
//		System.out.println(o);	
		
		OrderTabledaoImp odao = new OrderTabledaoImp();
		List<OrderTable> orders = odao.getAllOrder();

		for(OrderTable o : orders) {

		    System.out.println(
		        o.getOredrId() + " " +
		        o.getUserId() + " " +
		        o.getTotalAmount() + " " +
		        o.getStatus()
		    );
		}
	}
}

