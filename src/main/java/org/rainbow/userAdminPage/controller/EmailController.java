package org.rainbow.userAdminPage.controller;

import java.util.HashMap;

import javax.mail.MessagingException;

import org.rainbow.userAdminPage.domain.EmailRequest;
import org.rainbow.userAdminPage.service.EmailService;
import org.rainbow.userAdminPage.service.userAdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EmailController {

    @Autowired
    private EmailService emailService;
    @Autowired
	private userAdminServiceImpl userService;
    
    @GetMapping("/send-email/{ordNo}")
    public String sendEmail(@PathVariable int ordNo) {
    	
    	System.out.println(ordNo);
    	
    	HashMap<String, String> mailForm = userService.sendMail(ordNo);
    	
    	EmailRequest email = new EmailRequest();
    	//email.setTo(mailForm.get("cEmpEmail"));
    	email.setTo("worney87@gmail.com");
    	
    	String sendName = "";
    	if(mailForm.get("sendName") == null) {
    		sendName = mailForm.get("comName");
    	}else {
    		sendName = mailForm.get("sendName");
    	}
    	String subject = "<img width=\"94\" height=\"94\" src=\"https://img.icons8.com/3d-fluency/94/gift.png\" alt=\"gift\"/>"+"<Rainbow BirthDay> '" + sendName + "'에서 보낸 '" + mailForm.get("cEmpName") + "' 의 생일선물이 도착하였습니다.";
    	email.setSubject(subject);
    	
    	email.setBody(mailForm.get("messegeContent"));
    	
        try {
            emailService.sendEmail(email.getTo(), email.getSubject(), email.getBody());
            return "Email sent successfully";
        } catch (MessagingException e) {
            e.printStackTrace();
            return "Failed to send email: " + e.getMessage();
        }
    }
}
