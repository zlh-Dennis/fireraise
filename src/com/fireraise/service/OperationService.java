package com.fireraise.service;

import java.io.IOException;
import java.util.List;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

public interface OperationService {
	
	public static final String MAIL_FROM = "zhao_linhua@foxmail.com";// 指明邮件的发件人
	public static final String PASSWORD_MAIL = "dzwpaipkgtfajiij";// 指明邮件的发件人登陆密码
	public static final String MAIL_HOST = "smtp.qq.com"; // 邮件的服务器域名
	
	Boolean SendEmail(String mailTo, String mailTittle, String mailText) throws Exception;
	
	MimeMessage createSimpleMail(Session session, String mailfrom, 
			String mailTo, String mailTittle, String mailText) throws Exception;
	
	List<FileItem> upload(HttpServletRequest request) throws IOException, FileUploadException;
}