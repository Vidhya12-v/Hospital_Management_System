<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View Booking</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <style>


        .appointments-section {
            margin-bottom: 40px;
        }
        .appointments-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(330px, 1fr));
            gap: 20px;
        }
        .appointment-card {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.2s;
            height:400px;
        }
        .appointment-card:hover {
            transform: scale(1.02);
        }
        .appointment-info p {
            margin: 6px 0;
            line-height:35px;
        }
        .status {
            font-weight: bold;
            padding: 6px 12px;
            border-radius: 8px;
            color: #fff;
            display: inline-block;
            margin-top: 30px;
        }
        .status.Pending { background-color: #ffc107; }
        .status.Approved { background-color: #28a745; }
        .status.Rejected { background-color: #dc3545; }

        .actions button {
            margin-right: 10px;
            padding: 6px 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            color: #fff;
            font-weight: bold;
             margin-top: 30px;
        }
        .actions .approve { background-color: #28a745; }
        .actions .reject { background-color: #dc3545; }
        .actions .approve:hover { background-color: #218838; }
        .actions .reject:hover { background-color: #c82333; }

        .appointment-card i {
            margin-right: 6px;
            color: #007bff;
        }
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
    </style>
</head>
<body>

<div class="appointments-section">
    <h2 class="header-title">Requested Bookings</h2>
    <div class="appointments-grid">
        <c:forEach var="app" items="${pendingBooking}">
            <div class="appointment-card">
                <div class="appointment-info">
                    <p><i class="fas fa-hospital"></i> <b>Hospital:</b> ${app.hospitalName}</p>
                    <p><i class="fas fa-bed"></i> <b>Bed Number:</b> ${app.bedNumber}</p>
                    <p><i class="fas fa-door-closed"></i> <b>Room Number:</b> ${app.roomNumber}</p>
                    <p><i class="fas fa-procedures"></i> <b>Bed Type:</b> ${app.bedType}</p>
                    <p><i class="fas fa-user"></i> <b>Patient:</b> ${app.userName}</p>
                    <p><i class="fas fa-calendar-alt"></i> <b>Date:</b> ${app.appointmentDate}</p>
                    <p><i class="fas fa-clock"></i> <b>Time:</b> ${app.appointmentTime}</p>

                </div>
                <div class="actions">
                    <form action="${pageContext.request.contextPath}/updateBookingStatus" method="post" style="display:inline;">
                        <input type="hidden" name="BookingId" value="${app.id}">
                        <button type="submit" name="action" value="approve" class="approve"><i class="fas fa-check"></i> Approve</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/updateBookingStatus" method="post" style="display:inline;">
                        <input type="hidden" name="BookingId" value="${app.id}">
                        <button type="submit" name="action" value="reject" class="reject"><i class="fas fa-times"></i> Reject</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div class="appointments-section">
    <h2 class="header-title">Approved Bookings</h2>
    <div class="appointments-grid">
        <c:forEach var="app" items="${approvedBooking}">
            <div class="appointment-card">
                <div class="appointment-info">
                    <p><i class="fas fa-hospital"></i> <b>Hospital:</b> ${app.hospitalName}</p>
                                       <p><i class="fas fa-bed"></i> <b>Bed Number:</b> ${app.bedNumber}</p>
                                       <p><i class="fas fa-door-closed"></i> <b>Room Number:</b> ${app.roomNumber}</p>
                                       <p><i class="fas fa-procedures"></i> <b>Bed Type:</b> ${app.bedType}</p>
                                       <p><i class="fas fa-user"></i> <b>Patient:</b> ${app.userName}</p>
                                       <p><i class="fas fa-calendar-alt"></i> <b>Date:</b> ${app.appointmentDate}</p>
                                       <p><i class="fas fa-clock"></i> <b>Time:</b> ${app.appointmentTime}</p>
                </div>
                <div class="status Approved">Approved</div>
            </div>
        </c:forEach>
    </div>
</div>

<div class="appointments-section">
    <h2 class="header-title">Rejected Bookings</h2>
    <div class="appointments-grid">
        <c:forEach var="app" items="${rejectedBooking}">
            <div class="appointment-card">
                <div class="appointment-info">
                    <p><i class="fas fa-hospital"></i> <b>Hospital:</b> ${app.hospitalName}</p>
                                       <p><i class="fas fa-bed"></i> <b>Bed Number:</b> ${app.bedNumber}</p>
                                       <p><i class="fas fa-door-closed"></i> <b>Room Number:</b> ${app.roomNumber}</p>
                                       <p><i class="fas fa-procedures"></i> <b>Bed Type:</b> ${app.bedType}</p>
                                       <p><i class="fas fa-user"></i> <b>Patient:</b> ${app.userName}</p>
                                       <p><i class="fas fa-calendar-alt"></i> <b>Date:</b> ${app.appointmentDate}</p>
                                       <p><i class="fas fa-clock"></i> <b>Time:</b> ${app.appointmentTime}</p>
                </div>
                <div class="status Rejected">Rejected</div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
