 <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/"
                       class="${currentPage eq 'home' ? 'active' : ''}">Home</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/login"
                       class="${currentPage eq 'login' ? 'active' : ''}">User Login</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/Admin_Login"
                       class="${currentPage eq 'adminLogin' ? 'active' : ''}">Admin Login</a>
                </li>
            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>