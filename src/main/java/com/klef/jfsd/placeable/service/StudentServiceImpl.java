package com.klef.jfsd.placeable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.placeable.model.Job;
import com.klef.jfsd.placeable.model.JobApplication;
import com.klef.jfsd.placeable.model.StudEducation;
import com.klef.jfsd.placeable.model.StudPersonal;
import com.klef.jfsd.placeable.repository.JobApplicationRepository;
import com.klef.jfsd.placeable.repository.JobRepository;
import com.klef.jfsd.placeable.repository.StudEducationRepository;
import com.klef.jfsd.placeable.repository.StudPersonalRepository;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudPersonalRepository stpRepository;
	
	@Autowired
	private StudEducationRepository steRepoistory;
	
	@Autowired
	private JobRepository jobRepository;
	
	@Autowired
	private JobApplicationRepository jobAppRepository;

	@Override
	public StudPersonal checkStudentLogin(String email, String password) {
		return stpRepository.checkStudentLogin(email, password);
	}

	@Override
	public String updateStudentPassword(String password, int stpid) {
		int n = stpRepository.updateStudentPassword(password, stpid);
		if(n!=0)
		{
			return "Your Password is Updated! Login to continue";
		}
		else 
		{
			return "Failed to Change Password";
		}
	}

	@Override
	public void updateStudentStatus(String status, int stpid) {
		stpRepository.updateStudentStatus(status, stpid);
	}

	@Override
	public List<Job> viewalljobs() {
		return jobRepository.findAll();
	}

	@Override
	public void updateStudent(StudPersonal student) {
		StudPersonal stp = stpRepository.findById(student.getId()).get();
		stp.setFirstname(student.getFirstname());
		stp.setLastname(student.getLastname());
		stp.setGender(student.getGender());
		stp.setDateofbirth(student.getDateofbirth());
		stp.setContact(student.getContact());
		stp.setAddress(student.getAddress());
		stp.setImage(student.getImage());
		
		stpRepository.save(stp);
	}

	@Override
	public StudPersonal getStudentById(int stpid) {
		return stpRepository.findById(stpid).get();
	}

	@Override
	public String setEduDetails(StudEducation ste) {
		steRepoistory.save(ste);
		return "Details Saved Successfully";
	}

	@Override
	public StudEducation getEduDetails(int stpid) {
		return steRepoistory.findByStpid(stpid);
	}

	@Override
	public List<Job> viewJobsRandomly() {
		return jobRepository.findJobsRandomly();
	}

	@Override
	public List<Job> viewJobsByDeadline() {
		return jobRepository.findJobsbyDeadline();
	}

	@Override
	public Job getJobById(int jid) {
		return jobRepository.findById(jid).get();
	}

	@Override
	public String applyjob(JobApplication jobapp) {
		jobAppRepository.save(jobapp);
		return "Job Applied Successfully";
	}

	@Override
	public JobApplication getjobApplication(int jobid, int stpid) {
		return jobAppRepository.findbyJobidandStpid(jobid, stpid);
	}

	@Override
	public JobApplication getJobAppbyId(int appid) {
		return jobAppRepository.findById(appid).get();
	}

	@Override
	public List<JobApplication> getJobsApplied(int stpid) {
		return jobAppRepository.findByStpid(stpid);
	}
	
}
