package com.klef.jfsd.placeable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.placeable.model.StudEducation;

public interface StudEducationRepository extends JpaRepository<StudEducation, String>
{
	public List<StudEducation> findByUniversity(String university);
	public StudEducation findByStpid(int stpid);
	
	@Query("select count(*) from StudEducation e where e.university=?1")
	public long countbyuniversity(String uni);
}
