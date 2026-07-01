<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,java.util.Map"%>
<%@ page import="com.foodapp.model.OrderTable,com.foodapp.model.User"%>

<%
String ctx = request.getContextPath();
User user = (User) session.getAttribute("user");

if (user == null || !"deliveryAgent".equalsIgnoreCase(user.getRole())) {
    response.sendRedirect(ctx + "/Login.html");
    return;
}

List<OrderTable> availableOrders = (List<OrderTable>) request.getAttribute("availableOrders");
List<OrderTable> activeDeliveries = (List<OrderTable>) request.getAttribute("activeDeliveries");
List<OrderTable> completedToday = (List<OrderTable>) request.getAttribute("completedToday");
Map<Integer, String> userNames = (Map<Integer, String>) request.getAttribute("userNames");
Map<Integer, String> restaurantNames = (Map<Integer, String>) request.getAttribute("restaurantNames");

int availableCount = (int) request.getAttribute("availableCount");
int activeCount = (int) request.getAttribute("activeCount");
int completedCount = (int) request.getAttribute("completedCount");
float todayEarnings = (float) request.getAttribute("todayEarnings");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delivery Dashboard</title>
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
            <span class="logo-icon">🍃</span> <span>FoodCafe Delivery</span>
        </div>

        <ul>
            <li><a href="<%=ctx%>/delivery/dashboard" class="active">Dashboard</a></li>
            <li><a href="<%=ctx%>/delivery/profile">My Profile</a></li>
            <li><a href="<%=ctx%>/restaurants">View Site</a></li>
        </ul>

        <div class="nav-icons">
            <span class="admin-user">&#128075; <%=user.getUserName()%></span>
            <a href="<%=ctx%>/logout" class="icon-btn" title="Logout"> <i
                class="fa-solid fa-right-from-bracket"></i>
            </a>
        </div>

    </nav>

    <section class="admin-header">
        <h1>&#128666; Delivery Dashboard</h1>
        <p>Accept and manage deliveries for customer orders.</p>
    </section>

    <section class="admin-section">

        <div class="stats-grid">

            <div class="stat-card">
                <div class="stat-icon" style="background:#e3f2fd;">
                    <i class="fa-solid fa-clock" style="color:#1976d2;"></i>
                </div>
                <div class="stat-info">
                    <h3><%=availableCount%></h3>
                    <p>Available Orders</p>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon" style="background:#fff3e0;">
                    <i class="fa-solid fa-motorcycle" style="color:#f57c00;"></i>
                </div>
                <div class="stat-info">
                    <h3><%=activeCount%></h3>
                    <p>Active Deliveries</p>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon" style="background:#e8f5e9;">
                    <i class="fa-solid fa-circle-check" style="color:#388e3c;"></i>
                </div>
                <div class="stat-info">
                    <h3><%=completedCount%></h3>
                    <p>Delivered Today</p>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon" style="background:#fce4ec;">
                    <i class="fa-solid fa-indian-rupee-sign" style="color:#d32f2f;"></i>
                </div>
                <div class="stat-info">
                    <h3>&#8377;<%=String.format("%.0f", todayEarnings)%></h3>
                    <p>Today's Earnings</p>
                </div>
            </div>

        </div>

    </section>

    <section class="admin-section">

        <div class="admin-table-card">
            <h2>&#128204; Available Orders</h2>

            <%
            if (availableOrders == null || availableOrders.isEmpty()) {
            %>

            <p class="empty-msg">No orders ready for pickup yet.</p>

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
                            <th>Total</th>
                            <th>Payment</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        for (OrderTable order : availableOrders) {
                            String customerName = userNames != null ? userNames.getOrDefault(order.getUserId(), "Unknown") : "Unknown";
                            String restaurantName = restaurantNames != null ? restaurantNames.getOrDefault(order.getResturantId(), "Unknown") : "Unknown";
                        %>
                        <tr>
                            <td>#<%=order.getOredrId()%></td>
                            <td><%=customerName%></td>
                            <td><%=restaurantName%></td>
                            <td>&#8377;<%=String.format("%.2f", order.getTotalAmount())%></td>
                            <td><%=order.getPaymentMethod() != null ? order.getPaymentMethod() : "—"%></td>
                            <td><%=order.getOrderDate()%></td>
                            <td class="action-cell">
                                <form action="<%=ctx%>/delivery/dashboard" method="post" class="inline-form">
                                    <input type="hidden" name="action" value="accept">
                                    <input type="hidden" name="orderId" value="<%=order.getOredrId()%>">
                                    <button type="submit" class="action-btn edit">Accept</button>
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

    <section class="admin-section">

        <div class="admin-table-card">
            <h2>&#128640; My Active Deliveries</h2>

            <%
            if (activeDeliveries == null || activeDeliveries.isEmpty()) {
            %>

            <p class="empty-msg">No active deliveries. Accept an available order above.</p>

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
                            <th>Status</th>
                            <th>Delivery Address</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        for (OrderTable order : activeDeliveries) {
                            String customerName = userNames != null ? userNames.getOrDefault(order.getUserId(), "Unknown") : "Unknown";
                            String restaurantName = restaurantNames != null ? restaurantNames.getOrDefault(order.getResturantId(), "Unknown") : "Unknown";
                            String status = order.getStatus();
                            String statusClass = "";
                            if (status != null) {
                                switch (status.toLowerCase()) {
                                    case "ready for pickup":
                                        statusClass = "status-badge";
                                        break;
                                    case "out for delivery":
                                        statusClass = "status-badge";
                                        break;
                                    default:
                                        statusClass = "status-badge";
                                }
                            }
                        %>
                        <tr>
                            <td>#<%=order.getOredrId()%></td>
                            <td><%=customerName%></td>
                            <td><%=restaurantName%></td>
                            <td><span class="<%=statusClass%>"><%=status != null ? status : "—"%></span></td>
                            <td style="max-width:200px; white-space:pre-line; font-size:13px;">
                                <%=order.getDeliveryAddress() != null && !order.getDeliveryAddress().isEmpty() ? order.getDeliveryAddress() : "—"%>
                            </td>
                            <td class="action-cell">
                                <%
                                if ("Ready for Pickup".equalsIgnoreCase(status)) {
                                %>
                                <form action="<%=ctx%>/delivery/dashboard" method="post" class="inline-form">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="orderId" value="<%=order.getOredrId()%>">
                                    <input type="hidden" name="status" value="Out for Delivery">
                                    <button type="submit" class="action-btn edit">Picked Up</button>
                                </form>
                                <%
                                } else if ("Out for Delivery".equalsIgnoreCase(status)) {
                                %>
                                <form action="<%=ctx%>/delivery/dashboard" method="post" class="inline-form">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="orderId" value="<%=order.getOredrId()%>">
                                    <input type="hidden" name="status" value="Delivered">
                                    <button type="submit" class="action-btn edit">Delivered</button>
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

</body>
</html>
