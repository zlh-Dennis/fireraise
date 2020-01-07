package com.fireraise.test;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailTest {

	private static String mailFrom = "zhao_linhua@foxmail.com";// 指明邮件的发件人
	private static String password_mailFrom = "dzwpaipkgtfajiij";// 指明邮件的发件人登陆密码
	private static String mailTo = "ubjxtzdk@mail.bccto.me"; // 指明邮件的收件人
	private static String mailTittle = "Test1";// 邮件的标题
	private static String mailText = "ahhhhhhh？？？？"; // 邮件的文本内容
	private static String mail_host = "smtp.qq.com"; // 邮件的服务器域名

	public static void main(String[] args) throws Exception {

		Properties prop = new Properties();
		prop.setProperty("mail.host", mail_host);
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");

		// 使用JavaMail发送邮件的5个步骤
		// 1、创建session
		Session session = Session.getInstance(prop);
		System.out.println("1、创建session");
		// 开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
		session.setDebug(true);
		
		// 2、通过session得到transport对象
		Transport ts = session.getTransport();
		System.out.println("2、通过session得到transport对象");
		
		// 3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
		ts.connect(mail_host, mailFrom, password_mailFrom);
		System.out.println("3、使用邮箱的用户名和密码连上邮件服务器");
		
		// 4、创建邮件
		Message message = createSimpleMail(session, mailFrom, mailTo, mailTittle, mailText);
		System.out.println("4、创建邮件");
		
		// 5、发送邮件
		ts.sendMessage(message, message.getAllRecipients());
		ts.close();
		System.out.println("5、发送邮件");
	}

	public static MimeMessage createSimpleMail(Session session, String mailfrom, 
			String mailTo, String mailTittle, String mailText) throws Exception {
		// 创建邮件对象
		MimeMessage message = new MimeMessage(session);
		// 指明邮件的发件人
		message.setFrom(new InternetAddress(mailfrom));
		// 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailTo));
		// 邮件的标题
		message.setSubject(mailTittle);
		// 邮件的文本内容
		message.setContent(mailText, "text/html;charset=UTF-8");
		// 返回创建好的邮件对象
		return message;
	}
}