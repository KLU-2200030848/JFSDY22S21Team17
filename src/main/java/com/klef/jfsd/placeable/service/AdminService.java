package com.klef.jfsd.placeable.service;

import java.util.List;

import com.klef.jfsd.placeable.model.Admin;
import com.klef.jfsd.placeable.model.ContactUs;
import com.klef.jfsd.placeable.model.Employer;
import com.klef.jfsd.placeable.model.Job;
import com.klef.jfsd.placeable.model.JobApplication;
import com.klef.jfsd.placeable.model.PlacementOfficer;
import com.klef.jfsd.placeable.model.StudEducation;
import com.klef.jfsd.placeable.model.StudPersonal;

public interface AdminService 
{
	// Admin
	public Admin checkadminlogin(String uname, String pwd);
	public long totaluserscount();
	
	// PlacementOfficer
	public List<PlacementOfficer> ViewAllOfficers();
	public PlacementOfficer displayOfficerById(int pid);
	public String deleteOfficer(int pid);
	public String addOfficer(PlacementOfficer po);
	public String updateofficerstatus(String status, int pid);
	public long pocount();
	
	// Employer
	public List<Employer> ViewAllEmployers();
	public Employer displayEmployerById(int eid);
	public String deleteEmployer(int eid);
	public String updateempstatus(String status, int eid);
	public List<Employer> pendingEmployers();
	public long empcount();
	public long pendingcount();
	
	// Student
	public List<StudPersonal> viewallstudpersonal();
	public List<StudEducation> viewallstudeducation();
	public StudPersonal getstudentbyid(int stpid);
	public StudEducation getedubystpid(int stpid);
	public long studcount();
	
	// Job
	public List<Job> viewalljobs();
	public long jobcount();
	public List<JobApplication> viewalljobapps();
	
	public long jobappcount();
	public long companies();
	public long universities();
	
	public String scontact(ContactUs contact);
	public List<ContactUs> getAllContacts();

}