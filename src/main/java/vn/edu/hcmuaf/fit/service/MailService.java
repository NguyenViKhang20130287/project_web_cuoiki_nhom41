package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.entity.ForgotPassword;
import vn.edu.hcmuaf.fit.entity.UserSignUp;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class MailService {
    public String getRandom() {
        Random ran = new Random();
        int number = ran.nextInt(999999);

        return String.format("%06d", number);
    }

    public boolean sendEmail(UserSignUp userSignUp) {
        boolean test = false;
        String fromEmail = "gemstore.878895@gmail.com";
        String password = "hqwwsjsnplhgqobw";
        String toEmail = userSignUp.getEmail();
        String body = "<tbody><tr>\n" +
                "    <td align=\"center\" valign=\"top\" id=\"m_-81702646094012949bodyCell\" style=\"margin:0;padding:0;font-family:Helvetica,Arial,sans-serif;height:100%!important\">\n" +
                "        <div style=\"background-color:#ffffff;color:#202123;padding:27px 20px 0 15px\">\n" +
                "            <p style=\"text-align:left;margin:0\">\n" +
                "                <img src=\"https://lh3.googleusercontent.com/a/AGNmyxY2A-oK5TNIgEWpXK9o-_YSqeDYqVwCuQPhbC-e=s432\" width=\"560\" height=\"168\" title=\"\" style=\"width:140px;height:auto;border:0;line-height:100%;outline:none;text-decoration:none\">\n" +
                "            </p>\n" +
                "        </div>\n" +
                "        <div style=\"background-color:#ffffff;color:#353740;padding:40px 20px;text-align:left;line-height:1.5\">\n" +
                "            <h1 style=\"color:#202123;font-size:32px;line-height:40px;margin:0 0 20px\">Xác minh địa chỉ email của bạn</h1>\n" +
                "\n" +
                "            <p style=\"font-size:16px;line-height:24px\">\n" +
                "                Để tiếp tục thiết lập tài khoản GemStore, vui lòng xác minh rằng đây là địa chỉ email của bạn bằng cách nhập mã:\n" +
                "                <strong style=\"font-size:18px;color:#ff0000;font-family:sans-serif\">" + userSignUp.getCode() + "</strong>\n" +
                "            </p>\n" +
                "            <p style=\"font-size:13px;line-height:24px;color:#787885\">\n" +
                "                Mã xác thực này sẽ hết hạn sau 5 phút. Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email này.\n" +
                "            </p>\n" +
                "        </div>\n" +
                "    </td>\n" +
                "</tr>\n" +
                "</tbody>";
        try {
            Properties properties = new Properties();
            properties.setProperty("mail.smtp.host", "smtp.gmail.com");
            properties.setProperty("mail.smtp.port", "587");
            properties.setProperty("mail.smtp.auth", "true");
            properties.setProperty("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.socketFactory.port", "587");
            properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            // get session
            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Xác nhận email đăng ký tài khoản GemStore");
            message.setContent(body, "text/html; charset=UTF-8");

            Transport.send(message);
            System.out.println("Đã gửi email!");
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    public boolean sendEmailForgotPassword(ForgotPassword forgotPassword) {
        boolean test = false;
        String fromEmail = "gemstore.878895@gmail.com";
        String password = "hqwwsjsnplhgqobw";
        String toEmail = forgotPassword.getEmail();
        String body = "<tbody><tr>\n" +
                "    <td align=\"center\" valign=\"top\" id=\"m_-81702646094012949bodyCell\" style=\"margin:0;padding:0;font-family:Helvetica,Arial,sans-serif;height:100%!important\">\n" +
                "        <div style=\"background-color:#ffffff;color:#202123;padding:27px 20px 0 15px\">\n" +
                "            <p style=\"text-align:left;margin:0\">\n" +
                "                <img src=\"https://lh3.googleusercontent.com/a/AGNmyxY2A-oK5TNIgEWpXK9o-_YSqeDYqVwCuQPhbC-e=s432\" width=\"560\" height=\"168\" title=\"\" style=\"width:140px;height:auto;border:0;line-height:100%;outline:none;text-decoration:none\">\n" +
                "            </p>\n" +
                "        </div>\n" +
                "        <div style=\"background-color:#ffffff;color:#353740;padding:40px 20px;text-align:left;line-height:1.5\">\n" +
                "            <h1 style=\"color:#202123;font-size:32px;line-height:40px;margin:0 0 20px\">Yêu cầu đặt lại mật khẩu</h1>\n" +
                "\n" +
                "            <p style=\"font-size:16px;line-height:24px\">\n" +
                "                Chào bạn, Đây là mã xác nhận để đặt lại mật khẩu của bạn:\n" +
                "                <strong style=\"font-size:18px;color:#ff0000;font-family:sans-serif\">" + forgotPassword.getOtp() + "</strong>\n" +
                "            </p>\n" +
                "            <p style=\"font-size:13px;line-height:24px;color:#787885\">\n" +
                "                Mã xác thực này sẽ hết hạn sau 5 phút. Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email này.\n" +
                "            </p>\n" +
                "        </div>\n" +
                "    </td>\n" +
                "</tr>\n" +
                "</tbody>";
        try {
            Properties properties = new Properties();
            properties.setProperty("mail.smtp.host", "smtp.gmail.com");
            properties.setProperty("mail.smtp.port", "587");
            properties.setProperty("mail.smtp.auth", "true");
            properties.setProperty("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.socketFactory.port", "587");
            properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            // get session
            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Yêu cầu đặt lại mật khẩu");
            message.setContent(body, "text/html; charset=UTF-8");

            Transport.send(message);
            System.out.println("Đã gửi email!");
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    public static void main(String[] args) {
    }

}
