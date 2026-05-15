<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<html>
<head>
    <title>Add Doctor</title>
</head>
<body>
<h2 class="header-title">Add Doctor Details</h2>
<div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form action="${pageContext.request.contextPath}/addDoctor" method="post" enctype="multipart/form-data">

      <div class="formbold-mb-3">
        <label for="hospitalName" class="formbold-form-label">Hospital Name</label>
        <input type="text" name="hospitalName" id="hospitalName" placeholder="Enter Hospital Name" class="formbold-form-input" required />
      </div>

      <div class="formbold-mb-3">
        <label for="name" class="formbold-form-label">Doctor Name</label>
        <input type="text" name="name" id="name" placeholder="Enter Doctor Name" class="formbold-form-input" required />
      </div>

      <div class="formbold-mb-3">
        <label for="email" class="formbold-form-label">Email</label>
        <input type="email" name="email" id="email" placeholder="Enter Email Address" class="formbold-form-input" required />
      </div>

      <div class="formbold-mb-3">
        <label for="mobile" class="formbold-form-label">Mobile</label>
        <input type="text" name="mobile" id="mobile" placeholder="Enter Mobile Number" class="formbold-form-input" />
      </div>

      <div class="formbold-mb-3">
        <label for="gender" class="formbold-form-label">Gender</label>
        <select name="gender" id="gender" class="formbold-form-input">
          <option value="">Select</option>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
          <option value="Other">Other</option>
        </select>
      </div>

      <div class="formbold-mb-3">
        <label for="specialization" class="formbold-form-label">Specialization</label>
        <select name="specialization" id="specialization" class="formbold-form-input" required>
          <option value="">Select</option>
          <option value="Cardiologist">Cardiologist</option>
          <option value="Neurologist">Neurologist</option>
          <option value="Orthopedic">Orthopedic</option>
          <option value="Pediatrician">Pediatrician</option>
          <option value="Dermatologist">Dermatologist</option>
          <option value="Gynecologist">Gynecologist</option>
        </select>
      </div>

      <div class="formbold-mb-3">
        <label for="experience" class="formbold-form-label">Experience (Years)</label>
        <input type="number" name="experience" id="experience" min="0" placeholder="Enter Experience" class="formbold-form-input" />
      </div>

      <div class="formbold-mb-3">
        <label for="qualifications" class="formbold-form-label">Qualifications</label>
        <input type="text" name="qualifications" id="qualifications" placeholder="Enter Doctor Qualifications" class="formbold-form-input" />
      </div>

      <div class="formbold-mb-3">
        <label class="formbold-form-label">Availability</label>
        <div style="display:flex; gap:10px; align-items:center;">
          <input type="time" name="available_from" id="available_from" value="10:00" class="formbold-form-input" />
          <span>to</span>
          <input type="time" name="available_to" id="available_to" value="19:00" class="formbold-form-input" />
        </div>
      </div>

      <div class="formbold-mb-3">
        <label for="availabilityDays" class="formbold-form-label">Available Days</label>
        <input type="text" name="availabilityDays" id="availabilityDays" value="Monday-Friday" class="formbold-form-input" />
      </div>

      <div class="formbold-mb-3">
        <label for="State" class="formbold-form-label">State</label>
        <input type="text" name="State" id="State" placeholder="Enter State" class="formbold-form-input" required />
      </div>

      <div class="formbold-mb-3">
        <label for="City" class="formbold-form-label">City</label>
        <input type="text" name="City" id="City" placeholder="Enter City" class="formbold-form-input" required />
      </div>

      <div class="formbold-mb-3">
        <label for="Address" class="formbold-form-label">Address</label>
        <input type="text" name="Address" id="Address" placeholder="Enter Full Address" class="formbold-form-input" required />
      </div>

      <div class="formbold-mb-3">
        <label for="Image" class="formbold-form-label">Doctor Image</label>
        <input type="file" name="Image" id="Image" class="formbold-form-input" required />
      </div>

      <button class="formbold-btn">Add Doctor</button>
    </form>
  </div>
</div>

</body>
</html>
