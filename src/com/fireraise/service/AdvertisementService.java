package com.fireraise.service;

import java.util.List;

import com.fireraise.pojo.Advertisement;

public interface AdvertisementService {
	Boolean insert(Advertisement advertisement);
	
	Advertisement getOneById(String advertisementId);
	Advertisement getOneByHurdles(String hurdlesId);
	List<Advertisement> getAllActicity();
	List<Advertisement> getAll();
	List<String> getAllHurdles();
	
	Boolean offline(String advertisementId);
}