package vn.edu.hcmuaf.fit.entity;

import java.util.Date;

public class ForgotPassword {
    private String email;
    private String otp;

    private Date expireTime;

    public ForgotPassword() {
    }

    public ForgotPassword(String email, String otp, Date expireTime) {
        this.email = email;
        this.otp = otp;
        this.expireTime = expireTime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public Date getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
    }

    @Override
    public String toString() {
        return "ForgotPassword{" +
                "email='" + email + '\'' +
                ", otp='" + otp + '\'' +
                ", expireTime=" + expireTime +
                '}';
    }
}
