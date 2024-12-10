package com.klef.jfsd.placeable.service;

import java.util.List;

import com.klef.jfsd.placeable.model.Job;
import com.klef.jfsd.placeable.model.JobApplication;
import com.klef.jfsd.placeable.model.StudEducation;
import com.klef.jfsd.placeable.model.StudPersonal;

public interface StudentService 
{
	public StudPersonal checkStudentLogin(String email,String password);
	public String updateStudentPassword(String password,int stpid);
	public void updateStudentStatus(String status,int stpid);
	public void updateStudent(StudPersonal student);
	public StudPersonal getStudentById(int stpid);
	
	public String setEduDetails(StudEducation ste);
	public StudEducation getEduDetails(int stpid);
	
	public List<Job> viewalljobs();
	public List<Job> viewJobsRandomly();
	public List<Job> viewJobsByDeadline();
	public Job getJobById(int jid);
	public String applyjob(JobApplication jobapp);
	public JobApplication getjobApplication(int jobid, int stpid);
	public JobApplication getJobAppbyId(int appid);
	public List<JobApplication> getJobsApplied(int stpid);
}
