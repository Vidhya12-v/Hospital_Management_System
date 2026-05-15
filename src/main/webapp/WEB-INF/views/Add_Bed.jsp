<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<html>
<head>
    <title>Add Bed Details</title>
</head>
<body>
<h2 class="header-title">Add Bed Details</h2>

<div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form action="${pageContext.request.contextPath}/addBed" method="post">

      <div class="formbold-mb-3">
        <label for="HospitalName" class="formbold-form-label">Hospital Name</label>
        <input type="text" name="HospitalName" id="HospitalName" placeholder="Enter Hospital Name" class="formbold-form-input" required />
      </div>

      <div class="formbold-mb-3">
        <label for="WardNumber" class="formbold-form-label">Ward Number</label>
        <input type="text" name="WardNumber" id="WardNumber" placeholder="Enter Ward Number" class="formbold-form-input" required />
      </div>

      <div class="formbold-mb-3">
        <label for="BedNumber" class="formbold-form-label">Bed Number</label>
        <input type="text" name="BedNumber" id="BedNumber" placeholder="Enter Bed Number" class="formbold-form-input" required />
      </div>

      <div class="formbold-mb-3">
        <label for="BedType" class="formbold-form-label">Bed Type</label>
        <select name="BedType" id="BedType" class="formbold-form-input" required>
          <option value="">Select</option>
          <option value="General">General</option>
          <option value="ICU">ICU</option>
          <option value="Semi-Private">Semi-Private</option>
          <option value="Private">Private</option>
        </select>
      </div>

      <div class="formbold-mb-3">
        <label for="AvailabilityStatus" class="formbold-form-label">Availability Status</label>
        <select name="AvailabilityStatus" id="AvailabilityStatus" class="formbold-form-input" required>
          <option value="">Select</option>
          <option value="Available">Available</option>
          <option value="Occupied">Occupied</option>
          <option value="Under Maintenance">Under Maintenance</option>
        </select>
      </div>

      <div class="formbold-mb-3">
        <label for="PricePerDay" class="formbold-form-label">Price per Day (₹)</label>
        <input type="number" name="PricePerDay" id="PricePerDay" placeholder="Enter Price" class="formbold-form-input" min="0" required />
      </div>

      <div class="formbold-mb-3">
        <label for="FloorNumber" class="formbold-form-label">Floor Number</label>
        <input type="text" name="FloorNumber" id="FloorNumber" placeholder="Enter Floor Number" class="formbold-form-input" />
      </div>

      <div class="formbold-mb-3">
        <label for="RoomNumber" class="formbold-form-label">Room Number</label>
        <input type="text" name="RoomNumber" id="RoomNumber" placeholder="Enter Room Number" class="formbold-form-input" />
      </div>

      <div class="formbold-mb-3">
        <label for="Description" class="formbold-form-label">Description</label>
        <textarea name="Description" id="Description" rows="3" placeholder="Enter description about bed details" class="formbold-form-input"></textarea>
      </div>

      <button class="formbold-btn">Add Bed</button>
    </form>
  </div>
</div>

</body>
</html>
