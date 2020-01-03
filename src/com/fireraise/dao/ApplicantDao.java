package com.fireraise.dao;

import java.util.List;

import com.fireraise.pojo.Applicant;

public interface ApplicantDao {

    Boolean insert(Applicant applicant);
    
    Applicant getOneById(String applicantId);
    List<Applicant> getAllByUserId(String userId);
    List<Applicant> getAll();
    
    Boolean updateState(String applicantId, Byte state);
    Boolean donation(String applicantId, Integer money);
    Boolean withdraw(String applicantId, Integer money);
    
}