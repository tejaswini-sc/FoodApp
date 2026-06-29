<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.foodapp.model.OrderTable"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.foodapp.model.User"%>

<%
String ctx = request.getContextPath();
User user = (User) session.getAttribute("user");

if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
    response.sendRedirect(ctx + "/Login.html");
    return;
}

List<OrderTable> orders = (List<OrderTable>) request.getAttribute("orders");
Map<Integer, String> userNames = (Map<Integer, String>) request.getAttribute("userNames");
Map<Integer, String> restaurantNames = (Map<Integer, String>) request.getAttribute("restaurantNames");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Orders</title>
<link rel="stylesheet" href="<%=ctx%>/css/common.css">
<link rel="stylesheet" href="<%=ctx%>/css/admin.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
    href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
    rel="stylesheet">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>

    <nav class="admin-nav">

        <div class="logo">
            <span class="logo-icon">🍃</span> <span>FoodCafe Admin</span>
        </div>

        <ul>
            <li><a href="<%=ctx%>/admin/dashboard">Dashboard</a></li>
            <li><a href="<%=ctx%>/admin/restaurants">Restaurants</a></li>
            <li><a href="<%=ctx%>/admin/menu">Menu</a></li>
            <li><a href="<%=ctx%>/admin/orders" class="active">Orders</a></li>
            <li><a href="<%=ctx%>/admin/restaurantOwners">Restaurant Owners</a></li>
            <li><a href="<%=ctx%>/restaurants">View Site</a></li>
        </ul>

        <div class="nav-icons">
            <span class="admin-user">👋 <%=user.getUserName()%></span>
            <a href="<%=ctx%>/logout" class="icon-btn" title="Logout"> <i
                class="fa-solid fa-right-from-bracket"></i>
            </a>
        </div>

    </nav>

    <section class="admin-header">
        <h1>📋 Manage Orders</h1>
        <p>View and update order status for all customer orders.</p>
    </section>

    <section class="admin-section">

        <div class="admin-table-card">
            <h2>All Orders</h2>

            <%
            if (orders == null || orders.isEmpty()) {
            %>

            <p class="empty-msg">No orders placed yet.</p>

            <%
            } else {
            %>

            <div class="table-wrap">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Restaurant</th>
                            <th>Total Amount</th>
                            <th>Order Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        for (OrderTable order : orders) {
                            String customerName = userNames.getOrDefault(order.getUserId(), "Unknown");
                            String restaurantName = restaurantNames.getOrDefault(order.getResturantId(), "Unknown");
                        %>
                        <tr>
                            <td>#<%=order.getOredrId()%></td>
                            <td><%=customerName%></td>
                            <td><%=restaurantName%></td>
                            <td>₹<%=String.format("%.2f", order.getTotalAmount())%></td>
                            <td><%=order.getOrderDate()%></td>
                            <td>
                                <%
                                String status = order.getStatus();
                                String statusClass = "";
                                if (status != null) {
                                    switch (status.toLowerCase()) {
                                        case "pending":
                                            statusClass = "status-badge inactive";
                                            break;
                                        case "preparing":
                                            statusClass = "status-badge";
                                            break;
                                        case "out for delivery":
                                            statusClass = "status-badge";
                                            break;
                                        case "delivered":
                                            statusClass = "status-badge active";
                                            break;
                                        case "cancelled":
                                            statusClass = "status-badge inactive";
                                            break;
                                        default:
                                            statusClass = "status-badge";
                                    }
                                }
                                %>
                                <span class="<%=statusClass%>"><%=status != null ? status : "Pending"%></span>
                            </td>
                            <td class="action-cell">
                                <form action="<%=ctx%>/admin/orders" method="post" class="inline-form">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="orderId" value="<%=order.getOredrId()%>">
                                    <select name="status" required>
                                        <option value="Pending" <%= "Pending".equalsIgnoreCase(order.getStatus()) ? "selected" : "" %>>Pending</option>
                                        <option value="Preparing" <%= "Preparing".equalsIgnoreCase(order.getStatus()) ? "selected" : "" %>>Preparing</option>
                                        <option value="Out for Delivery" <%= "Out for Delivery".equalsIgnoreCase(order.getStatus()) ? "selected" : "" %>>Out for Delivery</option>
                                        <option value="Delivered" <%= "Delivered".equalsIgnoreCase(order.getStatus()) ? "selected" : "" %>>Delivered</option>
                                        <option value="Cancelled" <%= "Cancelled".equalsIgnoreCase(order.getStatus()) ? "selected" : "" %>>Cancelled</option>
                                    </select>
                                    <button type="submit" class="action-btn edit">Update</button>
                                </form>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>

            <%
            }
            %>

        </div>

    </section>

</body>
</html>
