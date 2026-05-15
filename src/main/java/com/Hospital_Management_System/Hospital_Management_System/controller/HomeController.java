package com.Hospital_Management_System.Hospital_Management_System.controller;
import com.Hospital_Management_System.Hospital_Management_System.model.Appointment;
import com.Hospital_Management_System.Hospital_Management_System.model.BedBooking;
import com.Hospital_Management_System.Hospital_Management_System.repository.AppointmentRepository;
import com.Hospital_Management_System.Hospital_Management_System.repository.BedBookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {
    @GetMapping("/")
    public String index() {
        return "index"; // loads index.jsp
    }

    @Autowired
    private AppointmentRepository AppointmentRepository;

    @Autowired
    private BedBookingRepository BedBookingRepository;

    @GetMapping("/register")
    public String RegisterPage(Model model) {
        model.addAttribute("bodyPage", "User_Register.jsp"); // content fragment
        model.addAttribute("currentPage", "login");
        model.addAttribute("navPage", "Home_Nav.jsp");
        model.addAttribute("pageCss", "form.css");
        return "layout"; // return layout.jsp
    }

    @GetMapping("/login")
    public String loginPage(Model model,HttpSession session) {
        model.addAttribute("bodyPage", "User_Login.jsp"); // content fragment
        model.addAttribute("currentPage", "login");
        model.addAttribute("navPage", "Home_Nav.jsp");
        model.addAttribute("pageCss", "form.css");

        Boolean loginError = (Boolean) session.getAttribute("loginError");
        if (loginError != null && loginError) {
            model.addAttribute("loginError", true);
            session.removeAttribute("loginError"); // remove it after using once ✅
        }
        return "layout"; // return layout.jsp
    }

    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // ✅ clear session
        return "redirect:/login"; // back to login page
    }



    @GetMapping("/viewAppointments")
    public String viewAppointments(Model model) {
        model.addAttribute("bodyPage", "View_Appointments.jsp"); // content fragment
        model.addAttribute("currentPage", "viewAppointments");
        model.addAttribute("navPage", "Admin_Nav.jsp");
        List<Appointment> appointments = AppointmentRepository.findAll();
        model.addAttribute("appointments", appointments);


        List<Appointment> pendingAppointments = AppointmentRepository.findByStatus("Pending");
        List<Appointment> approvedAppointments = AppointmentRepository.findByStatus("Approved");
        List<Appointment> rejectedAppointments = AppointmentRepository.findByStatus("Rejected");

        model.addAttribute("pendingAppointments", pendingAppointments);
        model.addAttribute("approvedAppointments", approvedAppointments);
        model.addAttribute("rejectedAppointments", rejectedAppointments);
        return "layout";
    }


    @PostMapping("/updateAppointmentStatus")
    public String updateStatus(@RequestParam("appointmentId") int appointmentId, Model model,
                               @RequestParam("action") String action) {

        Appointment appointment = AppointmentRepository.findById(appointmentId).orElse(null);
        model.addAttribute("bodyPage", "View_Appointments.jsp"); // content fragment
        model.addAttribute("currentPage", "viewAppointments");
        List<Appointment> pendingAppointments = AppointmentRepository.findByStatus("Pending");
        List<Appointment> approvedAppointments = AppointmentRepository.findByStatus("Approved");
        List<Appointment> rejectedAppointments = AppointmentRepository.findByStatus("Rejected");

        model.addAttribute("pendingAppointments", pendingAppointments);
        model.addAttribute("approvedAppointments", approvedAppointments);
        model.addAttribute("rejectedAppointments", rejectedAppointments);
        model.addAttribute("navPage", "Admin_Nav.jsp");

        if (appointment != null) {
            if ("approve".equalsIgnoreCase(action)) {
                appointment.setStatus("Approved");
            } else if ("reject".equalsIgnoreCase(action)) {
                appointment.setStatus("Rejected");
            }
            AppointmentRepository.save(appointment);
        }
        return "layout";
    }


    @GetMapping("/viewBedBookings")
    public String viewBedBookings(Model model) {
        model.addAttribute("bodyPage", "View_Bed_Bookings.jsp"); // content fragment
        model.addAttribute("currentPage", "viewBedBookings");
        model.addAttribute("navPage", "Admin_Nav.jsp");


        List<BedBooking> pendingBooking = BedBookingRepository.findByStatus("Pending");
        List<BedBooking> approvedBooking = BedBookingRepository.findByStatus("Approved");
        List<BedBooking> rejectedBooking = BedBookingRepository.findByStatus("Rejected");

        model.addAttribute("pendingBooking", pendingBooking);
        model.addAttribute("approvedBooking", approvedBooking);
        model.addAttribute("rejectedBooking", rejectedBooking);

        return "layout";
    }

    @PostMapping("/updateBookingStatus")
    public String updateBookingStatus(@RequestParam("BookingId") int BookingId, Model model,
                               @RequestParam("action") String action) {

        BedBooking Booking = BedBookingRepository.findById(BookingId).orElse(null);
        model.addAttribute("bodyPage", "View_Bed_Bookings.jsp"); // content fragment
        model.addAttribute("currentPage", "viewBedBookings");

        List<BedBooking> pendingBooking = BedBookingRepository.findByStatus("Pending");
        List<BedBooking> approvedBooking = BedBookingRepository.findByStatus("Approved");
        List<BedBooking> rejectedBooking = BedBookingRepository.findByStatus("Rejected");

        model.addAttribute("pendingBooking", pendingBooking);
        model.addAttribute("approvedBooking", approvedBooking);
        model.addAttribute("rejectedBooking", rejectedBooking);
        model.addAttribute("navPage", "Admin_Nav.jsp");

        if (Booking != null) {
            if ("approve".equalsIgnoreCase(action)) {
                Booking.setStatus("Approved");
            } else if ("reject".equalsIgnoreCase(action)) {
                Booking.setStatus("Rejected");
            }
            BedBookingRepository.save(Booking);
        }
        return "layout";
    }

}
