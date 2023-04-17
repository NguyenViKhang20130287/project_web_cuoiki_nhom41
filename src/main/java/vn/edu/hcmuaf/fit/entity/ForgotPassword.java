package vn.edu.hcmuaf.fit.entity;

public class ForgotPassword {
    String email;
    String otp;

    public ForgotPassword() {
    }

    public ForgotPassword(String email, String otp) {
        this.email = email;
        this.otp = otp;
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

    @Override
    public String toString() {
        return "ForgotPassword{" +
                "email='" + email + '\'' +
                ", otp='" + otp + '\'' +
                '}';
    }
}
