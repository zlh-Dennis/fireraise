package com.fireraise.test;

import com.fireraise.util.IdGeneration;
import com.fireraise.util.UUIDGenerator;

public class UUIDTest {

	public static void main(String[] args) {
		UUIDGenerator uuid = new UUIDGenerator();
		System.out.println(uuid.getUUID(5));
		System.out.println(uuid.getUUID(6));
		System.out.println(uuid.getUUID(7));

		System.out.println(IdGeneration.pictureID());
		System.out.println(IdGeneration.advertisementID());
		System.out.println(IdGeneration.hurdlesID());
		System.out.println(IdGeneration.managerID());
	}

}