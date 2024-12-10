package com.klef.jfsd.placeable.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.placeable.model.Employer;
import com.klef.jfsd.placeable.model.Job;
import com.klef.jfsd.placeable.model.JobApplication;
import com.klef.jfsd.placeable.repository.EmployerRepository;
import com.klef.jfsd.placeable.repository.JobApplicationRepository;
import com.klef.jfsd.placeable.repository.JobRepository;

@Service
public class EmployerServiceImpl implements EmployerService
{
	@Autowired
	private EmployerRepository empRepository;
	@Autowired
	private JobRepository jobRepository;
	@Autowired
	private JobApplicationRepository jobappRepository;

	@Override
	public String employerRegistration(Employer emp) {
		empRepository.save(emp);
		return "Registration successful kindly wait for Admin approval";
	}

	@Override
	public Employer checkEmployerLogin(String email, String password) {
		return empRepository.checkEmployerLogin(email, password);
	}

	@Override
	public String updateEmployerDetails(Employer emp) {
		
		Employer e = empRepository.findById(emp.getId()).get();
		
		e.setName(emp.getName());
		e.setCompany(emp.getCompany());
		e.setContact(emp.getContact());
		
		empRepository.save(e);
		
		return "Details Updated Successfully";
	}

	@Override
	public String addJob(Job job) {
		jobRepository.save(job);
		return "Job posted Successfully";
	}

	@Override
	public List<Job> viewJobsPostedByEmployer(int empid) {
		return jobRepository.findByEmpid(empid);
	}

	@Override
	public List<Job> viewRecentJobs(int empid) {
		return jobRepository.recentJobsByEmpid(empid);
	}
	
	@Override
	public Map<Integer, Map<String, Long>> getJobStatusCounts() {
	    List<Object[]> counts = jobappRepository.getJobstatuscounts();
	    Map<Integer, Map<String, Long>> jobStatusCounts = new HashMap<>();

	    for (Object[] count : counts) {
	        int jobId = (int) count[0];
	        Long acceptedCount = (Long) count[1];
	        Long pendingCount = (Long) count[2];
	        Long rejectedCount = (Long) count[3];

	        Map<String, Long> statusMap = new HashMap<>();
	        statusMap.put("Accepted", acceptedCount);
	        statusMap.put("Pending", pendingCount);
	        statusMap.put("Rejected", rejectedCount);

	        jobStatusCounts.put(jobId, statusMap);
	    }
	    return jobStatusCounts;
	}

	@Override
	public Employer getEmployer(int eid) {
		return empRepository.findById(eid).get();
	}

	@Override
	public Job getJobById(int jid) {
		return jobRepository.findById(jid).get();
	}

	@Override
	public List<JobApplication> getJobApps(int jid) {
		return jobappRepository.findByJobid(jid);
	}

	@Override
	public int modifyAppStatus(int aid, String status) {
		return jobappRepository.modifyAppStatus(aid, status);
	}

}
