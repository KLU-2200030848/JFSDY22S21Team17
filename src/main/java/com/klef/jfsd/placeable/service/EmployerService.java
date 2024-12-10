package com.klef.jfsd.placeable.service;

import java.util.List;
import java.util.Map;

import com.klef.jfsd.placeable.model.Employer;
import com.klef.jfsd.placeable.model.Job;
import com.klef.jfsd.placeable.model.JobApplication;

public interface EmployerService 
{
	public String employerRegistration(Employer emp);
	public Employer checkEmployerLogin(String email,String password);
	public String updateEmployerDetails(Employer emp);
	public Employer getEmployer(int eid);
	
	public String addJob(Job job);
	public List<Job> viewJobsPostedByEmployer(int empid);
	public List<Job> viewRecentJobs(int empid);
	public Map<Integer, Map<String, Long>> getJobStatusCounts();
	public Job getJobById(int jid);
	public List<JobApplication> getJobApps(int jid);
	public int modifyAppStatus(int aid,String status);
}
