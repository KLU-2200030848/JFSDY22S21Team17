package com.klef.jfsd.placeable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.placeable.model.Employer;

import jakarta.transaction.Transactional;

@Repository
public interface EmployerRepository extends JpaRepository<Employer, Integer>
{
	@Query("select e from Employer e where e.email=?1 and e.password=?2")
	public Employer checkEmployerLogin(String email, String password);
	
	@Query("update Employer e set e.status=?1 where e.id=?2")
	@Modifying
	@Transactional
	public int updateempstatus(String status, int eid);
	
	@Query("select e from Employer e where e.status='pending'")
	public List<Employer> pendingEmployers();
	
	@Query("select count(distinct e.company) from Employer e")
	public long companies();
	
	@Query("select count(*) from Employer e where e.status='pending'")
	public long pendingcount();
}
