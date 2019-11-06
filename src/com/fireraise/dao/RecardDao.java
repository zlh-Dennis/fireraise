package com.fireraise.dao;

import java.util.List;

import com.fireraise.pojo.Recard;

public interface RecardDao {

    Boolean insert(Recard recard);
    
    Recard getOneById(String recardId);
    List<Recard> getAllByUserId(String userId);
    
}