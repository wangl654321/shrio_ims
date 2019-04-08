package com.ims.service;


public interface SystemService {
	boolean sendEmail(String to, String subject, String msg);
	boolean sendSignUpMail(String path,String username,String email,String code);
}
