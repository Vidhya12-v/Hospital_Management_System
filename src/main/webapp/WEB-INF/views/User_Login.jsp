<h2 class="header-title">User Login</h2>

<div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form action="${pageContext.request.contextPath}/login" method="post">

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

      <button class="formbold-btn">Login Now</button>
    </form><br>
<p>New User? <a href="${pageContext.request.contextPath}/register">Register Here</a> </p>

  </div>
</div>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${loginError == true}">
    <script>
        alert("Invalid Username or Password!");
    </script>
</c:if>

