package com.Hospital_Management_System.Hospital_Management_System.controller;

import com.Hospital_Management_System.Hospital_Management_System.model.Doctor;
import com.Hospital_Management_System.Hospital_Management_System.repository.DoctorRepository;
import com.Hospital_Management_System.Hospital_Management_System.model.Add_Bed;
import com.Hospital_Management_System.Hospital_Management_System.repository.Add_BedRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class AdminController {

    @GetMapping("/Admin_Login")
    public String showLoginPage(Model model, HttpSession session) {
        model.addAttribute("bodyPage", "Admin_Login.jsp");
        model.addAttribute("currentPage", "adminLogin");
        model.addAttribute("navPage", "Home_Nav.jsp");
        model.addAttribute("pageCss", "form.css");

        // Check for one-time error flag
        Boolean loginError = (Boolean) session.getAttribute("loginError");
        if (loginError != null && loginError) {
            model.addAttribute("loginError", true);
            session.removeAttribute("loginError"); // remove it after using once ✅
        }

        return "layout";
    }

    @PostMapping("/Admin_Login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session) {

        if ("Admin".equals(username) && "Admin".equals(password)) {
            session.setAttribute("adminUser", username);
            session.setAttribute("adminlogin", true);
            return "redirect:/Admin_Home"; // success
        } else {
            // Failed login → set session flag for one-time alert
            session.setAttribute("loginError", true);
            return "redirect:/Admin_Login"; // redirect to GET method
        }
    }



    @PostMapping("/Admin_logout")
    public String logout(HttpSession session) {
        session.invalidate(); // clear admin session
        return "redirect:/Admin_Login"; // back to login page
    }


    @Autowired
    private DoctorRepository doctorRepository;

    @GetMapping("/addDoctor")
    public String showAddDoctorPage(HttpSession session, Model model) {
        model.addAttribute("bodyPage", "Add_Doctor.jsp"); // content fragment
        model.addAttribute("currentPage", "addDoctor");
        model.addAttribute("navPage", "Admin_Nav.jsp");
        model.addAttribute("pageCss", "form.css");
        if(session.getAttribute("adminUser") == null){
            return "redirect:/Admin_Login";
        }
        return "layout";
    }

    @PostMapping("/addDoctor")
    public String addDoctor(@RequestParam("hospitalName") String hospitalName,
                            @RequestParam("name") String name,
                            @RequestParam("email") String email,
                            @RequestParam("mobile") String mobile,
                            @RequestParam("gender") String gender,
                            @RequestParam("specialization") String specialization,
                            @RequestParam("experience") int experience,
                            @RequestParam("qualifications") String qualifications,
                            @RequestParam("available_from") String available_from,
                            @RequestParam("available_to") String available_to,
                            @RequestParam("availabilityDays") String availabilityDays,
                            @RequestParam("State") String state,
                            @RequestParam("City") String city,
                            @RequestParam("Address") String address,
                            @RequestParam("Image") MultipartFile image,
                            Model model,
                            HttpSession session) throws IOException {

        if(session.getAttribute("adminUser") == null){
            return "redirect:/Admin_Login";
        }

        Doctor doctor = new Doctor();
        doctor.setHospitalName(hospitalName);
        doctor.setName(name);
        doctor.setEmail(email);
        doctor.setMobile(mobile);
        doctor.setGender(gender);
        doctor.setSpecialization(specialization);
        doctor.setExperience(experience);
        doctor.setQualifications(qualifications);
        doctor.setAvailable_from(available_from);
        doctor.setAvailable_to(available_to);
        doctor.setAvailabilityDays(availabilityDays);
        doctor.setState(state);
        doctor.setCity(city);
        doctor.setAddress(address);
        if (!image.isEmpty()) {
            doctor.setImage(image.getBytes());
        }

        doctorRepository.save(doctor);
        model.addAttribute("bodyPage", "Add_Doctor.jsp"); // content fragment
        model.addAttribute("currentPage", "addDoctor");
        model.addAttribute("navPage", "Admin_Nav.jsp");
        model.addAttribute("pageCss", "form.css");
        model.addAttribute("message", "Doctor added successfully!");
        return "layout";
    }

    @Autowired
    private Add_BedRepository addBedRepository;


    @GetMapping("/addBed")
    public String showAddBedPage(Model model) {
        model.addAttribute("bodyPage", "Add_Bed.jsp"); // content fragment
        model.addAttribute("currentPage", "addBed");
        model.addAttribute("navPage", "Admin_Nav.jsp");
        model.addAttribute("pageCss", "form.css");
        return "layout";
    }

    @GetMapping("/Admin_Home")
    public String Admin_Home(HttpSession session, Model model) {

        Boolean loginError = (Boolean) session.getAttribute("adminlogin");
        if (loginError != null && loginError) {
            model.addAttribute("adminlogin", true);
            session.removeAttribute("adminlogin"); // remove it after using once ✅
        }
        return "Admin_Home";
    }

    // To handle form submission
    @PostMapping("/addBed")
    public String saveBed(Add_Bed bed, Model model) {
        addBedRepository.save(bed);
        model.addAttribute("bodyPage", "Add_Bed.jsp"); // content fragment
        model.addAttribute("currentPage", "addBed");
        model.addAttribute("navPage", "Admin_Nav.jsp");
        model.addAttribute("pageCss", "form.css");
        model.addAttribute("message", "Bed details added successfully!");
        return "layout";
    }


}

