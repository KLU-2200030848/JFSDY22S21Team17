package com.klef.jfsd.placeable.controller;

import java.security.SecureRandom;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.placeable.model.PlacementOfficer;
import com.klef.jfsd.placeable.model.StudEducation;
import com.klef.jfsd.placeable.model.StudPersonal;
import com.klef.jfsd.placeable.service.PlacementOfficerService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PlacementOfficerController
{
	@Autowired
	private PlacementOfficerService placementOfficerService;
	
	@Autowired 
	private JavaMailSender mailSender; 
	
	@GetMapping("pohome")
	public ModelAndView pohome(HttpSession session)
	{
		PlacementOfficer po = (PlacementOfficer) session.getAttribute("placementofficer");
		
		ModelAndView mv = new ModelAndView();
		long tscount = placementOfficerService.countbyuniversity(po.getCompany());
		long incount = placementOfficerService.statuscount("hold");
		mv.addObject("tscount", tscount);
		mv.addObject("acount", tscount-incount);
		mv.addObject("incount", incount);
		mv.setViewName("pohome");
		return mv;
	}
	  
	  @GetMapping("regstudent")
	  public ModelAndView regstudent()
	  {
		  ModelAndView mv = new ModelAndView();
		  mv.setViewName("regstudent");
		  return mv;
	  }
	  
	  @PostMapping("insertstudent")
	  public ModelAndView insertstudent(HttpServletRequest request, HttpSession session) throws Exception
	  {   
		  PlacementOfficer po = (PlacementOfficer) session.getAttribute("placementofficer");
		  
		  ModelAndView mv = new ModelAndView();
		  
		  String email = request.getParameter("email");
		  String password = generateRandomString(8);
		  String uid = request.getParameter("uid");
		  
		  StudPersonal student = new StudPersonal();
		  student.setEmail(email);
		  student.setPassword(password);
		  student.setStatus("hold");
		  placementOfficerService.addstudent(student);
		  
		  StudPersonal stud = placementOfficerService.getStudentByEmail(email);
		  
		  StudEducation education = new StudEducation();
		  education.setStpid(stud.getId());
		  education.setId(uid);
		  education.setUniversity(po.getCompany());
		  placementOfficerService.addEducation(education);
		  
		  MimeMessage mimeMessage = mailSender.createMimeMessage(); 
	      MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true); 
	      
		  helper.setTo(email); 
	      helper.setFrom("yaswanthguntha7@gmail.com"); 
	      String htmlContent =  
                  "<h3>Placeable Login Credentials</h3>" + 
                  "<p>" + "Welcome to placeable! Here are your primary credentials to access the portal. Now you can login to your account " +
                  "Enjoy the seemless connection between you and the companies...!" + "</p>" +
                  "<br/>" + "<strong>Tie with us, bind your future </strong>" + "<br/>" +
                  "<a href='http://localhost:2017/login'>Click here to Login</a>"+
                  "<p><strong>Email:</strong> " + email + "</p>" + 
                  "<p><strong>Your Password:</strong> " + password + "</p>"; 

          helper.setText(htmlContent, true); 
          mailSender.send(mimeMessage); 
		  
		  mv.setViewName("pohome");
		  return mv;
	  }
	  
	  private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	  private static final SecureRandom RANDOM = new SecureRandom();

	    public static String generateRandomString(int length) {
	        StringBuilder sb = new StringBuilder(length);
	        for (int i = 0; i < length; i++) {
	            sb.append(CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length())));
	        }
	        return sb.toString();
	    }
	  
	  @GetMapping("viewstudbyuniversity")
	  public ModelAndView viewstudbyuniversity(@RequestParam("university") String uniersity, @RequestParam("sid") int stpid)
	  {
		  ModelAndView mv = new ModelAndView("studentdetails");
		  List<StudEducation> studlist = placementOfficerService.viewstudbyuniversity(uniersity);
		  long stc = placementOfficerService.countbyuniversity(uniersity);
		  if(stpid!=0)
		  {
				StudPersonal stp = placementOfficerService.getstudentbyid(stpid);
				StudEducation ste = placementOfficerService.getedubystpid(stpid);
				mv.addObject("student",stp);
				mv.addObject("education",ste);
		  }
		  
		  mv.addObject("studlist", studlist);
		  mv.addObject("stcount", stc);
		  return mv;
	  }
	  
	  @GetMapping("viewstudprofile")
	  public ModelAndView viewstudprofile(@RequestParam("id") int spid)
	  {
		  ModelAndView mv = new ModelAndView();
		  StudPersonal studp = placementOfficerService.displayStudentById(spid);
		  mv.setViewName("viewstudprofile");
		  mv.addObject("studp",studp);
		  
		  return mv;
	  }
	  
	  @GetMapping("unresponcivestudents")
	  public ModelAndView unresponcivestudents(@RequestParam("univ") String u)
	  {
		  ModelAndView mv = new ModelAndView("unresponcivestudents");
		  List<Object[]> students = placementOfficerService.unresponciveStudents(u);
		  long count = placementOfficerService.statuscount("hold");
		  mv.addObject("students",students);
		  mv.addObject("incount",count);
		  return mv;
	  }
}
