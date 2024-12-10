package com.klef.jfsd.placeable.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.placeable.model.PlacementOfficer;
import com.klef.jfsd.placeable.model.StudEducation;
import com.klef.jfsd.placeable.model.StudPersonal;
import com.klef.jfsd.placeable.repository.PlacementOfficerRepository;
import com.klef.jfsd.placeable.repository.StudEducationRepository;
import com.klef.jfsd.placeable.repository.StudPersonalRepository;

@Service
public class PlacementOfficerServiceImpl implements PlacementOfficerService
{
	@Autowired
	private PlacementOfficerRepository placementofficerRepository;
	
	@Autowired
	private StudPersonalRepository studPersonalRepository;
	
	@Autowired
	private StudEducationRepository studEducationRepository;
	
	@Override
	public PlacementOfficer checkpologin(String email, String pwd) {
		return placementofficerRepository.checkpologin(email, pwd);
	}

	@Override
	public String addstudent(StudPersonal student) {
		studPersonalRepository.save(student);
		return "Student Added Successfully";
	}

	@Override
	public String addEducation(StudEducation education) {
		studEducationRepository.save(education);
		return "Details Added Successfully";
	}

	@Override
	public List<StudPersonal> viewallstudents() {
		return (List<StudPersonal>) studPersonalRepository.findAll();
	}
	
	@Override
	public List<StudEducation> viewstudbyuniversity(String university) {
		return studEducationRepository.findByUniversity(university);
	}

	@Override
	public StudPersonal displayStudentById(int spid)
	{
		return studPersonalRepository.findById(spid).get();
	}

	@Override
	public StudPersonal getStudentByEmail(String mail) {
		return studPersonalRepository.findByEmail(mail);
	}

	@Override
	public StudPersonal getstudentbyid(int stpid) 
	{
		return studPersonalRepository.findById(stpid).get();
	}

	@Override
	public StudEducation getedubystpid(int stpid) 
	{
		return studEducationRepository.findByStpid(stpid);
	}

	@Override
	public long countbyuniversity(String uni) {
		return studEducationRepository.countbyuniversity(uni);
	}
	
	@Override
	public List<Object[]> unresponciveStudents(String u) {
        List<StudPersonal> personalList = studPersonalRepository.findByStatus("hold");
        List<StudEducation> educationList = studEducationRepository.findByUniversity(u);

        List<Object[]> mappedStudents = new ArrayList<>();

        for (StudPersonal personal : personalList) {
    	   for (StudEducation education : educationList) {
                if (personal.getId() == education.getStpid()) {
                    Object[] mappedStudent = new Object[]{
                        personal.getId(),
                        personal.getEmail(),
                        personal.getStatus(),
                        education.getId(),
                        education.getUniversity()
                    };
                    mappedStudents.add(mappedStudent);
                }
            }
        }
        return mappedStudents;
    }

	@Override
	public long statuscount(String status) {
		return studPersonalRepository.statuscount(status);
	}
	
}
