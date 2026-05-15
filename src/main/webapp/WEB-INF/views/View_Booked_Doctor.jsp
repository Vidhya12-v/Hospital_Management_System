<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>My Doctor Appointments</title>
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

       .appointments-grid {
           display: grid;
           grid-template-columns: repeat(auto-fit, minmax(330px, 1fr));
           gap: 20px;
           max-width: 1200px;
           margin: 0 auto;
       }

       .appointment-card {
           background-color: #fff;
           border-radius: 10px;
           padding: 20px;
           box-shadow: 0 4px 10px rgba(0,0,0,0.1);
           transition: transform 0.3s, box-shadow 0.3s;
       }

       .appointment-card:hover {
           transform: translateY(-5px);
           box-shadow: 0 6px 15px rgba(0,0,0,0.15);
       }

       .appointment-card p {
           margin: 8px 0;
           font-size: 14px;
           color: #333;
           line-height:30px;
       }

       .appointment-card p b {
           color: #007bff;
       }

       .no-appointments {
           text-align: center;
           font-size: 16px;
           color: #555;
           margin-top: 50px;
       }

       /* Optional: add icons for doctor, hospital, calendar, clock */
       .appointment-card i {
           margin-right: 5px;
           color: #007bff;
       }
   </style>

</head>
<body>
<h2 class="header-title">My Doctor Appointments</h2>

<c:if test="${empty appointments}">
    <p class="no-appointments">No appointments booked yet.</p>
</c:if>

<c:if test="${not empty appointments}">
    <div class="appointments-grid">
        <c:forEach var="appt" items="${appointments}">
            <div class="appointment-card">
                <p><i class="fas fa-user-md"></i> <b>Doctor:</b> ${appt.doctorName}</p>
                <p><i class="fas fa-hospital"></i> <b>Hospital:</b> ${appt.doctorHospital}</p>
                <p><i class="fas fa-stethoscope"></i> <b>Specialization:</b> ${appt.doctorSpecialization}</p>
                <p><i class="fas fa-calendar-alt"></i> <b>Date:</b> ${appt.appointmentDate}</p>
                <p><i class="fas fa-clock"></i> <b>Time:</b> ${appt.appointmentTime}</p>
                <p><i class="fas fa-info-circle"></i> <b>Availability:</b> ${appt.doctorAvailability}</p>
            </div>
        </c:forEach>
    </div>
</c:if>


<br>
</body>
</html>
