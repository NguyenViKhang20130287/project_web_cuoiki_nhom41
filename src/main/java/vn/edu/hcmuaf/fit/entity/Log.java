package vn.edu.hcmuaf.fit.entity;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Log {
    int id;
    int level;
    int user_id;
    String source;
    String content;
    Date created_at;
    int status;
    String clientIP;
    String browserInfo;
    static Map<Integer, String> levelMapping = new HashMap<>();

    static {
        levelMapping.put(0, "INFO");
        levelMapping.put(1, "ALERT");
        levelMapping.put(2, "WARNING");
        levelMapping.put(3, "DANGER");
    }

    public static int INFO = 0;
    public static int ALERT = 1;
    public static int WARNING = 2;
    public static int DANGER = 3;

    public Log() {

    }

    public Log(int level, int user_id, String source, String content, Date created_at, int status, String clientIP, String browserInfo) {
        this.level = level;
        this.user_id = user_id;
        this.source = source;
        this.content = content;
        this.created_at = created_at;
        this.status = status;
        this.clientIP = clientIP;
        this.browserInfo = browserInfo;
    }

    public Log(int level, int user_id, String source, String content, int status, String clientIP, String browserInfo) {
        this.level = level;
        this.user_id = user_id;
        this.source = source;
        this.content = content;
        this.status = status;
        this.clientIP = clientIP;
        this.browserInfo = browserInfo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getClientIP() {
        return clientIP;
    }

    public void setClientIP(String clientIP) {
        this.clientIP = clientIP;
    }

    public String getBrowserInfo() {
        return browserInfo;
    }

    public void setBrowserInfo(String browserInfo) {
        this.browserInfo = browserInfo;
    }

    public String getLevelWithName() {
        return levelMapping.get(levelMapping.containsKey(this.level) ? this.level : 0);
    }

    public static Map<Integer, String> getLevelMapping() {
        return levelMapping;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", level=" + level +
                ", user_id=" + user_id +
                ", source='" + source + '\'' +
                ", content='" + content + '\'' +
                ", created_at=" + created_at +
                ", status=" + status +
                ", clientIP='" + clientIP + '\'' +
                ", browserInfo='" + browserInfo + '\'' +
                '}';
    }
}
