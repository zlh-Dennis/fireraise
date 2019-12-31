package com.fireraise.service;

import java.util.List;

import com.fireraise.pojo.Applicant;

public interface ApplicantService {
	
	Boolean insert(Applicant applicant);
    
    Applicant getOneById(String applicantId);
    List<Applicant> getAllByUserId(String userId);
    
    Boolean updateState(String applicantId, Boolean state);
    Boolean donation(String applicantId, Integer money);
    Boolean withdraw(String applicantId, Integer money);
    
}