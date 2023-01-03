package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.ForgotPasswordDAO;
import vn.edu.hcmuaf.fit.entity.Account;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ForgotPasswordControl", value = "/ForgotPasswordControl")
public class ForgotPasswordControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();
        ForgotPasswordDAO fpc = new ForgotPasswordDAO();


        if (email != null || !email.equals("")) {
            if (fpc.checkEmailExists(email) != null) {
                Account acc = fpc.checkEmailExists(email);


                // sending otp
                Random rand = new Random();
                otpvalue = rand.nextInt(899999) + 100000;

                String to = email;// change accordingly
                // Get the session object
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("vikhang17112002@gmail.com", "fzjljqjsfkltospu");// Put your email
                        // id and
                        // password here
                    }
                });

                // compose message
                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email));// change accordingly
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject("Xin chào");
                    message.setText("Mã OTP của bạn là: " + otpvalue);
                    // send message
                    Transport.send(message);
                    System.out.println("message sent successfully");
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
                dispatcher = request.getRequestDispatcher("enterOTP.jsp");
                request.setAttribute("message", "OTP is sent to your email id");
                //request.setAttribute("connection", con);
                mySession.setAttribute("otp", otpvalue);
                mySession.setAttribute("idUser", acc.getId());
                mySession.setAttribute("email", email);
                dispatcher.forward(request, response);
                //request.setAttribute("status", "success");
            } else{
                request.setAttribute("error", "Email chưa được đăng kí tài khoản !");
                request.getRequestDispatcher("lostpassword.jsp").forward(request, response);
            }
        }
    }

}
