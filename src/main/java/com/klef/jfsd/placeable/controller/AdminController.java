package com.klef.jfsd.placeable.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.placeable.model.ContactUs;
import com.klef.jfsd.placeable.model.Employer;
import com.klef.jfsd.placeable.model.Job;
import com.klef.jfsd.placeable.model.JobApplication;
import com.klef.jfsd.placeable.model.PlacementOfficer;
import com.klef.jfsd.placeable.model.StudEducation;
import com.klef.jfsd.placeable.model.StudPersonal;
import com.klef.jfsd.placeable.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController 
{
	@Autowired
	private AdminService adminservice;
	
	@GetMapping("dashboard")
	public ModelAndView adminhome() 
	{
		ModelAndView mv = new ModelAndView();
		long tuc = adminservice.totaluserscount();
		long empc = adminservice.empcount();
		long poc = adminservice.pocount();
		long stc = adminservice.studcount();
		long jc = adminservice.jobcount();
		long jac = adminservice.jobappcount();
		long cc = adminservice.companies();
		long uc = adminservice.universities();
		double dcc = (double)cc;
		double jcr = jc/dcc;
		double djc = (double)jc;
		double ajr = jac/djc;
		String jcratio = String.format("%.2f", jcr);
		String ajratio = String.format("%.2f", ajr);
		List<ContactUs> list = adminservice.getAllContacts();
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
		return mv;
	}
	
	@GetMapping("officerreg")
	public ModelAndView officerreg()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("poregistration");
		return mv;
	}
	
	@PostMapping("insertofficer")
	public ModelAndView insertofficer(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		try 
		{
			String name = request.getParameter("pname");
			String email = request.getParameter("pemail");
			String pwd = request.getParameter("ppwd");
			String comp = request.getParameter("pcompany");
			String cont = request.getParameter("pcontact");
			String status = "active";
			
			PlacementOfficer po = new PlacementOfficer();
			po.setName(name);
			po.setEmail(email);
			po.setPassword(pwd);
			po.setCompany(comp);
			po.setContact(cont);
			po.setStatus(status);
			
			String msg = adminservice.addOfficer(po);
			
			mv.setViewName("dashboard");
			mv.addObject("message", msg);
		} 
		catch (Exception e) 
		{
			mv.setViewName("poregistration");
			String msg = "Contact or Email must be Unique";
			mv.addObject("message", msg);
		}
		
		return mv;
	}
	
	@GetMapping("viewallofficers")
	public ModelAndView viewallofficers()
	{
		ModelAndView mv = new ModelAndView();
		List<PlacementOfficer> polist = adminservice.ViewAllOfficers();
		long poc = adminservice.pocount();
		mv.setViewName("viewallofficers");
		mv.addObject("polist",polist);
		mv.addObject("pocount", poc);
		return mv;
	}
	
	@GetMapping("deleteofficer")
	public String deleteofficer(@RequestParam("id")  int pid)
	{
		adminservice.deleteOfficer(pid);
		
		return "redirect:/viewallofficers";
	}
	
	@GetMapping("displayofficer")
	public ModelAndView viewofficerbyid(@RequestParam("id")  int pid)
	{
		ModelAndView mv = new ModelAndView();
		PlacementOfficer po = adminservice.displayOfficerById(pid);
		mv.setViewName("viewofficerbyid");
		mv.addObject("po",po);
		
		return mv;
	}
	
	@GetMapping("updateofficerstatus")
	public String updateofficer(@RequestParam("status") String postatus, @RequestParam("id") int eid)
	{
		adminservice.updateofficerstatus(postatus, eid);
		
		return "redirect:/viewallofficers";
	}
	
	@GetMapping("viewallemployers")
	public ModelAndView viewallemployers()
	{
		ModelAndView mv = new ModelAndView();
		List<Employer> emplist = adminservice.ViewAllEmployers();
		long empc = adminservice.empcount();
		mv.setViewName("viewallemployers");
		mv.addObject("emplist",emplist);
		mv.addObject("empcount", empc);
		return mv;
	}
	
	@GetMapping("verifyemployers")
	public ModelAndView verifyemployers()
	{
		ModelAndView mv = new ModelAndView();
		List<Employer> emplist = adminservice.pendingEmployers();
		long empc = adminservice.pendingcount();
		mv.setViewName("verifyemployers");
		mv.addObject("emplist",emplist);
		mv.addObject("empcount", empc);
		return mv;
	}
	
	@GetMapping("displayemployer")
	public ModelAndView viewemployerbyid(@RequestParam("id")  int eid)
	{
		ModelAndView mv = new ModelAndView();
		Employer emp = adminservice.displayEmployerById(eid);
		mv.setViewName("viewempbyid");
		mv.addObject("emp",emp);
		
		return mv;
	}
	
	@GetMapping("deleteemployer")
	public String deleteemployer(@RequestParam("id")  int eid)
	{
		adminservice.deleteEmployer(eid);
		
		return "redirect:/viewallemployers";
	}
	
	@GetMapping("updateempstatus")
	public String updateemp(@RequestParam("status") String estatus, @RequestParam("id") int eid)
	{
		adminservice.updateempstatus(estatus, eid);
		
		return "redirect:/viewallemployers";
	}
	
	@GetMapping("verifyempstatus")
	public String verifyemp(@RequestParam("status") String estatus, @RequestParam("id") int eid)
	{
		adminservice.updateempstatus(estatus, eid);
		
		return "redirect:/verifyemployers";
	}
	
	@GetMapping("viewalljobs")
	public ModelAndView viewalljobs()
	{
		ModelAndView mv = new ModelAndView();
		List<Job> joblist = adminservice.viewalljobs();
		long jobc = adminservice.jobcount();
		mv.setViewName("viewalljobs");
		mv.addObject("joblist",joblist);
		mv.addObject("jcount", jobc);
		return mv;
	}
	
	@GetMapping("viewallstudents")
	public ModelAndView viewallstudents(@RequestParam("id") int stpid)
	{
		ModelAndView mv = new ModelAndView();
		List<StudPersonal> studlist = adminservice.viewallstudpersonal();
		long stc = adminservice.studcount();
		
		if(stpid!=0)
		{
			StudPersonal stp = adminservice.getstudentbyid(stpid);
			StudEducation ste = adminservice.getedubystpid(stpid);
			mv.addObject("student",stp);
			mv.addObject("education",ste);
		}
		
		mv.setViewName("viewallstudents");
		mv.addObject("studlist",studlist);
		mv.addObject("stcount", stc);
		return mv;
	}
	
	@GetMapping("viewallapplicants")
	public ModelAndView viewallapplicants()
	{
		ModelAndView mv = new ModelAndView();
		List<JobApplication> applist = adminservice.viewalljobapps();
		long appc = adminservice.jobappcount();
		mv.setViewName("viewallapplicants");
		mv.addObject("applist",applist);
		mv.addObject("acount", appc);
		return mv;
	}
	
	@GetMapping("viewallresponses")
	public ModelAndView viewallresponses()
	{
		ModelAndView mv = new ModelAndView();
		List<ContactUs> list = adminservice.getAllContacts();
		long count = list.size();
		mv.setViewName("viewallresponses");
		mv.addObject("list",list);
		mv.addObject("count", count);
		return mv;
	}
}
