package vn.edu.hcmuaf.fit.entity;

public class UserSignUp {
    private String username;
    private String email;
    private String password;
    private String code;

    public UserSignUp(){
    }

    public UserSignUp(String username, String email, String password, String code) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.code = code;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "UserSignUp{" +
                "username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", code='" + code + '\'' +
                '}';
    }
}
