<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Available Doctors</title>
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

        .doctor-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }

        .doctor-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.2s;
        }

        .doctor-card:hover {
            transform: scale(1.03);
        }

        .doctor-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .doctor-details {
            padding: 15px;
        }

        .doctor-details h3 {
            margin: 0 0 10px;
            color: #007bff;
        }

        .doctor-details p {
            margin: 5px 0;
            color: #555;
            font-size: 14px;
        }

        .book-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 15px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            font-size: 14px;
        }

        .book-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<h2 class="header-title">Available Doctors</h2>

<div class="doctor-grid">
    <c:forEach var="doc" items="${DoctorList}">
        <div class="doctor-card">
            <c:choose>
                <c:when test="${not empty doc.imageBase64}">
                    <img class="doctor-image" src="data:image/jpeg;base64,${doc.imageBase64}" alt="Doctor Image">
                </c:when>
                <c:otherwise>
                    <img class="doctor-image" src="${pageContext.request.contextPath}/assets/images/default-doctor.png" alt="Doctor Image">
                </c:otherwise>
            </c:choose>

            <div class="doctor-details">
                <h3>${doc.name}</h3>
                <p><b>Hospital:</b> ${doc.hospitalName}</p>
                <p><b>Specialization:</b> ${doc.specialization}</p>
                <p><b>Experience:</b> ${doc.experience} yrs</p>
                <p><b>Availability:</b> ${doc.available_from} - ${doc.available_to}, ${doc.availabilityDays}</p>
                <p><b>Location:</b> ${doc.city}, ${doc.state}</p>

                <form action="${pageContext.request.contextPath}/Book_Doctor" method="post">
                    <input type="hidden" name="doctorId" value="${doc.doctorId}">
                    <button type="submit" class="book-btn">Book Appointment</button>
                </form>
            </div>
        </div>
    </c:forEach>

</div>

</body>
</html>
