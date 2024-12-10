package com.klef.jfsd.placeable.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="po_table")
public class PlacementOfficer
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "po_id")
	private int id;
	@Column(name="po_email",length=50,nullable = false,unique = true)
	private String email;
	@Column(name="po_password",length=50, nullable = false)
	private String password;
	@Column(name = "po_name",length=30, nullable = false)
	private String name;
	@Column(name = "po_company",length=50, nullable = false)
	private String company;
	@Column(name = "po_contact",length = 20, nullable = false, unique = true)
	private String contact;
	@Column(name = "acc_status", length = 20, nullable = false)
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
