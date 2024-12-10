package com.klef.jfsd.placeable.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.placeable.model.Admin;
import com.klef.jfsd.placeable.model.ContactUs;
import com.klef.jfsd.placeable.model.Employer;
import com.klef.jfsd.placeable.model.Job;
import com.klef.jfsd.placeable.model.PlacementOfficer;
import com.klef.jfsd.placeable.model.StudEducation;
import com.klef.jfsd.placeable.model.StudPersonal;
import com.klef.jfsd.placeable.service.AdminService;
import com.klef.jfsd.placeable.service.EmployerService;
import com.klef.jfsd.placeable.service.PlacementOfficerService;
import com.klef.jfsd.placeable.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController 
{
	@Autowired
	private EmployerService empService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private PlacementOfficerService poService;
	
	@Autowired
	private StudentService studService;
	
	@GetMapping("/")
	public ModelAndView index()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@GetMapping("login")
	public ModelAndView login()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@PostMapping("checklogin")
	public ModelAndView checklogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Employer emp = empService.checkEmployerLogin(email, password);
		Admin admin = adminService.checkadminlogin(email, password);
		PlacementOfficer po = poService.checkpologin(email, password);
		StudPersonal student = studService.checkStudentLogin(email, password);
		
		if(admin != null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			long tuc = adminService.totaluserscount();
			long empc = adminService.empcount();
			long poc = adminService.pocount();
			long stc = adminService.studcount();
			long jc = adminService.jobcount();
			long jac = adminService.jobappcount();
			long cc = adminService.companies();
			long uc = adminService.universities();
			double dcc = (double)cc;
			double jcr = jc/dcc;
			double djc = (double)jc;
			double ajr = jac/djc;
			String jcratio = String.format("%.2f", jcr);
			String ajratio = String.format("%.2f", ajr);
			List<ContactUs> list = adminService.getAllContacts();
			long count = list.size();
			mv.addObject("tucount", tuc);
			mv.addObject("empcount", empc);
			mv.addObject("pocount", poc);
			mv.addObject("stcount", stc);
			mv.addObject("jcount", jc);
			mv.addObject("jacount", jac);
			mv.addObject("ccount", cc);
			mv.addObject("ucount", uc);
			mv.addObject("jcratio", jcratio);
			mv.addObject("ajratio", ajratio);
			mv.addObject("count", count);
			mv.setViewName("dashboard");
		}
		else if(emp != null)
		{
			if ("active".equals(emp.getStatus()))
			{
				HttpSession session = request.getSession();
				session.setAttribute("employer", emp);
				
				List<Job> joblist = empService.viewRecentJobs(emp.getId());
				Map<Integer, Map<String, Long>> counts = empService.getJobStatusCounts();
				mv.addObject("recentjobs", joblist);
				mv.addObject("statusCounts", counts);
				mv.setViewName("emphome");
			}
			else 
			{
				if("pending".equals(emp.getStatus()))
				{
					mv.addObject("message", "Your account is not yet verified");
				}
				else if("rejected".equals(emp.getStatus()))
				{
					mv.addObject("message", "Your account is rejected");
				}
				else 
				{
					mv.addObject("message", "Your account is disabled by Admin");
				}
				mv.setViewName("login");
			}
		}
		else if(po != null)
		{
			if("active".equals(po.getStatus()))
			{
				HttpSession session = request.getSession();
				session.setAttribute("placementofficer", po);
				long tscount = poService.countbyuniversity(po.getCompany());
				long incount = poService.statuscount("hold");
				mv.addObject("tscount", tscount);
				mv.addObject("acount", tscount-incount);
				mv.addObject("incount", incount);
				mv.setViewName("pohome");
			}
			else
			{
				mv.addObject("message", "Your account is disabled by Admin");
				mv.setViewName("login");
			}
		}
		else if(student != null)
		{
			if("active".equals(student.getStatus()))
			{
				HttpSession session = request.getSession();
				session.setAttribute("student", student);
				
				List<Job> joblist = studService.viewJobsRandomly();
				StudEducation education = studService.getEduDetails(student.getId());
				
				mv.addObject("joblist", joblist);
				mv.addObject("education", education);
				mv.setViewName("studenthome");
			}
			else if("hold".equals(student.getStatus()))
			{
				HttpSession session = request.getSession();
				session.setAttribute("student", student);
				
				mv.setViewName("changestudpwd");
			}
			else if("pending".equals(student.getStatus()))
			{
				HttpSession session = request.getSession();
				session.setAttribute("student", student);
				
				if(student.getLastname()==null) 
				{
					mv.setViewName("setupstud");
				}
				else
				{
					mv.setViewName("setstudedu");
					StudEducation education = studService.getEduDetails(student.getId());
			        mv.addObject("education", education);
				}
			}
			else
			{
				mv.addObject("message", "Your account is disabled by Admin");
				mv.setViewName("login");
			}
		}
		else 
		{
			mv.addObject("message","Login failed, Try Again!");
			mv.setViewName("login");
		}
		
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@GetMapping("sessionexpired")
	public ModelAndView sessionexpired()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sessionexpired");
		return mv;
	}
	
	@GetMapping("contactus")
	public ModelAndView contactus()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("contactus");
		return mv;
	}
	
	@PostMapping("postresponse")
	public ModelAndView postresponse(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		
		ContactUs contact = new ContactUs();
		contact.setName(name);
		contact.setMessage(message);
		contact.setEmail(email);
		
		String msg = adminService.scontact(contact);
		mv.setViewName("contactus");
		mv.addObject("msg", msg);
		return mv;
	} 
}
