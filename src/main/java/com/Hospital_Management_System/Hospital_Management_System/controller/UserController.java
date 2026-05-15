package com.Hospital_Management_System.Hospital_Management_System.controller;

import com.Hospital_Management_System.Hospital_Management_System.model.Appointment;
import com.Hospital_Management_System.Hospital_Management_System.model.BedBooking;
import com.Hospital_Management_System.Hospital_Management_System.model.Doctor;
import com.Hospital_Management_System.Hospital_Management_System.model.User_Registration;
import com.Hospital_Management_System.Hospital_Management_System.repository.AppointmentRepository;
import com.Hospital_Management_System.Hospital_Management_System.repository.BedBookingRepository;
import com.Hospital_Management_System.Hospital_Management_System.repository.DoctorRepository;
import com.Hospital_Management_System.Hospital_Management_System.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    private AppointmentRepository appointmentRepository;

    @Autowired
    private BedBookingRepository bedBookingRepository;

    @PostMapping("/register")
    public String registerUser(

            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("mobile") String mobile,
            @RequestParam("gender") String gender,
            @RequestParam("bloodGroup") String bloodGroup,
            @RequestParam("age") int age,
            @RequestParam("dob") @DateTimeFormat(pattern = "yyyy-MM-dd") Date dob,
            @RequestParam("State") String state,
            @RequestParam("City") String city,
            @RequestParam("lat") double latitude,
            @RequestParam("long") double longitude,
            @RequestParam("location") String location,
            @RequestParam("image") MultipartFile imageFile
    ) throws IOException {

        if (userRepository.findByEmail(email) != null) {
            return "User_Register"; // email exists, optionally show error
        }

        User_Registration user = new User_Registration();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setMobile(mobile);
        user.setGender(gender);
        user.setBloodGroup(bloodGroup);
        user.setAge(age);
        user.setDob(dob);
        user.setState(state);
        user.setCity(city);
        user.setLatitude(latitude);
        user.setLongitude(longitude);
        user.setLocation(location);

        if (!imageFile.isEmpty()) {
            user.setImage(imageFile.getBytes());
        }

        userRepository.save(user);

        return "redirect:/"; // after registration go to home page
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        HttpSession session,
                        Model model) {

        User_Registration user = userRepository.findByEmailAndPassword(email, password);

        if (user != null) {
            // ✅ store user in session
            session.setAttribute("loggedUser", user);

            return "User_Home";  // goes to user home page
        } else {
            session.setAttribute("loginError", true);
            model.addAttribute("bodyPage", "User_Login.jsp"); // content fragment
            model.addAttribute("currentPage", "login");
            model.addAttribute("navPage", "Home_Nav.jsp");
            model.addAttribute("pageCss", "form.css");
            return "layout";
        }
    }

    @GetMapping("/View_Booked_Doctor")
    public String viewAppointments(Model model, HttpSession session) {
        model.addAttribute("bodyPage", "View_Booked_Doctor.jsp");
        model.addAttribute("currentPage", "viewBookedDoctor");
        model.addAttribute("navPage", "User_Nav.jsp");
        Object userObj = session.getAttribute("loggedUser");
        if (userObj == null) {
            return "User_Login";
        }

        // Assuming your loggedUser session contains a User_Registration object
        User_Registration user = (User_Registration) userObj;
        List<Appointment> appointments = appointmentRepository.findByUserId(user.getId());
        model.addAttribute("appointments", appointments);

        return "layout"; // JSP page name
    }

    @GetMapping("/View_Booked_Bed")
    public String viewBedBookings(Model model, HttpSession session) {
        model.addAttribute("bodyPage", "View_Booked_Bed.jsp");
        model.addAttribute("currentPage", "viewBookedBed");
        model.addAttribute("navPage", "User_Nav.jsp");
        User_Registration user = (User_Registration) session.getAttribute("loggedUser");
        if (user == null) {
            return "User_Login";
        }

        List<BedBooking> bookings = bedBookingRepository.findByUserId(user.getId());
        model.addAttribute("bookings", bookings);

        return "layout"; // JSP page
    }

    @GetMapping("/User_Home")
    public String showAddBedPage() {
        return "User_Home";
    }


    @GetMapping("/Emergency")
    public String showEmergencyPage(HttpSession session, Model model) {

        User_Registration user = (User_Registration) session.getAttribute("loggedUser");
        if (user == null) {
            return "User_Login"; // Redirect to login if user not logged in
        }

        // Pass user's latitude and longitude to JSP
        model.addAttribute("latitude", user.getLatitude());
        model.addAttribute("longitude", user.getLongitude());
        return "layout"; // Emergency.jsp
    }


}

