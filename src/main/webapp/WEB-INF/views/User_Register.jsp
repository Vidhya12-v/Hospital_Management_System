<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Patient Registration</title>
    <script src="${pageContext.request.contextPath}/js/location.js"></script>
<script src="https://api.tomtom.com/maps-sdk-for-web/cdn/5.x/5.64.0/services/services-web.min.js"></script>
</head>
<body>
<h2 class="header-title">Patient Registration</h2>

<div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">

      <div class="formbold-mb-3">
        <div>
          <label for="name" class="formbold-form-label">Name</label>
          <input type="text" name="name" id="name" placeholder="Enter your Name" class="formbold-form-input" required />
        </div>
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="email" class="formbold-form-label">Email</label>
          <input type="email" name="email" id="email" placeholder="Enter your Email" class="formbold-form-input" required />
        </div>
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="password" class="formbold-form-label">Password</label>
          <input type="password" name="password" id="password" placeholder="Enter your Password" class="formbold-form-input" required />
        </div>
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="mobile" class="formbold-form-label">Mobile</label>
          <input type="text" name="mobile" id="mobile" placeholder="Enter your Mobile Number" class="formbold-form-input" />
        </div>
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="gender" class="formbold-form-label">Gender</label>
          <select name="gender" id="gender" class="formbold-form-input" required>
            <option value="">Select</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
          </select>
        </div>
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="bloodGroup" class="formbold-form-label">Blood Group</label>
          <select name="bloodGroup" id="bloodGroup" class="formbold-form-input" required>
            <option value="">Select</option>
            <option value="A+">A+</option>
            <option value="A-">A-</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="O+">O+</option>
            <option value="O-">O-</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB-</option>
          </select>
        </div>
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="age" class="formbold-form-label">Age</label>
          <input type="number" name="age" id="age" placeholder="Enter your Age" min="0" class="formbold-form-input" required />
        </div>
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="dob" class="formbold-form-label">Date of Birth</label>
          <input type="date" name="dob" id="dob" class="formbold-form-input" required />
        </div>
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="state" class="formbold-form-label">State</label>
          <input type="text" name="State" id="state" placeholder="Enter your State" class="formbold-form-input" required />
        </div>
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="city" class="formbold-form-label">City</label>
          <input type="text" name="City" id="city" placeholder="Enter your City" class="formbold-form-input" required />
        </div>
      </div>

      <input type="hidden" name="lat" id="lat" />
      <input type="hidden" name="long" id="lan" />

      <div class="formbold-mb-3">
        <div>
          <label for="location" class="formbold-form-label">Current Location</label>
          <input type="text" id="loc1" name="location" placeholder="Enter your Current Location" class="formbold-form-input" />
        </div>
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="image" class="formbold-form-label">User Image</label>
          <input type="file" id="image" name="image" class="formbold-form-input" />
        </div>
      </div>

      <button class="formbold-btn">Register Now</button>
    </form><br>
           <p>Already Have Account <a href="${pageContext.request.contextPath}/login">Login Here</a> </p>

  </div>
</div>




<script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOU-GKNx-YL5o-b8cvlqgyn0rso6iQtUk&callback=showlocation"
  type="text/javascript"></script>
</body>
</html>
