<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.foodapp.model.Menu"%>
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
List<Menu> menuItems = (List<Menu>) request.getAttribute("menuItems");
Menu editMenu = (Menu) request.getAttribute("editMenu");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Menu</title>
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
            <li><a href="<%=ctx%>/restaurant/menu" class="active">My Menu</a></li>
            <li><a href="<%=ctx%>/restaurant/orders">My Orders</a></li>
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
        <h1>🍽️ My Menu</h1>
        <p>Manage menu items for your restaurant.</p>
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

        if (editMenu != null) {
    %>

    <section class="admin-section">

        <div class="admin-form-card">
            <h2>Edit Menu Item — <%=editMenu.getItemName()%></h2>

            <form action="<%=ctx%>/restaurant/menu" method="post">

                <input type="hidden" name="action" value="update">
                <input type="hidden" name="menuId" value="<%=editMenu.getMenuId()%>">

                <div class="form-row">
                    <div class="input-group">
                        <label>Item Name</label>
                        <input type="text" name="itemName"
                            value="<%=editMenu.getItemName()%>" required>
                    </div>
                    <div class="input-group">
                        <label>Category</label>
                        <input type="text" name="category"
                            value="<%=editMenu.getCategory()%>" required>
                    </div>
                </div>

                <div class="input-group">
                    <label>Description</label>
                    <textarea name="description" rows="2" required><%=editMenu.getDescription()%></textarea>
                </div>

                <div class="form-row">
                    <div class="input-group">
                        <label>Price (₹)</label>
                        <input type="number" name="price" min="0" step="0.01"
                            value="<%=editMenu.getPrice()%>" required>
                    </div>
                    <div class="input-group">
                        <label>Rating</label>
                        <input type="number" name="rating" min="0" max="5" step="0.1"
                            value="<%=editMenu.getRating()%>" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-group">
                        <label>Food Type</label>
                        <select name="foodType" required>
                            <option value="Veg" <%= "Veg".equalsIgnoreCase(editMenu.getFoodType()) ? "selected" : "" %>>Veg</option>
                            <option value="Non-Veg" <%= "Non-Veg".equalsIgnoreCase(editMenu.getFoodType()) ? "selected" : "" %>>Non-Veg</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <label>Image URL</label>
                        <input type="text" name="imagePath"
                            value="<%=editMenu.getImagePath()%>" required>
                    </div>
                </div>

                <div class="input-group checkbox-group">
                    <label> <input type="checkbox" name="isAvailable"
                        <%=editMenu.isAvailable() ? "checked" : ""%>> Available
                    </label>
                </div>

                <div class="form-actions">
                    <button type="submit" class="admin-btn">Update Menu Item</button>
                    <a href="<%=ctx%>/restaurant/menu" class="admin-btn outline">Cancel</a>
                </div>

            </form>
        </div>

    </section>

    <%
        } else {
    %>

    <section class="admin-section">

        <div class="admin-form-card">
            <h2>Add Menu Item — <%=restaurant.getName()%></h2>

            <form action="<%=ctx%>/restaurant/menu" method="post">

                <input type="hidden" name="action" value="add">

                <div class="form-row">
                    <div class="input-group">
                        <label>Item Name</label>
                        <input type="text" name="itemName" required>
                    </div>
                    <div class="input-group">
                        <label>Category</label>
                        <input type="text" name="category" placeholder="Pizza, Burger, etc." required>
                    </div>
                </div>

                <div class="input-group">
                    <label>Description</label>
                    <textarea name="description" rows="2" required></textarea>
                </div>

                <div class="form-row">
                    <div class="input-group">
                        <label>Price (₹)</label>
                        <input type="number" name="price" min="0" step="0.01" required>
                    </div>
                    <div class="input-group">
                        <label>Rating</label>
                        <input type="number" name="rating" min="0" max="5" step="0.1"
                            value="4.0" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-group">
                        <label>Food Type</label>
                        <select name="foodType" required>
                            <option value="Veg">Veg</option>
                            <option value="Non-Veg">Non-Veg</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <label>Image URL</label>
                        <input type="text" name="imagePath"
                            placeholder="images/menu/example.jpg" required>
                    </div>
                </div>

                <div class="input-group checkbox-group">
                    <label> <input type="checkbox" name="isAvailable" checked>
                        Available
                    </label>
                </div>

                <button type="submit" class="admin-btn">Add Menu Item</button>

            </form>
        </div>

    </section>

    <%
        }
    %>

    <section class="admin-section">

        <div class="admin-table-card">
            <h2>Menu Items — <%=restaurant.getName()%></h2>

            <%
            if (menuItems == null || menuItems.isEmpty()) {
            %>

            <p class="empty-msg">No menu items yet. Add your first item above.</p>

            <%
            } else {
            %>

            <div class="table-wrap">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Type</th>
                            <th>Price</th>
                            <th>Rating</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        for (Menu menu : menuItems) {
                        %>
                        <tr>
                            <td><%=menu.getMenuId()%></td>
                            <td><img src="<%=ctx%>/<%=menu.getImagePath()%>"
                                class="table-img" alt="<%=menu.getItemName()%>"></td>
                            <td><%=menu.getItemName()%></td>
                            <td><%=menu.getCategory()%></td>
                            <td><%=menu.getFoodType()%></td>
                            <td>₹<%=menu.getPrice()%></td>
                            <td>⭐ <%=menu.getRating()%></td>
                            <td>
                                <%
                                if (menu.isAvailable()) {
                                %>
                                <span class="status-badge active">Available</span>
                                <%
                                } else {
                                %>
                                <span class="status-badge inactive">Unavailable</span>
                                <%
                                }
                                %>
                            </td>
                            <td class="action-cell">

                                <a href="<%=ctx%>/restaurant/menu?editMenuId=<%=menu.getMenuId()%>"
                                    class="action-btn edit">Edit</a>

                                <form action="<%=ctx%>/restaurant/menu" method="post"
                                    class="inline-form">
                                    <input type="hidden" name="action" value="toggleAvailable">
                                    <input type="hidden" name="menuId"
                                        value="<%=menu.getMenuId()%>">
                                    <button type="submit" class="action-btn toggle">
                                        <%=menu.isAvailable() ? "Mark Unavailable" : "Mark Available"%>
                                    </button>
                                </form>

                                <form action="<%=ctx%>/restaurant/menu" method="post"
                                    class="inline-form"
                                    onsubmit="return confirm('Delete this menu item?');">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="menuId"
                                        value="<%=menu.getMenuId()%>">
                                    <button type="submit" class="action-btn delete">Delete</button>
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

    <%
    }
    %>

</body>
</html>
