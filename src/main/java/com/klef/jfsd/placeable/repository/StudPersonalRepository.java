package com.klef.jfsd.placeable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.placeable.model.StudPersonal;

import jakarta.transaction.Transactional;


@Repository
public interface StudPersonalRepository  extends JpaRepository<StudPersonal, Integer>
{
	@Query("select s from StudPersonal s where s.email=?1 and s.password=?2")
	public StudPersonal checkStudentLogin(String email,String password);
	
	@Modifying
	@Transactional
	@Query("update StudPersonal s set s.password=?1 where s.id=?2")
	public int updateStudentPassword(String password,int stpid);
	
	@Modifying
	@Transactional
	@Query("update StudPersonal s set s.status=?1 where s.id=?2")
	public int updateStudentStatus(String status,int stpid);
	
	public StudPersonal findByEmail(String email);
	
	@Query("select s from StudPersonal s where s.status=?1")
	public List<StudPersonal> findByStatus(String status);
	
	@Query("select count(*) from StudPersonal s where s.status=?1")
	public long statuscount(String status);
	
	
}