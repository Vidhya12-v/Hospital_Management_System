<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>My Bed Bookings</title>
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

        .bookings-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .booking-card {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }

        .booking-card p {
            margin: 8px 0;
            font-size: 14px;
            color: #333;
        }

        .booking-card p b {
            color: #007bff;
        }

        .no-bookings {
            text-align: center;
            font-size: 16px;
            color: #555;
            margin-top: 50px;
        }

        /* Optional: add icons for hospital, bed, calendar, clock, status */
        .booking-card i {
            margin-right: 5px;
            color: #007bff;
        }
    </style>

</head>
<body>
<h2 class="header-title">My Bed Bookings</h2>

<c:if test="${empty bookings}">
    <p class="no-bookings">No beds booked yet.</p>
</c:if>

<c:if test="${not empty bookings}">
    <div class="bookings-grid">
        <c:forEach var="b" items="${bookings}">
            <div class="booking-card">
                <p><i class="fas fa-hospital"></i> <b>Hospital:</b> ${b.hospitalName}</p>
                <p><i class="fas fa-layer-group"></i> <b>Ward:</b> ${b.wardNumber}</p>
                <p><i class="fas fa-bed"></i> <b>Bed Number:</b> ${b.bedNumber}</p>
                <p><i class="fas fa-procedures"></i> <b>Bed Type:</b> ${b.bedType}</p>
                <p><i class="fas fa-calendar-alt"></i> <b>Date:</b> ${b.appointmentDate}</p>
                <p><i class="fas fa-clock"></i> <b>Time:</b> ${b.appointmentTime}</p>
                <p><i class="fas fa-info-circle"></i> <b>Status:</b> ${b.availabilityStatus}</p>
            </div>
        </c:forEach>
    </div>
</c:if>

<br>
</body>
</html>
