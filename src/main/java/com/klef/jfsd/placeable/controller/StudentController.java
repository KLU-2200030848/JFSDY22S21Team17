package com.klef.jfsd.placeable.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.placeable.model.Job;
import com.klef.jfsd.placeable.model.JobApplication;
import com.klef.jfsd.placeable.model.StudEducation;
import com.klef.jfsd.placeable.model.StudPersonal;
import com.klef.jfsd.placeable.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController 
{
	@Autowired
	private StudentService studService;
	
	@GetMapping("changestudpwd")
	public ModelAndView changestudpwd()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("changestudpwd");
		return mv;
	}
	
	@PostMapping("updatestudpwd")
	public ModelAndView updatestudpwd(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		StudPersonal student = (StudPersonal)session.getAttribute("student");
		
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		String message = "";
		
		if(password.equals(confirm) && !password.equals(student.getPassword()))
		{
			message = studService.updateStudentPassword(password, student.getId());
			if("hold".equals(student.getStatus()))
			{
				studService.updateStudentStatus("pending", student.getId());
			}
			mv.setViewName("login");
		}
		else
		{
			if(password.equals(student.getPassword())) 
			{
				message = "Password must be Changed";
			}
			else
			{
				message = "Confirm password mismatch";
			}
			mv.setViewName("changestudpwd");
		}
		
		mv.addObject("message", message);
		return mv;
	}
	
	@GetMapping("setupstud")
	public ModelAndView setupstud()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("setupstud");
		return mv;
	}
	
	@PostMapping("setstudent")
	public ModelAndView setstudent(HttpServletRequest request,@RequestParam("profile") MultipartFile file) throws Exception //initial update
	{
		ModelAndView mv = new ModelAndView();
		
		byte[] bytes = file.getBytes();
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		int id = Integer.parseInt(request.getParameter("id"));
		
		StudPersonal stud = studService.getStudentById(id);
		
		Blob prev = stud.getImage();
		
		StudPersonal stp = new StudPersonal();
		stp.setId(Integer.parseInt(request.getParameter("id")));
		stp.setFirstname(request.getParameter("fname"));
		stp.setLastname(request.getParameter("lname"));
		stp.setGender(request.getParameter("gender"));
		stp.setDateofbirth(request.getParameter("dob"));
		stp.setContact(request.getParameter("contact"));
		stp.setAddress(request.getParameter("address"));
		if(file.isEmpty()) 
		{
			stp.setImage(prev);
		}
		else
		{
			stp.setImage(blob);
		}
		
		studService.updateStudent(stp);
		StudPersonal student = studService.getStudentById(stp.getId());
		
		HttpSession session = request.getSession();
        session.setAttribute("student",student);
        
        StudEducation education = studService.getEduDetails(stp.getId());
        
        mv.addObject("education", education);
        if(student.getStatus().equals("pending"))
        {
        	mv.setViewName("setstudedu");
        }
        else 
        {
        	mv.setViewName("updatestudprofile");
        }
		return mv;
	}
	
	@GetMapping("setstudedu")
	public ModelAndView setstudedu()
	{
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("setstudedu");
		return mv;
	}
	
	@PostMapping("savedetails")
	public ModelAndView savedetails(HttpServletRequest request) 
	{
		ModelAndView mv = new ModelAndView();

		int id = Integer.parseInt(request.getParameter("stpid"));
		StudPersonal stud = studService.getStudentById(id);
		
		StudEducation edu = new StudEducation();
		edu.setId(request.getParameter("id"));
		edu.setStpid(Integer.parseInt(request.getParameter("stpid")));
		edu.setUniversity(request.getParameter("university"));
		edu.setDegree(request.getParameter("degree"));
		edu.setStream(request.getParameter("stream"));
		edu.setPassout(request.getParameter("passout"));
		edu.setCgpa(Double.parseDouble(request.getParameter("cgpa")));
		edu.setBacklogs(Integer.parseInt(request.getParameter("backlogs")));
		
		String msg = studService.setEduDetails(edu);
		List<Job> joblist = studService.viewJobsRandomly();
		StudEducation education = studService.getEduDetails(Integer.parseInt(request.getParameter("stpid")));
		mv.addObject("joblist", joblist);
		mv.addObject("education", education);
		mv.addObject("message", msg);
		if(stud.getStatus().equals("pending"))
        {
        	mv.setViewName("studenthome");
        }
        else 
        {
        	mv.setViewName("updatestudprofile");
        }
		studService.updateStudentStatus("active", edu.getStpid());
		return mv;
	}
	
	@GetMapping("studenthome")
	public ModelAndView studenthome(@RequestParam("sort") String type, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		StudPersonal student = (StudPersonal)session.getAttribute("student");
		StudEducation education = studService.getEduDetails(student.getId());
		
		ModelAndView mv = new ModelAndView();
		if("posted".equals(type))
		{
			List<Job> joblist = studService.viewalljobs();
			mv.addObject("joblist", joblist);
		}
		else if("deadline".equals(type))
		{
			List<Job> joblist = studService.viewJobsByDeadline();
			mv.addObject("joblist", joblist);
		}
		else
		{
			List<Job> joblist = studService.viewJobsRandomly();
			mv.addObject("joblist", joblist);
		}
		
		mv.addObject("student", student);
		mv.addObject("education", education);
		mv.setViewName("studenthome");
		return mv;
	}
	
	@GetMapping("displayprofile")
	public ResponseEntity<byte[]> displayprofile(@RequestParam("stid") int id) throws Exception
	{
		StudPersonal student = studService.getStudentById(id);
		
		byte [] imageBytes = null;
		imageBytes = student.getImage().getBytes(1, (int) student.getImage().length());
		
		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}
	
	@GetMapping("viewresume")
	public ResponseEntity<byte[]> viewresume(@RequestParam("appid") int id) throws Exception
	{
		JobApplication jobapp = studService.getJobAppbyId(id);
		
		byte [] imageBytes = null;
		imageBytes = jobapp.getResume().getBytes(1, (int) jobapp.getResume().length());
		
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_PDF).body(imageBytes);
	}
	
	@GetMapping("jobdetails")
	public ModelAndView jobdetails(@RequestParam("jobid") int id)
	{
		ModelAndView mv = new ModelAndView();
		Job job = studService.getJobById(id);
		mv.addObject("job", job);
		mv.setViewName("jobdetails");
		return mv;
	}
	
	@PostMapping("applyjob")
	public ModelAndView applyjob(HttpServletRequest request, @RequestParam("resume") MultipartFile file) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		byte[] bytes = file.getBytes();
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		
		String msg = "";
		int jobid = Integer.parseInt(request.getParameter("jobid"));
		int stpid = Integer.parseInt(request.getParameter("stpid"));
		
		JobApplication jobapp = new JobApplication();
		jobapp.setJobid(jobid);
		jobapp.setStpid(stpid);
		jobapp.setResume(blob);
		jobapp.setRole(request.getParameter("jobrole"));
		jobapp.setSname(request.getParameter("sname"));
		jobapp.setStatus("pending");
		
		JobApplication app = studService.getjobApplication(jobid, stpid);
		if(app==null) 
		{
			msg = studService.applyjob(jobapp);
		}
		else 
		{
			msg = "You already applied for this Job";
		}
		
		Job job = studService.getJobById(jobid);
		
		mv.addObject("job", job);
		mv.addObject("message", msg);
		mv.setViewName("jobdetails");
		return mv;
	}
	
	@GetMapping("jobsapplied")
	public ModelAndView jobsapplied(@RequestParam("sid") int id)
	{
		ModelAndView mv = new ModelAndView();
		
		List<JobApplication> applist = studService.getJobsApplied(id);
		
		mv.addObject("applist", applist);
		mv.setViewName("jobsapplied");
		return mv;
	}
	
	@GetMapping("editprofile")
	public ModelAndView editstudprofile(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		StudPersonal student = (StudPersonal)session.getAttribute("student");
		StudEducation education = studService.getEduDetails(student.getId());
		mv.addObject("student", student);
		mv.addObject("education", education);
		mv.setViewName("updatestudprofile");
		return mv;
	}
}
