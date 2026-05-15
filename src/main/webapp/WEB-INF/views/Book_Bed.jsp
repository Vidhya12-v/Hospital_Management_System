<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Book Doctor</title>
</head>
<style>


    .header-title{
           text-align: center;
                      font-size: 2rem;
                      font-weight: bold;
                      color: #002874;

                      text-transform: uppercase;
                      background-color: #a7cbf0;
                      padding: 10px;

                      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                      margin-bottom: 20px;
           }

    form {
        max-width: 600px;
        margin: 0 auto 40px auto;
        background-color: #ffffff;
        padding: 25px 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .doctor {
        color: #333;
        border-bottom: 1px solid #ddd;
        padding-bottom: 5px;
        margin-bottom: 15px;
        margin-top: 20px;
    }

    .para{
        margin: 8px 0;
        font-size: 15px;
        color: #555;
    }

    label {
        font-weight: bold;
        display: block;
        margin-top: 15px;
        margin-bottom: 5px;
        color: #333;
    }

    input[type="text"],
    input[type="email"],
    input[type="date"],
    input[type="time"],
    input[type="password"] {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
        font-size: 14px;
        margin-bottom: 10px;
        transition: 0.3s;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="date"]:focus,
    input[type="time"]:focus,
    input[type="password"]:focus {
        border-color: #007bff;
        outline: none;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
    }

    input[type="submit"] {
        width: 100%;
        background-color: #007bff;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        transition: 0.3s;
        margin-top: 20px;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    .dlist {
        display: block;
        text-align: center;
        margin-top: 20px;
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
    }

    .dlist:hover {
        text-decoration: underline;
    }

    .error-message {
        text-align: center;
        color: red;
        font-weight: bold;
        margin-bottom: 15px;
    }
</style>
<body>
<h2 class="header-title">Book Bed Appointment</h2>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<form action="${pageContext.request.contextPath}/Bed_Booking" method="post">
    <h3 class="doctor">Bed Details</h3>
    <p class="para">Hospital: ${bed.hospitalName}</p>
    <p class="para">Ward Number: ${bed.wardNumber}</p>
     <p class="para">Bed Number: ${bed.bedNumber}</p>
     <p class="para">Bed Type: ${bed.bedType}</p>
    <p class="para">Available: ${bed.availabilityStatus}</p>

    <h3 class="doctor">User Details</h3>
    <p class="para">Name: ${user.name}</p>
    <p class="para">Email: ${user.email}</p>
    <p class="para">Mobile: ${user.mobile}</p>

    <input type="hidden" name="BedId" value="${bed.bed_Id}">
    <input type="hidden" name="userId" value="${user.id}">

    <label>Needed Date:</label><br>
    <input type="date" name="appointmentDate" required><br><br>

    <label>Needed Time:</label><br>
    <input type="time" name="appointmentTime" required><br><br>

    <input type="submit" value="Confirm Booking">
</form>

<a class="dlist" href="${pageContext.request.contextPath}/View_Bed">Back to Bed List</a><br>
</body>
</html>
