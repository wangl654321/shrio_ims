package com.ims.service.impl;

import com.ims.service.SystemService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

/***
 *
*
* 描    述：
*
* 创 建 者： @author wl
* 创建时间： 2019/4/8 13:05
* 创建描述：
*
* 修 改 者：
* 修改时间：
* 修改描述：
*
* 审 核 者：
* 审核时间：
* 审核描述：
*
 */
@Service
public class SystemServiceImpl implements SystemService{
    protected Logger logger = LogManager.getLogger(this.getClass());
    /**
     *
     * @param to 邮件接收地址
     * @param subject 邮件主题
     * @param msg 邮件正文
     * @return true发送成功|false发送失败
     */
    @Override
    public boolean sendEmail(String to, String subject, String msg) {
        Properties props = new Properties();
        // 发送服务器需要身份验证
        props.setProperty("mail.smtp.auth", "true");
        // 连接的邮件服务器
        props.setProperty("mail.host", "smtp.pydyun.com");
        // 发送人
        props.setProperty("mail.from", "ims@pydyun.com");

        // 发送邮件协议名称
        //props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");

        // props.setProperty();
        // 第一步：创建Session
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);
        try {
            // 第二步：获取邮件传输对象
            Transport ts = session.getTransport();
            // 连接邮件服务器
            ts.connect("test@pydyun.com", "test123");
            // 第三步: 创建邮件消息体
            MimeMessage message = new MimeMessage(session);
            // 设置邮件的主题
            message.setSubject(subject);
            // 设置邮件的内容
            message.setContent(msg, "text/html;charset=utf-8");
            // 设置发送时间
            message.setSentDate(new Date());
            // 存储邮件信息
            message.saveChanges();
            // 第四步：设置发送昵称
            String nick = "";
            try {
                nick = javax.mail.internet.MimeUtility.encodeText("信息管理系统");
            } catch (Exception e) {
                e.printStackTrace();
            }
            //设置发件人地址
            message.setFrom(new InternetAddress(nick + "<ims@pydyun.com>"));
            // 第五步：设置接收人信息
            ts.sendMessage(message, InternetAddress.parse(to));
            ts.close();
            logger.info("邮件发送成功！");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("邮件发送失败！");
        }
        return false;
    }

    @Override
    public boolean sendSignUpMail(String path,String username,String email,String code){
        String subject="邮箱验证";
        String newPath=path+"?code="+code;
        String msg="尊敬的信息管理系统用户：<br>" +
                "&emsp;&emsp;您好！<br>" +
                "&emsp;&emsp;<p>这是一封来自<b>信息管理系统</b>的邮箱确认信，请尽快点击下面的链接地址，以完成帐户"+username+"的邮箱激活，24小时内有效：<br>" +
                "&emsp;&emsp;<a target='_blank' href='"+newPath+"'>"+newPath+"</a><br>" +
                "(如果您无法点击此链接，请将上面的链接地址复制到你的浏览器地址栏中，打开页面即可)</p>" +
                "<p>" +
                "&emsp;&emsp;注：<br>" +
                "&emsp;&emsp;此邮件由系统自动发送，请勿回复。如有任何问题，请联系信息管理系统管理员。" +
                "</p>";
        if(sendEmail(email, subject, msg))
        {
            logger.info("邮件激活地址："+newPath);
            return true;
        }else{
            return false;
        }
    }
}
