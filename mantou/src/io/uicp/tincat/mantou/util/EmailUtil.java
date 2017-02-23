package io.uicp.tincat.mantou.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import org.junit.Test;

public class EmailUtil {
	@Test
	public void testSendEmail(){
		Email email=new Email();
		email.setHost("smtp.163.com");
		email.setUsername("tincat_mantou");
		email.setPassword("tincat1234");
		email.setReceiver("601909982@qq.com");
		email.setSubject("测试标题！");
		email.setContent("<a href='http://www.baidu.com'>测试正文！</a>");
		try {
			sendEmail(email);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void sendEmail(final Email email) throws MessagingException {
		 // 配置发送邮件的环境属性
        Properties props = new Properties();
        /*
         * 可用的属性： mail.store.protocol / mail.transport.protocol / mail.host /
         * mail.user / mail.from
         */
        // 表示SMTP发送邮件，需要进行身份验证
        props.setProperty("mail.host", email.getHost());
        props.setProperty("mail.smtp.auth", "true");
        

        // 构建授权信息，用于进行SMTP进行身份验证
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // 用户名、密码
             
                return new PasswordAuthentication(email.getUsername(), email.getPassword());
            }
        };
        // 使用环境属性和授权信息，创建邮件会话
        Session mailSession = Session.getInstance(props, authenticator);
        // 创建邮件消息
        MimeMessage message = new MimeMessage(mailSession);
        // 设置发件人
        String fromwho=email.getUsername()+email.getHost().replace("smtp.", "@").replace("SMTP.", "@");
        InternetAddress form = new InternetAddress(fromwho);
        message.setFrom(form);

        // 设置收件人
        InternetAddress to = new InternetAddress(email.getReceiver());
        message.setRecipient(RecipientType.TO, to);


        // 设置邮件标题
        message.setSubject(email.getSubject());

        // 设置邮件的内容体
        message.setContent(email.getContent(), "text/html;charset=UTF-8");

        // 发送邮件
        Transport.send(message);
	}
	
	@Test
    public void test() throws MessagingException {
        // 配置发送邮件的环境属性
        Properties props = new Properties();
        /*
         * 可用的属性： mail.store.protocol / mail.transport.protocol / mail.host /
         * mail.user / mail.from
         */
        // 表示SMTP发送邮件，需要进行身份验证
        props.setProperty("mail.host", "smtp.163.com");
        props.setProperty("mail.smtp.auth", "true");
        

        // 构建授权信息，用于进行SMTP进行身份验证
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // 用户名、密码
             
                return new PasswordAuthentication("tincat_mantou", "tincat1234");
            }
        };
        // 使用环境属性和授权信息，创建邮件会话
        Session mailSession = Session.getInstance(props, authenticator);
        // 创建邮件消息
        MimeMessage message = new MimeMessage(mailSession);
        // 设置发件人
        InternetAddress form = new InternetAddress("tincat_mantou@163.com");
        message.setFrom(form);

        // 设置收件人
        InternetAddress to = new InternetAddress("601909982@qq.com");
        message.setRecipient(RecipientType.TO, to);

        // 设置抄送
        InternetAddress cc = new InternetAddress("songtin233@163.com");
        message.setRecipient(RecipientType.CC, cc);

        // 设置密送，其他的收件人不能看到密送的邮件地址
        InternetAddress bcc = new InternetAddress("songhb1183@163.com");
        message.setRecipient(RecipientType.BCC, bcc);

        // 设置邮件标题
        message.setSubject("测试邮件");

        // 设置邮件的内容体
        message.setContent("<a href='http://www.baidu.com'>测试的HTML邮件</a>", "text/html;charset=UTF-8");

        // 发送邮件
        Transport.send(message);
    }
}