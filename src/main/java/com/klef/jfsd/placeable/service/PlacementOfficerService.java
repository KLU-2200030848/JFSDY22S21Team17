package com.klef.jfsd.placeable.service;

import java.util.List;

import com.klef.jfsd.placeable.model.PlacementOfficer;
import com.klef.jfsd.placeable.model.StudEducation;
import com.klef.jfsd.placeable.model.StudPersonal;

public interface PlacementOfficerService
{
	public PlacementOfficer checkpologin(String email, String pwd);
	
	public String addstudent(StudPersonal student);
	public String addEducation(StudEducation education);
	public List<StudPersonal> viewallstudents();
	public List<StudEducation> viewstudbyuniversity(String university);
	public StudPersonal displayStudentById(int spid);
	public StudPersonal getStudentByEmail(String mail);
	public StudPersonal getstudentbyid(int stpid);
	public StudEducation getedubystpid(int stpid);
	public long countbyuniversity(String uni);
	public List<Object[]> unresponciveStudents(String u);
	public long statuscount(String status);
}