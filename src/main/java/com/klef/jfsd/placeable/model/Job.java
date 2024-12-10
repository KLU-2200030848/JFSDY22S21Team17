package com.klef.jfsd.placeable.model;

import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "job_table")
public class Job 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "j_id")
	private int Id;
	@Column(name = "j_empid",nullable = false)
	private int empid;
	@Column(name="j_role",length = 25,nullable = false)
	private String role;
	@Column(name="j_type",length = 25,nullable = false)
	private String type;
	@Column(name="j_company",length = 25,nullable = false)
	private String company;
	@Column(name="j_industry",length = 25,nullable = false)
	private String industry;
	@Column(name="j_location",length = 25,nullable = false)
	private String location;
	@Column(name="j_description",length = 255,nullable = false)
	private String description;
	@Column(name="j_endDate",length = 25,nullable = false)
	private String endDate;
	@Column(name="j_stream",length = 50,nullable = false)
	private String stream;
	@Column(name="j_branch",length = 50,nullable = false)
	private String branch;
	@Column(name="j_batch",length = 50,nullable = false)
	private String batch;
	@Column(name="j_cgpa",length = 25,nullable = false)
	private String cgpa;
	@Column(name="j_backlogStatus",length = 25,nullable = false)
	private String backlogStatus;
	@CreationTimestamp
	@Column(name = "j_postedtime",nullable = false)
	private Date postedtime;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStream() {
		return stream;
	}
	public void setStream(String stream) {
		this.stream = stream;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getBatch() {
		return batch;
	}
	public void setBatch(String batch) {
		this.batch = batch;
	}
	public String getCgpa() {
		return cgpa;
	}
	public void setCgpa(String cgpa) {
		this.cgpa = cgpa;
	}
	public String getBacklogStatus() {
		return backlogStatus;
	}
	public void setBacklogStatus(String backlogStatus) {
		this.backlogStatus = backlogStatus;
	}
	public Date getPostedtime() {
		return postedtime;
	}
	public void setPostedtime(Date postedtime) {
		this.postedtime = postedtime;
	}
}
