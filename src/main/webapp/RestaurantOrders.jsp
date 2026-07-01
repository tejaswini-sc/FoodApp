<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.foodapp.model.OrderTable"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.foodapp.model.Restaurant"%>
<%@ page import="com.foodapp.model.User"%>

<%
String ctx = request.getContextPath();
User user = (User) session.getAttribute("user");

if (user == null || !"owner".equalsIgnoreCase(user.getRole())) {
    response.sendRedirect(ctx + "/Login.html");
    return;
}

Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
List<OrderTable> orders = (List<OrderTable>) request.getAttribute("orders");
Map<Integer, String> userNames = (Map<Integer, String>) request.getAttribute("userNames");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>
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
            <span class="logo-icon">🍃</span> <span>FoodCafe Owner</span>
        </div>

        <ul>
            <li><a href="<%=ctx%>/restaurant/dashboard">Dashboard</a></li>
            <li><a href="<%=ctx%>/restaurant/profile">My Restaurant</a></li>
            <li><a href="<%=ctx%>/restaurant/menu">My Menu</a></li>
            <li><a href="<%=ctx%>/restaurant/orders" class="active">My Orders</a></li>
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
        <h1>📋 My Orders</h1>
        <p>View and manage orders for your restaurant.</p>
    </section>

    <%
    if (restaurant == null) {
    %>

    <section class="admin-section">
        <div class="admin-table-card" style="text-align: center; padding: 60px 30px;">
            <div style="font-size: 64px; margin-bottom: 20px;">🏪</div>
            <h2 style="margin-bottom: 12px;">No Restaurant Assigned</h2>
            <p style="color: #777; font-size: 16px; max-width: 500px; margin: 0 auto;">
                No restaurant has been assigned to your account yet.
                Please contact the administrator.
            </p>
        </div>
    </section>

    <%
    } else {
    %>

    <section class="admin-section">

        <div class="admin-table-card">
            <h2>Orders — <%=restaurant.getName()%></h2>

            <%
            if (orders == null || orders.isEmpty()) {
            %>

            <p class="empty-msg">No orders for your restaurant yet.</p>

            <%
            } else {
            %>

            <div class="table-wrap">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Total Amount</th>
                            <th>Order Date</th>
                            <th>Payment</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        for (OrderTable order : orders) {
                            String customerName = userNames != null ? userNames.getOrDefault(order.getUserId(), "Unknown") : "Unknown";
                            String status = order.getStatus();
                            String statusClass = "";
                            boolean canUpdate = false;

                            if (status != null) {
                                switch (status.toLowerCase()) {
                                    case "pending":
                                        statusClass = "status-badge inactive";
                                        canUpdate = true;
                                        break;
                                    case "preparing":
                                        statusClass = "status-badge";
                                        canUpdate = true;
                                        break;
                                    case "ready for pickup":
                                        statusClass = "status-badge active";
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
                        <tr>
                            <td>#<%=order.getOredrId()%></td>
                            <td><%=customerName%></td>
                            <td>₹<%=String.format("%.2f", order.getTotalAmount())%></td>
                            <td><%=order.getOrderDate()%></td>
                            <td><%=order.getPaymentMethod() != null ? order.getPaymentMethod() : "—"%></td>
                            <td>
                                <span class="<%=statusClass%>"><%=status != null ? status : "Pending"%></span>
                            </td>
                            <td class="action-cell">
                                <%
                                if (canUpdate) {
                                %>
                                <form action="<%=ctx%>/restaurant/orders" method="post" class="inline-form">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="orderId" value="<%=order.getOredrId()%>">
                                    <select name="status" required>
                                        <%
                                        if ("Pending".equalsIgnoreCase(status)) {
                                        %>
                                        <option value="Preparing">Preparing</option>
                                        <option value="Ready for Pickup">Ready for Pickup</option>
                                        <%
                                        } else if ("Preparing".equalsIgnoreCase(status)) {
                                        %>
                                        <option value="Ready for Pickup">Ready for Pickup</option>
                                        <%
                                        }
                                        %>
                                    </select>
                                    <button type="submit" class="action-btn edit">Update</button>
                                </form>
                                <%
                                } else {
                                %>
                                <span class="text-muted">—</span>
                                <%
                                }
                                %>
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

    <%
    }
    %>

</body>
</html>
