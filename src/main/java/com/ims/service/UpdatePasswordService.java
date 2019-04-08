package com.ims.service;

public interface UpdatePasswordService {
	boolean validationPassword(String username,String oldPassword);
	boolean updatePassword(String username,String newPassword);
}