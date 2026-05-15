package com.Hospital_Management_System.Hospital_Management_System.repository;

import com.Hospital_Management_System.Hospital_Management_System.model.Appointment;
import com.Hospital_Management_System.Hospital_Management_System.model.BedBooking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BedBookingRepository extends JpaRepository<BedBooking, Integer> {
    List<BedBooking> findByUserId(int userId);
    List<BedBooking> findByStatus(String status);
}
