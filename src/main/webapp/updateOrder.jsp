<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Order - PharmaOnline</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <style>
    body {
      background-color: #f4f9fd;
      color: #333;
    }

    .form-control {
      border-radius: 0.5rem;
    }

    .btn-primary {
      background-color: #1E3A8A;
      border-color: #1E3A8A;
    }

    .btn-primary:hover {
      background-color: #0EA5E9;
      border-color: #0EA5E9;
    }

    .error-msg {
      font-size: 0.9rem;
      color: red;
      margin-top: 4px;
    }
  </style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container py-5">
  <h2 class="mb-4 text-primary">✏️ Update Order</h2>

  <form id="updateOrderForm" action="UpdateOrderServlet" method="post" class="bg-white p-4 shadow rounded">
    <div class="mb-3">
      <label for="orderID" class="form-label">Order ID</label>
      <input type="number" class="form-control" id="orderID" name="orderID" value="<%= request.getParameter("id") %>" readonly>
    </div>

    <div class="mb-3">
      <label for="address" class="form-label">Delivery Address</label>
      <textarea class="form-control" id="address" name="address" rows="3" required><%= request.getParameter("address") %></textarea>
      <div class="error-msg" id="addressError"></div>
    </div>

    <div class="mb-3">
      <label for="phone" class="form-label">Phone Number</label>
      <input type="text" class="form-control" id="phone" name="phone" value="<%= request.getParameter("telephone") %>" required>
      <div class="error-msg" id="phoneError"></div>
    </div>

    <div class="text-end">
      <button type="submit" class="btn btn-primary px-4">Update Order</button>
    </div>
  </form>
</div>

<script>
  document.getElementById("updateOrderForm").addEventListener("submit", function (e) {
    let valid = true;

    // Clear all previous errors
    document.querySelectorAll(".error-msg").forEach(el => el.innerText = "");

    // Phone validation
    const phone = document.getElementById("phone");
    const phoneVal = phone.value.trim();
    if (!/^07[0-9]{8}$/.test(phoneVal)) {
      document.getElementById("phoneError").innerText = "Phone must start with 07 and be 10 digits.";
      phone.value = "";
      valid = false;
    }

    // Address validation
    const address = document.getElementById("address");
    if (address.value.trim().length < 5) {
      document.getElementById("addressError").innerText = "Enter a valid address (min 5 characters).";
      address.value = "";
      valid = false;
    }

    if (!valid) {
      e.preventDefault();
    }
  });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<jsp:include page="footer.jsp" />
</body>
</html>
