package com.fireraise.serviceimpl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Service;

import com.fireraise.service.OperationService;

@Service
public class OperationServiceImpl implements OperationService {

	@Override
	public Boolean SendEmail(String mailTo, String mailTittle, String mailText) throws Exception {

		Properties prop = new Properties();
		prop.setProperty("mail.host", MAIL_HOST);
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
		ts.connect(MAIL_HOST, MAIL_FROM, PASSWORD_MAIL);
		System.out.println("3、使用邮箱的用户名和密码连上邮件服务器");

		// 4、创建邮件
		Message message = createSimpleMail(session, MAIL_FROM, mailTo, mailTittle, mailText);
		System.out.println("4、创建邮件");

		// 5、发送邮件
		try {
			ts.sendMessage(message, message.getAllRecipients());
			System.out.println("邮件发送成功！");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("邮件发送失败！");
			return false;
		} finally {
			ts.close();
		}

	}

	@Override
	public MimeMessage createSimpleMail(Session session, String mailfrom, String mailTo, String mailTittle,
			String mailText) throws Exception {
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

	/**
	 * @Description: 图片表单处理方法。上传的表单带有图片时，通过这个方法进行处理
	 * @Title: upload
	 * @return: List<FileItem> 处理之后的内容，打包成集合
	 */
	@Override
	public List<FileItem> upload(HttpServletRequest request) throws IOException, FileUploadException {
		System.out.println("开始处理请求");
		List<FileItem> list = new ArrayList<FileItem>();

		// 实例化一个硬盘文件工厂,用来配置上传组件ServletFileUpload
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(4096); // 设置缓冲区大小，这里是4kb
		// 用以上工厂实例化上传组件
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB
		List items = upload.parseRequest(request);// 得到所有的上传文件
		Iterator it = items.iterator();
		
		System.out.println("正在处理请求");
		while(it.hasNext()) {
			// 得到当前文件
			FileItem fi = (FileItem) it.next();
			list.add(fi);
		}
		return list;
	}

}