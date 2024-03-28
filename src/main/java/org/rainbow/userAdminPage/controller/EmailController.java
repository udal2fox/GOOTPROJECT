package org.rainbow.userAdminPage.controller;

import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.rainbow.userAdminPage.service.userAdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

@RestController
public class EmailController {

    @Autowired
    private userAdminServiceImpl userService;
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private SpringTemplateEngine templateEngine;

    @GetMapping("/send-email/{ordNo}")
    public String sendEmail(@PathVariable int ordNo, Model model) {

        System.out.println(ordNo);

        HashMap<String, String> sendInfo = userService.sendMail(ordNo);

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper;

        try {
            messageHelper = new MimeMessageHelper(message, true, "utf-8");

            // 받는 사람 메일주소 설정
            // messageHelper.setFrom(sendInfo.get("cEmpEmail"));
            messageHelper.setFrom("worney87@gmail.com");
            // 보내는 사람 메일주소 설정
            messageHelper.setTo("worney87@gmail.com");

            // 메일 제목 설정
            String sendName = "";
            if (sendInfo.get("sendName") == null) {
                sendName = sendInfo.get("comName");
            } else {
                sendName = sendInfo.get("sendName");
            }
            String subject = "[Rainbow BirthDay] '" + sendName + "'에서 보낸 '" + sendInfo.get("cEmpName")
                    + "' 님의 생일선물이 도착하였습니다.";
            messageHelper.setSubject(subject);

            // 템플릿에 전달할 데이터 설정
            Context context = new Context();


            // 카드 배경 가져오기
            String theme = null;
            switch (sendInfo.get("selectedTheme")) {
                case "theme_basic":
                    theme = "https://i.ibb.co/wQCCCmP/theme-basic.png";
                    break;
                case "theme_blue":
                    theme = "https://i.ibb.co/RyVDNZZ/theme-blue.jpg";
                    break;
                case "theme_pink":
                    theme = "https://i.ibb.co/vz2DDSQ/theme-pink.jpg";
                    break;
                case "theme_yellow":
                    theme = "https://i.ibb.co/x5GwsZN/theme-yellow.jpg";
                    break;
            }
            context.setVariable("theme", theme);
            System.out.println("theme.." + theme);

            String messegeContent = sendInfo.get("messegeContent");
            String cEmpName = sendInfo.get("cEmpName");
            String cEmpPosition = sendInfo.get("cEmpPosition");
            
            // 메세지 내용에서 각 변수를 매칭하여 문자열 치환
            messegeContent = messegeContent.replace("{name}", cEmpName).replace("{발신자명}", sendName)
            		.replace("{grade}", cEmpPosition);
            System.out.println("messegeContent.." + messegeContent);
            
            // 메일 본문내용으로 설정
            context.setVariable("content", messegeContent);
            // 이메일 내용 전달 : 템플릿 프로세스
            String html = templateEngine.process("mailTemplate", context);

            messageHelper.setText(html, true);

            mailSender.send(message);

            mailSender.send(message);
            return "Email sent successfully";
        } catch (MessagingException e) {
            e.printStackTrace();
            return "Failed to send email: " + e.getMessage();
        }
    }
}
