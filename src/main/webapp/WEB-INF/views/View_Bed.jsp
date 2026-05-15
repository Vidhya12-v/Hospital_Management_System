<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Available Beds</title>
    <style>
        table, th, td { border: 1px solid black; border-collapse: collapse; padding: 8px; }
        th { background-color: #f2f2f2; }
        a.button { text-decoration: none; padding: 5px 10px; background-color: green; color: white; border-radius: 3px; }
    </style>
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

    .bed-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .bed-card {
        background-color: #fff;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        transition: transform 0.3s, box-shadow 0.3s;
        text-align: center;
    }

    .bed-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 15px rgba(0,0,0,0.15);
    }

    .bed-image {
       width: 100%;
                   height: 200px;
                   object-fit: cover;
    }

    .bed-card p {
        margin: 5px 0;
        font-size: 14px;
        color: #333;
        text-align:left;
    }

    .bed-card .book-btn {
        display: inline-block;
        margin-top: 15px;
        padding: 8px 15px;
        background-color: #28a745;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    .bed-card .book-btn:hover {
        background-color: #218838;
    }
</style>

<body>
<h2 class="header-title">Available Beds</h2>

<div class="bed-grid">
    <c:forEach var="bed" items="${Add_Bed}">
        <div class="bed-card">
            <img class="bed-image" src="${pageContext.request.contextPath}/Images/bed.jpg" alt="Bed Image">
            <p><b>Hospital:</b> ${bed.hospitalName}</p>
            <p><b>Ward Number:</b> ${bed.wardNumber}</p>
            <p><b>Bed Number:</b> ${bed.bedNumber}</p>
            <p><b>Bed Type:</b> ${bed.bedType}</p>
            <p><b>Availability:</b> ${bed.availabilityStatus}</p>
            <p><b>Price:</b> ${bed.pricePerDay}</p>
            <p><b>Floor Number:</b> ${bed.floorNumber}</p>
            <p><b>Room Number:</b> ${bed.roomNumber}</p>

            <form action="${pageContext.request.contextPath}/Book_Bed" method="post">
                <input type="hidden" name="BedId" value="${bed.bed_Id}">
                <input type="submit" class="book-btn" value="Book">
            </form>
        </div>
    </c:forEach>
</div>


<br>
</body>
</html>
