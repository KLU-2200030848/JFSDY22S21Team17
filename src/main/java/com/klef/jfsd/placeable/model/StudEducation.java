package com.klef.jfsd.placeable.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "ste_table")
public class StudEducation 
{
	@Id
	@Column(name = "ste_uid",length = 15)
	private String id;
	@Column(name = "ste_stpid",unique = true,nullable = false)
	private int stpid;
	@Column(name = "ste_university",length = 50,nullable = false)
	private String university;
	@Column(name = "ste_degree",length = 50)
	private String degree;
	@Column(name = "ste_stream",length = 50)
	private String stream;
	@Column(name = "ste_cgpa")
	private double cgpa;
	@Column(name = "ste_passout",length = 25)
	private String passout;
	@Column(name = "ste_backlogs")
	private int backlogs;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getStpid() {
		return stpid;
	}
	public void setStpid(int stpid) {
		this.stpid = stpid;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getStream() {
		return stream;
	}
	public void setStream(String stream) {
		this.stream = stream;
	}
	public double getCgpa() {
		return cgpa;
	}
	public void setCgpa(double cgpa) {
		this.cgpa = cgpa;
	}
	public String getPassout() {
		return passout;
	}
	public void setPassout(String passout) {
		this.passout = passout;
	}
	public int getBacklogs() {
		return backlogs;
	}
	public void setBacklogs(int backlogs) {
		this.backlogs = backlogs;
	}
}
