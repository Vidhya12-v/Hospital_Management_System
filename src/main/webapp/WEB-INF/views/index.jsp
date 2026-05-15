<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Hospital Management</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">
</head>

<body class="index-page">

  <header id="header" class="header sticky-top">

    <div class="branding d-flex align-items-center">

      <div class="container position-relative d-flex align-items-center justify-content-between">
        <a href="${pageContext.request.contextPath}/" class="logo d-flex align-items-center me-auto">
          <!-- Uncomment the line below if you also wish to use an image logo -->
          <!-- <img src="assets/img/logo.png" alt=""> -->
          <h1 class="sitename">Health Care</h1>
        </a>

        <nav id="navmenu" class="navmenu">
          <ul>
            <li><a href="${pageContext.request.contextPath}/" class="active">Home<br></a></li>

              <li> <a href="${pageContext.request.contextPath}/login">User Login</a></li>
              <li> <a href="${pageContext.request.contextPath}/Admin_Login">Admin Login</a></li>

          </ul>
          <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
      </div>

    </div>

  </header>

  <main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section light-background">

      <img src="assets/img/hero-bg.jpg" alt="" data-aos="fade-in">

      <div class="container position-relative">

        <div class="welcome position-relative" data-aos="fade-down" data-aos-delay="100">
          <h2>WELCOME TO HEALTH CARE</h2>
          <p>We are Connecting Patients and Hospitals Through Smarter Digital Management</p>
        </div><!-- End Welcome -->

        <div class="content row gy-4">
          <div class="col-lg-6 d-flex align-items-stretch">
            <div class="why-box" data-aos="zoom-out" data-aos-delay="200">
             <h3>Why Choose Our?</h3>
             <p>
               Our web-based hospital management system ensures seamless coordination between patients, doctors, and administrators. It simplifies appointment booking, bed availability tracking, and emergency hospital access while reducing paperwork. Secure login, quick approvals, and data-driven reports help improve operational accuracy and enhance patient satisfaction.
             </p>

              <div class="text-center">
                <a href="#about" class="more-btn"><span>Learn More</span> <i class="bi bi-chevron-right"></i></a>
              </div>
            </div>
          </div><!-- End Why Box -->

        </div><!-- End  Content-->

      </div>

    </section><!-- /Hero Section -->

    <!-- About Section -->
    <section id="about" class="about section">

      <div class="container">

        <div class="row gy-4 gx-5">

          <div class="col-lg-6 position-relative align-self-start" data-aos="fade-up" data-aos-delay="200">
            <img src="assets/img/about-us.jpg" class="img-fluid" alt="">

          </div>

          <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="100">
              <h3>About Us</h3>
              <p>
                Our web-based hospital management platform is designed to improve healthcare efficiency and patient engagement. Administrators can manage doctors, appointments, and bed availability, while users can easily book appointments and access emergency hospital details. The system ensures secure, streamlined, and transparent operations for modern healthcare needs.
              </p>
              <ul>
                <li>
                   <i class="fa-solid fa-user-doctor"></i>
                  <div>
                    <h5>Efficient Appointment Management</h5>
                    <p>Users can browse doctor profiles and book appointments with administrative approval, reducing delays and manual errors.</p>
                  </div>
                </li>
                <li>
                  <i class="fa-solid fa-procedures"></i>
                  <div>
                    <h5>Check Bed Availability</h5>
                    <p>Track hospital bed status and reserve beds instantly, ensuring timely care during emergencies and routine admissions.</p>
                  </div>
                </li>

              </ul>
          </div>

        </div>
      </div>

    </section><!-- /About Section -->

    <!-- Services Section -->
    <section id="services" class="services section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Services</h2>
        <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">





          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
              <div class="service-item position-relative">
                  <div class="icon">
                      <i class="fas fa-user-doctor"></i>
                  </div>
                  <a href="#" class="stretched-link">
                      <h3>Doctor Management</h3>
                  </a>
                  <p>Administrators can add, update, and manage doctor profiles efficiently, ensuring accurate information for patient appointments.</p>
                  <a href="#" class="stretched-link"></a>
              </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="500">
              <div class="service-item position-relative">
                  <div class="icon">
                      <i class="fas fa-procedures"></i>
                  </div>
                  <a href="#" class="stretched-link">
                      <h3>Bed Reservation</h3>
                  </a>
                  <p>Check hospital bed availability and reserve beds quickly, providing efficient support for patient admissions and emergencies.</p>
                  <a href="#" class="stretched-link"></a>
              </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="600">
              <div class="service-item position-relative">
                  <div class="icon">
                      <i class="fas fa-file-medical-alt"></i>
                  </div>
                  <a href="#" class="stretched-link">
                      <h3>Appointment Tracking</h3>
                  </a>
                  <p>Users can submit and track appointments with administrative approval, keeping records organized and reducing manual follow-ups.</p>
                  <a href="#" class="stretched-link"></a>
              </div>
          </div><!-- End Service Item -->


        </div>

      </div>

    </section><!-- /Services Section -->



  </main>

  <footer id="footer" class="footer light-background">

    <div class="container footer-top">
      <div class="row gy-4">
        <div class="col-lg-4 col-md-6 footer-about">
          <a href="index.html" class="logo d-flex align-items-center">
            <span class="sitename">HEALTH CARE</span>
          </a>
          <div class="footer-contact pt-3">
            <p>123 Health Avenue</p>
            <p>Chennai, Tamil Nadu 600034</p>
            <p class="mt-3"><strong>Phone:</strong> <span>+91 44 1234 5678</span></p>
            <p><strong>Email:</strong> <span>support@healthcare.com</span></p>
          </div>
          <div class="social-links d-flex mt-4">
            <a href=""><i class="bi bi-twitter"></i></a>
            <a href=""><i class="bi bi-facebook"></i></a>
            <a href=""><i class="bi bi-instagram"></i></a>
            <a href=""><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

        <div class="col-lg-3 col-md-3 footer-links">
          <h4>Useful Links</h4>
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Appointment</a></li>
            <li><a href="#">Privacy Policy</a></li>
          </ul>
        </div>

        <div class="col-lg-3 col-md-3 footer-links">
          <h4>Our Services</h4>
          <ul>
            <li><a href="#">Doctor Management</a></li>
            <li><a href="#">Bed Reservation</a></li>
            <li><a href="#">Appointment Tracking</a></li>
            <li><a href="#">Emergency Access</a></li>
            <li><a href="#">Reports & Analytics</a></li>
          </ul>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Support</h4>
          <ul>
            <li><a href="#">FAQs</a></li>
            <li><a href="#">Customer Help</a></li>
            <li><a href="#">Terms of Service</a></li>
            <li><a href="#">Technical Support</a></li>
            <li><a href="#">Feedback</a></li>
          </ul>
        </div>



      </div>
    </div>

    </div>



  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>