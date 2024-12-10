package com.klef.jfsd.placeable.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;
import jakarta.persistence.Id;

@Entity
@Table(name = "employer_table") 
public class Employer 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "e_id")
	private int Id;
	@Column(name = "e_name",length = 50,nullable = false)
	private String name;
	@Column(name = "e_gender",length = 10,nullable = false)
	private String gender;
	@Column(name = "e_email",length = 50,nullable = false,unique = true)
	private String email;
	@Column(name = "e_company",length = 25,nullable = false)
	private String company;
	@Column(name = "e_contact",length = 10,nullable = false,unique = true)
	private String contact;
	@Column(name = "e_password",length = 20,nullable = false)
	private String password;
	@Column(name = "acc_status",length = 15,nullable = false)
	private String status;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
