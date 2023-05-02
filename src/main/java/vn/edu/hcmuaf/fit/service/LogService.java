package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.LogDAO;
import vn.edu.hcmuaf.fit.dao.LoginDAO;
import vn.edu.hcmuaf.fit.entity.Log;

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


}
