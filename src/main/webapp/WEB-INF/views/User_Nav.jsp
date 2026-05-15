<ul>
    <li>
        <a href="${pageContext.request.contextPath}/User_Home"
           class="${currentPage eq 'userHome' ? 'active' : ''}">Home</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/View_Doctor"
           class="${currentPage eq 'viewDoctor' ? 'active' : ''}">View Doctor</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/View_Bed"
           class="${currentPage eq 'viewBed' ? 'active' : ''}">View Bed</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/View_Booked_Doctor"
           class="${currentPage eq 'viewBookedDoctor' ? 'active' : ''}">Doctor Appointment</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/View_Booked_Bed"
           class="${currentPage eq 'viewBookedBed' ? 'active' : ''}">Bed Booked</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/Nearby_Hospital"
           class="${currentPage eq 'nearbyHospital' ? 'active' : ''}">Emergency</a>
    </li>
     <li>
            <a href="${pageContext.request.contextPath}/">Logout</a>
     </li>
</ul>
<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
