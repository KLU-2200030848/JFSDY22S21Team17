package com.klef.jfsd.placeable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.placeable.model.Job;

@Repository
public interface JobRepository extends JpaRepository<Job, Integer>
{
	public List<Job> findByEmpid(int empid);
	
	@Query("select j from Job j order by rand()")
	public List<Job> findJobsRandomly();
	
	@Query("select j from Job j order by j.endDate")
	public List<Job> findJobsbyDeadline();
	
	@Query("select j from Job j where j.empid=?1 order by j.postedtime desc limit 2")
	public List<Job> recentJobsByEmpid(int empid);
}
