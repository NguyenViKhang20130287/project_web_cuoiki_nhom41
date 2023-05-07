package vn.edu.hcmuaf.fit.service;

import eu.bitwalker.useragentutils.UserAgent;
import vn.edu.hcmuaf.fit.dao.LogDAO;
import vn.edu.hcmuaf.fit.dao.LoginDAO;
import vn.edu.hcmuaf.fit.entity.Log;

import javax.servlet.http.HttpServletRequest;

public class LogService {
    private static LogService instance;

    public static LogService getInstance() {
        if (instance == null) {
            instance = new LogService();
        }
        return instance;
    }

    public void insertNewLog(Log log) {
        new LogDAO().insertLog(log);
    }

    public int countLoginFail(int user_id) {
        return new LoginDAO().countLoginFail(user_id);
    }

    public String getIpClient(HttpServletRequest request) {
        return request.getRemoteAddr();
    }

    public String getBrowserName(HttpServletRequest request) {
        String browserInfo = request.getHeader("User-Agent");
        UserAgent userAgent = UserAgent.parseUserAgentString(browserInfo);
        String browserName = userAgent.getBrowser().getName();
        return browserName;
    }
}
