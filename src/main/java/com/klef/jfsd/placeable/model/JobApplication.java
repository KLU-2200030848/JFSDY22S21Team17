package com.klef.jfsd.placeable.model;

import java.sql.Blob;
import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "jobapp_table")
public class JobApplication 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "app_id")
	private int id;
	@Column(name = "app_jobid",nullable = false)
	private int jobid;
	@Column(name = "app_jobrole",nullable = false)
	private String role;
	@Column(name = "app_stpid",length = 50,nullable = false)
	private int stpid;
	@Column(name = "app_sname",length = 50,nullable = false)
	private String sname;
	@Column(name = "app_resume",nullable = false)
	private Blob resume;
	@CreationTimestamp
	@Column(name = "app_appliedtime",nullable = false)
	private Date appliedtime;
	@Column(name = "app_status",length = 10,nullable = false)
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getJobid() {
		return jobid;
	}
	public void setJobid(int jobid) {
		this.jobid = jobid;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getStpid() {
		return stpid;
	}
	public void setStpid(int stpid) {
		this.stpid = stpid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public Blob getResume() {
		return resume;
	}
	public void setResume(Blob resume) {
		this.resume = resume;
	}
	public Date getAppliedtime() {
		return appliedtime;
	}
	public void setAppliedtime(Date appliedtime) {
		this.appliedtime = appliedtime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
