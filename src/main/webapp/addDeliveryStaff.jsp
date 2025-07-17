<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add New Delivery Staff</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <style>
    body {
      background-color: #f4f7fd;
      display: flex;
      font-family: 'Segoe UI', sans-serif;
    }

    .sidebar {
      width: 250px;
      height: 100vh;
      background-color: #ffffff;
      padding: 20px;
      position: fixed;
      top: 0;
      left: 0;
      overflow-y: auto;
      box-shadow: 2px 0 5px rgba(0,0,0,0.1);
      display: flex;
      flex-direction: column;
      z-index: 1000;
    }

    .sidebar h2 {
      color: #6a5acd;
      margin-bottom: 30px;
      text-align: center;
    }

    .sidebar a {
      text-decoration: none;
      color: #333;
      padding: 12px 10px;
      font-size: 16px;
      border-radius: 6px;
      display: flex;
      align-items: center;
      transition: background 0.2s;
    }

    .sidebar a:hover {
      background-color: #f0f0ff;
      color: #6a5acd;
    }

    .main-content {
      margin-left: 250px;
      padding: 40px 20px;
      width: 100%;
    }

    .logout-link {
      margin-top: auto;
      color: red;
      font-weight: bold;
    }

    .logout-link:hover {
      color: darkred;
    }

    .card {
      border-radius: 12px;
    }
    
    .is-invalid {
        border-color: #dc3545;
    }
  </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>MyPharmacy</h2>
    <a href="adminPanelServlet"><i class="fas fa-tachometer-alt"></i>&nbsp; Dashboard</a>
    <a href="InventoryReadServelet"><i class="fas fa-pills"></i>&nbsp; Manage Medicines</a>
    <a href="Inventory.jsp"><i class="fas fa-user-nurse"></i>&nbsp; Add Medicine</a>
    <a href="#"><i class="fas fa-users"></i>&nbsp; Manage Customers</a>
    <a href="orderListServlet"><i class="fas fa-clipboard-list"></i>&nbsp; Orders</a>
    <a href="addDeliveryStaff.jsp"><i class="fas fa-truck"></i>&nbsp; Add Delivery Staff</a>
    <a href="DeliveryStaffListServlet"><i class="fas fa-list-ul"></i>&nbsp; Delivery Staff Management</a>
    <a href="ManageOrdersServlet"><i class="fas fa-list-ul"></i>&nbsp; Manage Orders</a>
    <a href="adminViewFeedback.jsp"><i class="fas fa-list-ul"></i>&nbsp; Messages</a>
    <a href="LogoutServlet" class="logout-link"><i class="fas fa-sign-out-alt"></i>&nbsp; Logout</a>
  </div>

<!-- Main Content -->
<div class="main-content">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card shadow p-4">
          <h3 class="card-title text-center mb-4">Add New Delivery Staff</h3>

          <form action="AddDeliveryStaffServlet" method="post">
            <div class="mb-3">
              <label for="firstname" class="form-label">First Name</label>
              <input type="text" name="firstname" id="firstname" class="form-control" placeholder="Enter first name" required>
            </div>

            <div class="mb-3">
              <label for="lastname" class="form-label">Last Name</label>
              <input type="text" name="lastname" id="lastname" class="form-control" placeholder="Enter last name" required>
            </div>

            <div class="mb-3">
			  <label for="phone" class="form-label">Phone Number</label>
			  <input type="text" name="phone" id="phone" class="form-control" placeholder="07XXXXXXXX" maxlength="10" required>
			  <div id="phoneError" class="text-danger mb-2" style="display: none; font-size: 14px;">
			    Invalid phone number. It must be 10 digits and start with 07.
			  </div>
			</div>


            <div class="mb-3">
              <label for="assignedArea" class="form-label">Assigned Area</label>
              <input type="text" name="assignedArea" id="assignedArea" class="form-control" placeholder="e.g., Colombo 03" required>
            </div>

            <div class="mb-3">
              <label for="status" class="form-label">Status</label>
              <select name="status" id="status" class="form-select" required>
                <option value="Active" selected>Active</option>
                <option value="On Leave">On Leave</option>
                <option value="Suspended">Suspended</option>
                <option value="Resigned">Resigned</option>
              </select>
            </div>

            <div class="mb-3">
              <label for="notes" class="form-label">Notes (Optional)</label>
              <textarea name="notes" id="notes" class="form-control" rows="3" placeholder="Any additional notes..."></textarea>
            </div>

            <div class="d-flex justify-content-between">
              <button type="submit" class="btn btn-success">Add Staff</button>
              <a href="DeliveryStaffListServlet" class="btn btn-secondary">Cancel</a>
            </div>
          </form>

        </div>
      </div>
    </div>
  </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
    const phoneInput = document.getElementById("phone");
    const phoneError = document.getElementById("phoneError");

    form.addEventListener("submit", function (e) {
        let isValid = true;
        const phone = phoneInput.value.trim();
        const phoneRegex = /^07\d{8}$/;

        // Clear previous error
        phoneInput.classList.remove("is-invalid");
        phoneError.style.display = "none";

        // Validate phone
        if (!phoneRegex.test(phone)) {
            phoneInput.classList.add("is-invalid");
            phoneError.style.display = "block";
            isValid = false;
        }

        if (!isValid) {
            e.preventDefault();
        }
    });
});
</script>


</body>
</html>
