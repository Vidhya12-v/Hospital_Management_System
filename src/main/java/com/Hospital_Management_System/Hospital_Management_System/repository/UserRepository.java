package com.Hospital_Management_System.Hospital_Management_System.repository;

import com.Hospital_Management_System.Hospital_Management_System.model.User_Registration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User_Registration, Integer> {

    // For checking if email already exists during registration
    User_Registration findByEmail(String email);

    // For login
    User_Registration findByEmailAndPassword(String email, String password);

}
