package com.klef.jfsd.placeable.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.placeable.model.ContactUs;

@Repository
public interface ContactUsRepository extends JpaRepository<ContactUs, Integer>
{

}
