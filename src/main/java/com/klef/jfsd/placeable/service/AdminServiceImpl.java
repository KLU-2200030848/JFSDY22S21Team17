package com.klef.jfsd.placeable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.placeable.model.Admin;
import com.klef.jfsd.placeable.model.ContactUs;
import com.klef.jfsd.placeable.model.Employer;
import com.klef.jfsd.placeable.model.Job;
import com.klef.jfsd.placeable.model.JobApplication;
import com.klef.jfsd.placeable.model.PlacementOfficer;
import com.klef.jfsd.placeable.model.StudEducation;
import com.klef.jfsd.placeable.model.StudPersonal;
import com.klef.jfsd.placeable.repository.AdminRepository;
import com.klef.jfsd.placeable.repository.ContactUsRepository;
import com.klef.jfsd.placeable.repository.EmployerRepository;
import com.klef.jfsd.placeable.repository.JobApplicationRepository;
import com.klef.jfsd.placeable.repository.JobRepository;
import com.klef.jfsd.placeable.repository.PlacementOfficerRepository;
import com.klef.jfsd.placeable.repository.StudEducationRepository;
import com.klef.jfsd.placeable.repository.StudPersonalRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminRepository adminrepsitory;
	
	@Autowired
	private PlacementOfficerRepository porepository;
	
	@Autowired
	private EmployerRepository emprepository;
	
	@Autowired
	private StudPersonalRepository studpersonalrepository;
	
	@Autowired
	private StudEducationRepository studeducationrepository;
	
	@Autowired
	private JobRepository jobrepository;
	
	@Autowired
	private JobApplicationRepository jobapprepository;
	
	@Autowired
	private ContactUsRepository contactusrepository;

	@Override
	public Admin checkadminlogin(String uname, String pwd) 
	{
		return adminrepsitory.checkadminlogin(uname, pwd);
	}

	@Override
	public List<PlacementOfficer> ViewAllOfficers() 
	{
		return porepository.findAll();
	}

	@Override
	public PlacementOfficer displayOfficerById(int pid) 
	{
		return porepository.findById(pid).get();
	}

	@Override
	public String deleteOfficer(int pid) 
	{
		porepository.deleteById(pid);
		return "Placement Officer Deleted Successfully";
	}

	@Override
	public String addOfficer(PlacementOfficer po) 
	{
		porepository.save(po);
		return "Placement Officer Added Successfully";
		
	}

	@Override
	public List<Employer> ViewAllEmployers() 
	{
		return emprepository.findAll();
	}

	@Override
	public Employer displayEmployerById(int eid) 
	{
		return emprepository.findById(eid).get();
	}

	@Override
	public String deleteEmployer(int eid) 
	{
		emprepository.deleteById(eid);
		return "Employer Deleted Successfully";
	}

	@Override
	public String updateempstatus(String status, int eid) 
	{
		int n = emprepository.updateempstatus(status, eid);
		
		if(n == 0)
		{
			return "Employer ID Not Found";
		}
		else
		{
			return "Employer Status Updated Successfully";
		}
	}

	@Override
	public String updateofficerstatus(String status, int pid) 
	{
		int n = porepository.updateofficerstatus(status, pid);
		
		if(n==0)
		{
			return "Placement Officer Not Found";
		}
		else
		{
			return "Placement Officer Status Updated Successfully";
		}
	}
	
	@Override
	public List<StudPersonal> viewallstudpersonal() 
	{
		return studpersonalrepository.findAll();
	}

	@Override
	public List<StudEducation> viewallstudeducation() 
	{
		return studeducationrepository.findAll();
	}

	@Override
	public List<Job> viewalljobs() 
	{
		return jobrepository.findAll();
	}

	@Override
	public long totaluserscount() 
	{
		long adcount = adminrepsitory.count();
		long pocount = porepository.count();
		long empcount = emprepository.count();
		long studcount = studpersonalrepository.count();
		long totalcount = adcount + pocount + empcount + studcount;
		return totalcount;
	}

	@Override
	public long pocount() 
	{
		return porepository.count();
	}

	@Override
	public long empcount() 
	{
		return emprepository.count();
	}

	@Override
	public long studcount() 
	{
		return studpersonalrepository.count();
	}

	@Override
	public long jobcount() 
	{
		return jobrepository.count();
	}

	@Override
	public long companies() 
	{
		return emprepository.companies();
	}

	@Override
	public long universities() 
	{
		return porepository.universities();
	}

	@Override
	public long jobappcount() 
	{
		return jobapprepository.count();
	}

	@Override
	public List<Employer> pendingEmployers() 
	{
		return emprepository.pendingEmployers();
	}

	@Override
	public long pendingcount() 
	{
		return emprepository.pendingcount();
	}

	@Override
	public StudPersonal getstudentbyid(int stpid) 
	{
		return studpersonalrepository.findById(stpid).get();
	}

	@Override
	public StudEducation getedubystpid(int stpid) 
	{
		return studeducationrepository.findByStpid(stpid);
	}

	@Override
	public List<JobApplication> viewalljobapps() 
	{	
		return jobapprepository.findAll();
	}

	@Override
	public String scontact(ContactUs contact) 
	{
		contactusrepository.save(contact);
		return "Response Submitted Successfully";
	}

	@Override
	public List<ContactUs> getAllContacts() 
	{	
		return contactusrepository.findAll();
	} 
	
}
