package com.Hospital_Management_System.Hospital_Management_System.controller;

import com.Hospital_Management_System.Hospital_Management_System.model.*;
import com.Hospital_Management_System.Hospital_Management_System.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;

@Controller
public class DoctorController {

    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    private Add_BedRepository bedRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AppointmentRepository appointmentRepository;

    @Autowired
    private BedBookingRepository bedBookingRepository;

    @GetMapping("/View_Doctor")
    public String viewDoctors(Model model, HttpSession session) {
        if (session.getAttribute("loggedUser") == null) {
            return "layout"; // redirect to layout, which should handle login
        }

        // Set layout fragments
        model.addAttribute("bodyPage", "View_Doctor.jsp");
        model.addAttribute("currentPage", "viewDoctor");
        model.addAttribute("navPage", "User_Nav.jsp");

        // Fetch all doctors
        List<Doctor> doctors = doctorRepository.findAll();
        List<Map<String, String>> doctorListWithImage = new ArrayList<>();

        for (Doctor doc : doctors) {
            Map<String, String> map = new HashMap<>();
            map.put("doctorId", String.valueOf(doc.getDoctor_id()));
            map.put("name", doc.getName());
            map.put("hospitalName", doc.getHospitalName());
            map.put("specialization", doc.getSpecialization());
            map.put("experience", String.valueOf(doc.getExperience()));
            map.put("available_from", doc.getAvailable_from());
            map.put("available_to", doc.getAvailable_to());
            map.put("availabilityDays", doc.getAvailabilityDays());
            map.put("city", doc.getCity());
            map.put("state", doc.getState());

            // Convert byte[] image to Base64 string
            if (doc.getImage() != null) {
                String base64Image = Base64.getEncoder().encodeToString(doc.getImage());
                map.put("imageBase64", base64Image);
            } else {
                map.put("imageBase64", "");
            }

            doctorListWithImage.add(map);
        }

        model.addAttribute("DoctorList", doctorListWithImage);

        return "layout"; // layout.jsp will include View_Doctor.jsp in body
    }

    @GetMapping("/View_Bed")
    public String viewBeds(Model model, HttpSession session) {
        // Optional: Check if user is logged in
        model.addAttribute("bodyPage", "View_Bed.jsp");
        model.addAttribute("currentPage", "viewBed");
        model.addAttribute("navPage", "User_Nav.jsp");
        if (session.getAttribute("loggedUser") == null) {
            return "User_Login"; // or your login page
        }
        List<Add_Bed> beds = bedRepository.findAll();
        model.addAttribute("Add_Bed", beds); // matches JSP forEach
        return "layout"; // View_Bed.jsp.jsp
    }

    @PostMapping("/Book_Doctor")
    public String bookDoctorPage(@RequestParam("doctorId") int doctorId,
                                 Model model,
                                 HttpSession session) {

        model.addAttribute("bodyPage", "Book_Doctor.jsp");
        model.addAttribute("currentPage", "viewDoctor");
        model.addAttribute("navPage", "User_Nav.jsp");
        // Check if user is logged in
        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/User_Login";
        }

        // Get doctor details
        Doctor doctor = doctorRepository.findById(doctorId).orElse(null);
        if (doctor == null) {
            model.addAttribute("error", "Doctor not found!");
            return "User_Home"; // fallback
        }

        // Get logged-in user details
        User_Registration user = (User_Registration) session.getAttribute("loggedUser");

        model.addAttribute("doctor", doctor);
        model.addAttribute("user", user);

        return "layout"; // Book_Doctor.jsp
    }



    @PostMapping("/Confirm_Booking")
    public String confirmBooking(@RequestParam("doctorId") int doctorId,
                                 @RequestParam("userId") int userId,
                                 @RequestParam("appointmentDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate appointmentDate,
                                 @RequestParam("appointmentTime") @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime appointmentTime,
                                 Model model) {

        Doctor doctor = doctorRepository.findById(doctorId).orElse(null);
        User_Registration user = userRepository.findById(userId).orElse(null);

        if (doctor == null || user == null) {
            model.addAttribute("error", "Doctor or User not found!");
            return "Book_Doctor";
        }

        Appointment appointment = new Appointment();
        // Doctor snapshot
        appointment.setDoctorId(doctor.getDoctor_id());
        appointment.setDoctorName(doctor.getName());
        appointment.setDoctorHospital(doctor.getHospitalName());
        appointment.setDoctorSpecialization(doctor.getSpecialization());
        appointment.setDoctorAvailability(doctor.getAvailable_from() + " - " + doctor.getAvailable_to() + ", " + doctor.getAvailabilityDays());

        // User snapshot
        appointment.setUserId(user.getId());
        appointment.setUserName(user.getName());
        appointment.setUserEmail(user.getEmail());
        appointment.setUserMobile(user.getMobile());

        // Appointment details
        appointment.setAppointmentDate(appointmentDate);
        appointment.setAppointmentTime(appointmentTime);
        appointment.setStatus(appointment.getStatus());

        appointmentRepository.save(appointment);

        model.addAttribute("message", "Appointment booked successfully!");
        return "User_Home";
    }


    //book_bed
    @PostMapping("/Book_Bed")
    public String bookBedPage(@RequestParam("BedId") int BedId,
                                 Model model,
                                 HttpSession session) {

        model.addAttribute("bodyPage", "Book_Bed.jsp");
        model.addAttribute("currentPage", "viewBed");
        model.addAttribute("navPage", "User_Nav.jsp");

        // Check if user is logged in
        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/User_Login";
        }

        // Get doctor details
        Add_Bed bed = bedRepository.findById(BedId).orElse(null);
        if (bed == null) {
            model.addAttribute("error", "Doctor not found!");
            return "User_Home"; // fallback
        }

        // Get logged-in user details
        User_Registration user = (User_Registration) session.getAttribute("loggedUser");

        model.addAttribute("bed", bed);
        model.addAttribute("user", user);

        return "layout"; // Book_Doctor.jsp
    }


    @PostMapping("/Bed_Booking")
    public String bookBed(@RequestParam("BedId") int bedId,
                          @RequestParam("userId") int userId,
                          @RequestParam("appointmentDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate appointmentDate,
                          @RequestParam("appointmentTime") @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime appointmentTime,
                          Model model) {

        Add_Bed bed = bedRepository.findById(bedId).orElse(null);
        User_Registration user = userRepository.findById(userId).orElse(null);

        if (bed == null || user == null) {
            model.addAttribute("error", "Bed or User not found!");
            return "Book_Bed";
        }

        BedBooking booking = new BedBooking();

        // Bed snapshot
        booking.setBedId(bed.getBed_Id());
        booking.setHospitalName(bed.getHospitalName());
        booking.setWardNumber(bed.getWardNumber());
        booking.setBedNumber(bed.getBedNumber());
        booking.setFloorNumber(bed.getFloorNumber());
        booking.setRoomNumber(bed.getRoomNumber());
        booking.setBedType(bed.getBedType());
        booking.setAvailabilityStatus(bed.getAvailabilityStatus());

        // User snapshot
        booking.setUserId(user.getId());
        booking.setUserName(user.getName());
        booking.setUserEmail(user.getEmail());
        booking.setUserMobile(user.getMobile());

        // Appointment details
        booking.setAppointmentDate(appointmentDate);
        booking.setAppointmentTime(appointmentTime);

        bedBookingRepository.save(booking);
        model.addAttribute("message", "Bed booked successfully!");

        return "User_Home";
    }


}
