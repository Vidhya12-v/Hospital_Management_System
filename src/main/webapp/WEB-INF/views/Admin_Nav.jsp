<ul>
    <li>
        <a href="${pageContext.request.contextPath}/Admin_Home"
           class="${currentPage eq 'adminHome' ? 'active' : ''}">Home</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/addDoctor"
           class="${currentPage eq 'addDoctor' ? 'active' : ''}">Add Doctor</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/addBed"
           class="${currentPage eq 'addBed' ? 'active' : ''}">Add Bed</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/viewAppointments"
           class="${currentPage eq 'viewAppointments' ? 'active' : ''}">View Doctor Appointments</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/viewBedBookings"
           class="${currentPage eq 'viewBedBookings' ? 'active' : ''}">View Bed Booking</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/"
           class="${currentPage eq 'logout' ? 'active' : ''}">Logout</a>
    </li>
</ul>
<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
