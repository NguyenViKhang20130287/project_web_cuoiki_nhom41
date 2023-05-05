package vn.edu.hcmuaf.fit.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import vn.edu.hcmuaf.fit.dao.AccountDAO;
import vn.edu.hcmuaf.fit.dao.LoginDAO;
import vn.edu.hcmuaf.fit.dao.RegisterDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.Constants;
import vn.edu.hcmuaf.fit.entity.UserGoogle;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;


import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginGoogleControl", value = "/LoginGoogleControl")
public class LoginGoogleControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogle user = getUserInfo(accessToken);
        System.out.println(user);
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogle googlePojo = new Gson().fromJson(response, UserGoogle.class);

        return googlePojo;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogle user = getUserInfo(accessToken);
        Account account = new LoginDAO().getAccount(user.getId());
        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("Account", account);
            session.setAttribute("username", account.getUsername());
            session.setAttribute("email", account.getEmail());
            session.setAttribute("phoneNumber", account.getPhone());
            String role = String.valueOf(account.getRole());
            session.setAttribute("role", role);
            session.setAttribute("fullName", account.getFullName());
            String isSocial = String.valueOf(account.getIsSocial());
            session.setAttribute("isSocial", isSocial);
        } else {
            new RegisterDAO().insertSocialAccount(user.getId(), user.getEmail(), user.getName());
            account = new LoginDAO().getAccount(user.getId());
            HttpSession session = request.getSession();
            session.setAttribute("Account", account);
            session.setAttribute("username", account.getUsername());
            session.setAttribute("email", account.getEmail());
            session.setAttribute("phoneNumber", account.getPhone());
            String role = String.valueOf(account.getRole());
            session.setAttribute("role", role);
            session.setAttribute("fullName", account.getFullName());
            String isSocial = String.valueOf(account.getIsSocial());
            session.setAttribute("isSocial", isSocial);
        }
        response.sendRedirect("home");
    }
}
