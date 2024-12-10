package com.klef.jfsd.placeable.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.placeable.model.PlacementOfficer;

import jakarta.transaction.Transactional;

@Repository
public interface PlacementOfficerRepository extends JpaRepository<PlacementOfficer, Integer>
{
	@Query("select po from PlacementOfficer po where po.email=?1 and po.password=?2")
	public PlacementOfficer checkpologin(String email, String pwd);
	
	@Query("update PlacementOfficer po set po.status=?1 where po.id=?2")
	@Transactional
	@Modifying
	public int updateofficerstatus(String status, int pid);
	
	@Query("select count(distinct po.company) from PlacementOfficer po")
	public long universities();
}
