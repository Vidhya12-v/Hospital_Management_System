package com.Hospital_Management_System.Hospital_Management_System.repository;

import com.Hospital_Management_System.Hospital_Management_System.model.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DoctorRepository extends JpaRepository<Doctor, Integer> {
}
