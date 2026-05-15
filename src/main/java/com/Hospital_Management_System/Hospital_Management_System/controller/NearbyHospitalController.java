package com.Hospital_Management_System.Hospital_Management_System.controller;

import com.Hospital_Management_System.Hospital_Management_System.model.Hospital;
import com.Hospital_Management_System.Hospital_Management_System.model.User_Registration;
import com.Hospital_Management_System.Hospital_Management_System.service.HospitalService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class NearbyHospitalController {

    @Autowired
    private HospitalService hospitalService;

    @GetMapping("/Nearby_Hospital")
    public String nearbyHospital(HttpSession session, Model model) {
        model.addAttribute("bodyPage", "Emergency.jsp");
        model.addAttribute("currentPage", "nearbyHospital");
        model.addAttribute("navPage", "User_Nav.jsp");
        // Get logged-in user
        User_Registration loggedUser = (User_Registration) session.getAttribute("loggedUser");
        if (loggedUser == null) {
            return "redirect:/User_Login"; // or your login page
        }

        double userLat = loggedUser.getLatitude();
        double userLon = loggedUser.getLongitude();

        // Fetch nearby hospitals using the service
        List<Hospital> nearHospitals = hospitalService.fetchNearbyHospitals(userLat, userLon);

        // Pass data to JSP
        model.addAttribute("userLat", userLat);
        model.addAttribute("userLon", userLon);
        model.addAttribute("hospitalsJson", new Gson().toJson(nearHospitals));

        return "layout"; // JSP page
    }
}
