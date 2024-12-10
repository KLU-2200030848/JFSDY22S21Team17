package com.klef.jfsd.placeable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.placeable.model.JobApplication;

import jakarta.transaction.Transactional;

public interface JobApplicationRepository extends JpaRepository<JobApplication, Integer>
{
	@Query("select count(*) from JobApplication ja where ja.jobid=?1 and ja.status=?2")
	public long jobstatuscount(int jobid,String status);
	
	@Query("select ja from JobApplication ja where ja.jobid=?1 and ja.stpid=?2")
	public JobApplication findbyJobidandStpid(int jobid, int stpid);
	
	@Query("select j.jobid," + 
		   "sum(case when j.status = 'accepted' then 1 else 0 end) as acceptcount," + 
		   "sum(case when j.status = 'pending' then 1 else 0 end) as pendingcount," + 
		   "sum(case when j.status = 'rejected' then 1 else 0 end) as rejectcount " +
		   "from JobApplication j group by j.jobid")
	public List<Object[]> getJobstatuscounts();
	
	public List<JobApplication> findByStpid(int stpid);
	
	public List<JobApplication> findByJobid(int jobid);
	
	@Query("update JobApplication ja set ja.status=?2 where ja.id=?1")
	@Modifying
	@Transactional
	public int modifyAppStatus(int id, String status);
}
