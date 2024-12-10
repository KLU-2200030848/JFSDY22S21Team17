package com.klef.jfsd.placeable.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "stp_table")
public class StudPersonal 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "stp_id")
	private int id;
	@Column(name = "stp_fname",length = 25)
	private String firstname;
	@Column(name = "stp_lname",length = 25)
	private String lastname;
	@Column(name = "stp_gender",length = 25)
	private String gender;
	@Column(name = "stp_dob",length = 25)
	private String dateofbirth;
	@Column(name = "stp_email",length = 30,nullable = false,unique = true)
	private String email;
	@Column(name = "stp_password",length = 25,nullable = false)
	private String password;
	@Column(name = "stp_contact",length = 20,unique = true)
	private String contact;
	@Column(name = "stp_address",length = 200)
	private String address;
	@Column(name = "stp_image")
	private Blob image;
	@Column(name = "acc_status",length = 25,nullable = false)
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
