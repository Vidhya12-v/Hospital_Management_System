<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Login</title>
</head>
<body>
<h2 class="header-title">Admin Login</h2>

<div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form action="${pageContext.request.contextPath}/Admin_Login" method="post">

      <div class="formbold-mb-3">
        <div>
          <label for="username" class="formbold-form-label">Username</label>
          <input type="text" name="username" id="username" placeholder="Enter your Username" class="formbold-form-input" required />
        </div>
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="password" class="formbold-form-label">Password</label>
          <input type="password" name="password" id="password" placeholder="Enter your Password" class="formbold-form-input" required />
        </div>
      </div>

      <button class="formbold-btn">Login Now</button>
    </form>
  </div>
</div>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${loginError == true}">
    <script>
        alert("Invalid Username or Password!");
    </script>
</c:if>

</body>
</html>
