package com.klef.jfsd.placeable.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.placeable.model.Employer;
import com.klef.jfsd.placeable.model.Job;
import com.klef.jfsd.placeable.model.JobApplication;
import com.klef.jfsd.placeable.service.EmployerService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class EmployerController 
{
	@Autowired
	private EmployerService empService;
	
	@GetMapping("emphome")
	public ModelAndView emphome(HttpSession session)
	{
		Employer emp = (Employer) session.getAttribute("employer");
		List<Job> joblist = empService.viewRecentJobs(emp.getId());
		Map<Integer, Map<String, Long>> counts = empService.getJobStatusCounts();
		ModelAndView mv = new ModelAndView();
		mv.addObject("recentjobs", joblist);
		mv.addObject("statusCounts", counts);
		mv.setViewName("emphome");
		return mv;
	}
	
	@GetMapping("empregistration")
	public String empregistration(Model m)
	{
		m.addAttribute("employer", new Employer());
		return "empregistration";
	}
	
	@PostMapping("insertemp")
	public ModelAndView insertemp(@ModelAttribute("employer") Employer emp) 
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("empregistration");
		String msg = empService.employerRegistration(emp);
		mv.addObject("message", msg);
		return mv;
	}
	
	@PostMapping("updateempdetails")
	public ModelAndView updateempdetails(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		int id = Integer.parseInt(request.getParameter("eid"));
		String name = request.getParameter("ename");
		String company = request.getParameter("ecompany");
		String contact = request.getParameter("econtact");
		
		Employer e = new Employer();
		
		e.setId(id);
		e.setName(name);
		e.setCompany(company);
		e.setContact(contact);
		
		String msg = empService.updateEmployerDetails(e);
		
		Employer emp = empService.getEmployer(id);
		HttpSession session = request.getSession();
		session.setAttribute("employer", emp);
		
		List<Job> joblist = empService.viewRecentJobs(emp.getId());
		
		mv.addObject("recentjobs", joblist);
		mv.setViewName("emphome");
		mv.addObject("message",msg);
		
		return mv;
	}
	
	@GetMapping("addjob")
	public String addjob(Model m, HttpSession session)
	{
		Employer emp = (Employer) session.getAttribute("employer");
		if(emp==null)
		{
			return "redirect:/sessionexpired";
		}
		
		Job job = new Job();
		job.setEmpid(emp.getId());
		job.setCompany(emp.getCompany());
		
		m.addAttribute("job", job);
		
		return "addjob";
	}
	
	@PostMapping("postjob")
	public ModelAndView postjob(@ModelAttribute("job") Job j) 
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addjob");
		String msg = empService.addJob(j);
		mv.addObject("message", msg);
		return mv;
	}
	
	@GetMapping("viewjobsbyemp")
	public ModelAndView viewjobsbyemp(@RequestParam("sort") String type ,HttpSession session)
	{
		Employer emp = (Employer) session.getAttribute("employer");
		List<Job> joblist = empService.viewJobsPostedByEmployer(emp.getId());
		if("desc".equals(type)) {
			Collections.reverse(joblist);
		}
		Map<Integer, Map<String, Long>> counts = empService.getJobStatusCounts();
		ModelAndView mv = new ModelAndView();
		mv.addObject("joblist", joblist);
		mv.addObject("statusCounts", counts);
		mv.setViewName("viewjobsbyemp");
		return mv;
	}
	
	@GetMapping("jobapplicants")
	public ModelAndView jobapplicants(@RequestParam("jid") int id)
	{
		ModelAndView mv = new ModelAndView();
		
		List<JobApplication> applist = empService.getJobApps(id);
		Job job = empService.getJobById(id);
		Map<Integer, Map<String, Long>> counts = empService.getJobStatusCounts();
		
		mv.addObject("job", job);
		mv.addObject("applist", applist);
		mv.addObject("statusCounts", counts);
		mv.setViewName("jobapplicants");
		return mv;
	}
	
	@GetMapping("verifyappstatus")
	public String verifyappstatus(@RequestParam("aid") int id, @RequestParam("astatus") String status, @RequestParam("jid") int job) 
	{
		empService.modifyAppStatus(id, status);
		return "redirect:/jobapplicants?jid="+job;
	}
}
