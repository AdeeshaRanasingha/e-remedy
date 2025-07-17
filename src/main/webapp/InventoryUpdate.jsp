<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Services.InventoryService" %>
<%@ page import="Model.InventoryModel" %>

<%
    String medIDStr = request.getParameter("medID");
    if (medIDStr == null || medIDStr.isEmpty()) {
%>
    <script>
        alert("No Medicine ID provided. Redirecting to summary page.");
        window.location.href = "InventoryReadServelet";
    </script>
<%
        return;
    }
    int medID = Integer.parseInt(medIDStr);
    InventoryModel inmode6 = InventoryService.getmedicineById(medID);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Medicine Record</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background-color: #f4f7fd;
      display: flex;
    }

    .sidebar {
      width: 250px;
      background-color: #ffffff;
      padding: 20px;
      height: 100vh;
      box-shadow: 2px 0 5px rgba(0,0,0,0.1);
      display: flex;
      flex-direction: column;
    }

    .sidebar h2 {
      color: #6a5acd;
      margin-bottom: 30px;
    }

    .sidebar a {
      text-decoration: none;
      color: #333;
      padding: 10px 0;
      font-size: 16px;
      display: flex;
      align-items: center;
    }

    .sidebar a:hover {
      color: #6a5acd;
    }

    .main-content {
      flex: 1;
      padding: 40px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .main-content h1 {
      font-size: 24px;
      margin-bottom: 30px;
    }

    .form-section {
      background-color: #ffffff;
      padding: 30px;
      max-width: 700px;
      width: 100%;
      border-radius: 12px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .form-section label {
      display: block;
      margin-top: 18px;
      font-weight: 500;
    }

    .form-section input[type="text"],
    .form-section input[type="number"],
    .form-section input[type="date"],
    .form-section select,
    .form-section textarea {
      width: 100%;
      padding: 12px;
      margin-top: 6px;
      border: 1px solid #ccc;
      border-radius: 6px;
      background-color: #fafafa;
      font-size: 15px;
    }

    .form-section textarea {
      resize: vertical;
    }

    .radio-group {
      margin-top: 10px;
      display: flex;
      gap: 25px;
      align-items: center;
    }

    .radio-group label {
      font-weight: normal;
    }

    .form-section input[type="radio"] {
      transform: scale(1.2);
      margin-right: 8px;
    }

    .submit-btn {
      background-color: #007bff;
      color: white;
      border: none;
      padding: 14px;
      font-size: 16px;
      width: 100%;
      border-radius: 6px;
      margin-top: 30px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .submit-btn:hover {
      background-color: #0056b3;
    }

    .error-msg {
      color: red;
      font-size: 0.9rem;
      margin-top: 4px;
    }
  </style>
</head>
<body>
<div class="sidebar">
  <h2>eRemedy</h2>
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

<div class="main-content">
  <h1>📝 Edit Medicine Record</h1>
  <div class="form-section">
    <form id="inventoryForm" action="InventoryUpdateData" method="post">
      <input type="hidden" name="medID" value="<%= inmode6.getMedicineId() %>" />

      <label for="medicineName">Medicine Name:</label>
      <input type="text" id="medicineName" name="medicineName" value="<%= inmode6.getMedicineName()%>" >
      <div id="medicineNameError" class="error-msg"></div>

      <label for="description">Description:</label>
      <textarea id="description" name="description" rows="4"><%= inmode6.getdescription() %></textarea>
      <div id="descriptionError" class="error-msg"></div>

      <label for="category">Category:</label>
      <select id="category" name="category">
        <option value="">--Select Category--</option>
        <option value="Painkiller" <%= "Painkiller".equals(inmode6.getCategory()) ? "selected" : "" %>>Painkiller</option>
        <option value="Allergy" <%= "Allergy".equals(inmode6.getCategory()) ? "selected" : "" %>>Allergy</option>
        <option value="Injection" <%= "Injection".equals(inmode6.getCategory()) ? "selected" : "" %>>Injection</option>
        <option value="Antibiotic" <%= "Antibiotic".equals(inmode6.getCategory()) ? "selected" : "" %>>Antibiotic</option>
        <option value="Ointment" <%= "Ointment".equals(inmode6.getCategory()) ? "selected" : "" %>>Ointment</option>
        <option value="Drops" <%= "Drops".equals(inmode6.getCategory()) ? "selected" : "" %>>Drops</option>
      </select>
      <div id="categoryError" class="error-msg"></div>

      <label for="quantity">Quantity:</label>
      <input type="number" id="quantity" name="quantity" value="<%= inmode6.getQuantity() %>" >
      <div id="quantityError" class="error-msg"></div>

      <label for="unitPrice">Unit Price (Rs.):</label>
      <input type="number" step="0.01" id="unitPrice" name="unitPrice" value="<%= inmode6.getUnitPrice()%>" >
      <div id="unitPriceError" class="error-msg"></div>

      <label>Prescription Required?</label>
      <div class="radio-group">
        <label><input type="radio" name="prescriptionRequired" value="Yes" <%= "Yes".equals(inmode6.getPrescriptionRequired()) ? "checked" : "" %>> Yes</label>
        <label><input type="radio" name="prescriptionRequired" value="No" <%= "No".equals(inmode6.getPrescriptionRequired()) ? "checked" : "" %>> No</label>
      </div>
      <div id="prescriptionRequiredError" class="error-msg"></div>

      <label for="expiryDate">Expiry Date:</label>
      <input type="date" id="expiryDate" name="expiryDate" value="<%= inmode6.getExpiryDate() %>">
      <div id="expiryDateError" class="error-msg"></div>

      <label for="addDate">Added Date:</label>
      <input type="date" id="addDate" name="addDate" value="<%= inmode6.getAddedDate() %>">

      <input type="submit" value="Update Record" class="submit-btn">
    </form>
  </div>
</div>

<script>
document.getElementById("inventoryForm").addEventListener("submit", function (e) {
  let valid = true;

  function showError(id, message) {
    const inputField = document.getElementById(id);
    if (inputField) inputField.value = "";
    document.getElementById(id + "Error").innerText = message;
    valid = false;
  }

  // Clear previous error messages
  document.querySelectorAll(".error-msg").forEach(el => el.innerText = "");

  const name = document.getElementById("medicineName");
  if (!name.value.trim() || name.value.length <= 3)
    showError("medicineName", "Enter at least 3 characters");

  const desc = document.getElementById("description");
  if (!desc.value.trim() || desc.value.length < 5)
    showError("description", "Description must be at least 5 characters");

  const cat = document.getElementById("category");
  if (cat.value === "") {
    document.getElementById("categoryError").innerText = "Please select a category";
    valid = false;
  }

  const qty = document.getElementById("quantity");
  if (!qty.value || qty.value <= 0)
    showError("quantity", "Enter a valid quantity");

  const price = document.getElementById("unitPrice");
  if (!price.value || price.value <= 0)
    showError("unitPrice", "Enter a valid price");

  const prescrip = document.querySelector('input[name="prescriptionRequired"]:checked');
  if (!prescrip) {
    document.getElementById("prescriptionRequiredError").innerText = "Select Yes or No";
    valid = false;
  }

  const expiry = document.getElementById("expiryDate");
  const today = new Date().toISOString().split("T")[0];
  if (!expiry.value || expiry.value < today)
    showError("expiryDate", "Date must be in the future");

  if (!valid) e.preventDefault();
});
</script>
</body>
</html>
