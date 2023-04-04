package vn.edu.hcmuaf.fit.entity;

public class User {
    int id;
    String userName;
    String password;
    String fullName;
    String email;
    String phone;
    int role;

    public User() {
    }

    public User(int id, String userName, String password, String fullName, String email, String phone, int role) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return id + " " + userName + " " + password + " " + fullName + " " + email + " " + phone + " " + role + "\n";
    }
}
