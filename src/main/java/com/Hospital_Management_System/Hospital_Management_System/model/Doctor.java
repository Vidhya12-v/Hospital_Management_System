package com.Hospital_Management_System.Hospital_Management_System.model;

import javax.persistence.*;

@Entity
@Table(name = "Add_Doctor")
public class Doctor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Doctor_Id") // matches DB column
    private int doctor_id;

    @Column(name = "Hospital_Name")
    private String hospitalName;

    @Column(name = "Name")
    private String name;

    @Column(name = "Email")
    private String email;

    @Column(name = "Mobile")
    private String mobile;

    @Column(name = "Gender")
    private String gender;

    @Column(name = "Specialization")
    private String specialization;

    @Column(name = "Experience")
    private int experience;

    @Column(name = "Qualifications")
    private String qualifications;

    @Column(name = "Available_From")
    private String available_from;

    @Column(name = "Available_To")
    private String available_to;

    @Column(name = "AvailabilityDays")
    private String availabilityDays;

    @Column(name = "State")
    private String state;

    @Column(name = "City")
    private String city;

    @Column(name = "Address")
    private String address;

    @Lob
    @Column(name = "Image")
    private byte[] image;

    // Getters and Setters
    public int getDoctor_id() { return doctor_id; }
    public void setDoctor_id(int doctor_id) { this.doctor_id = doctor_id; }

    public String getHospitalName() { return hospitalName; }
    public void setHospitalName(String hospitalName) { this.hospitalName = hospitalName; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }

    public int getExperience() { return experience; }
    public void setExperience(int experience) { this.experience = experience; }

    public String getQualifications() { return qualifications; }
    public void setQualifications(String qualifications) { this.qualifications = qualifications; }

    public String getAvailable_from() { return available_from; }
    public void setAvailable_from(String available_from) { this.available_from = available_from; }

    public String getAvailable_to() { return available_to; }
    public void setAvailable_to(String available_to) { this.available_to = available_to; }

    public String getAvailabilityDays() { return availabilityDays; }
    public void setAvailabilityDays(String availabilityDays) { this.availabilityDays = availabilityDays; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public byte[] getImage() { return image; }
    public void setImage(byte[] image) { this.image = image; }
}
