package com.fireraise.service;

import java.util.List;

import com.fireraise.pojo.Applicant;

public interface ApplicantService {
	
	Boolean insert(Applicant applicant);
    
    Applicant getOneById(String applicantId);
    List<Applicant> getAllByUserId(String userId);
    List<Applicant> getAll();
    
    Boolean updateState(String applicantId, Byte state);
    Boolean donation(String applicantId, Integer money);
    Boolean withdraw(String applicantId, Integer money);
    
    List<Applicant> nameFilter(List<Applicant> applicants, String name);
    List<Applicant> phoneFilter(List<Applicant> applicants, String phone);
    List<Applicant> stateFilter(List<Applicant> applicants, Byte state);
    List<Applicant> dateFilter(List<Applicant> applicants, String beginDate, String endDate);
    
}