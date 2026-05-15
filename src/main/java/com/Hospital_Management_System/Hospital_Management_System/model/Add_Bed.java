package com.Hospital_Management_System.Hospital_Management_System.model;

import javax.persistence.*;

@Entity
@Table(name = "Add_Bed")
public class Add_Bed {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Bed_Id;

    @Column(name = "Hospital_Name")
    private String HospitalName;

    private String WardNumber;
    private String BedNumber;
    private String BedType;
    private String AvailabilityStatus;
    private double PricePerDay;
    private String FloorNumber;
    private String RoomNumber;
    private String Description;

    // --- Getters and Setters ---
    public int getBed_Id() {
        return Bed_Id;
    }

    public void setBed_Id(int bed_Id) {
        Bed_Id = bed_Id;
    }

    public String getHospitalName() {
        return HospitalName;
    }

    public void setHospitalName(String hospitalName) {
        HospitalName = hospitalName;
    }

    public String getWardNumber() {
        return WardNumber;
    }

    public void setWardNumber(String wardNumber) {
        WardNumber = wardNumber;
    }

    public String getBedNumber() {
        return BedNumber;
    }

    public void setBedNumber(String bedNumber) {
        BedNumber = bedNumber;
    }

    public String getBedType() {
        return BedType;
    }

    public void setBedType(String bedType) {
        BedType = bedType;
    }

    public String getAvailabilityStatus() {
        return AvailabilityStatus;
    }

    public void setAvailabilityStatus(String availabilityStatus) {
        AvailabilityStatus = availabilityStatus;
    }

    public double getPricePerDay() {
        return PricePerDay;
    }

    public void setPricePerDay(double pricePerDay) {
        PricePerDay = pricePerDay;
    }

    public String getFloorNumber() {
        return FloorNumber;
    }

    public void setFloorNumber(String floorNumber) {
        FloorNumber = floorNumber;
    }

    public String getRoomNumber() {
        return RoomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        RoomNumber = roomNumber;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }
}
