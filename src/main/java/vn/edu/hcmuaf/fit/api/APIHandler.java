package vn.edu.hcmuaf.fit.api;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

import java.nio.charset.StandardCharsets;


public class APIHandler {
    public static String login() {
        JSONObject loginData = new JSONObject();
        loginData.put("email", "20130295@st.hcmuaf.edu.vn");
        loginData.put("password", "20130295");
        try {
            HttpClient httpClient = HttpClientBuilder.create().build();
            HttpPost request = new HttpPost("http://140.238.54.136/api/auth/login");

            StringEntity params = new StringEntity(loginData.toString());
            request.addHeader("content-type", "application/json");
            request.setEntity(params);

            HttpResponse response = httpClient.execute(request);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode == 200) {
                String responseBody = EntityUtils.toString(response.getEntity());
                return responseBody;
            } else {
                System.out.println("Yêu cầu đăng nhập thất bại. Mã phản hồi: " + statusCode);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String getProvinces(String accessToken) {
        try {
            String url = "http://140.238.54.136/api/province?token=" + accessToken;
            HttpClient client = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(url);
            httpGet.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
            httpGet.setHeader(HttpHeaders.ACCEPT, "application/json");
            httpGet.setHeader(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken);

            HttpResponse response = client.execute(httpGet);
            HttpEntity responseEntity = response.getEntity();

            if (responseEntity != null) {
                String responseString = EntityUtils.toString(responseEntity, StandardCharsets.UTF_8);
                return responseString;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static String getDistricts(String accessToken, String provinceID) {
        try {
            String url = "http://140.238.54.136/api/district?token=" + accessToken + "&provinceID=" + provinceID;
            HttpClient client = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(url);
            httpGet.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
            httpGet.setHeader(HttpHeaders.ACCEPT, "application/json");
            httpGet.setHeader(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken);

            HttpResponse response = client.execute(httpGet);
            HttpEntity responseEntity = response.getEntity();

            if (responseEntity != null) {
                String responseString = EntityUtils.toString(responseEntity, StandardCharsets.UTF_8);
                return responseString;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    public static String getWards(String accessToken, String districtID){
        try {
            String url = "http://140.238.54.136/api/ward?token=" + accessToken + "&districtID=" + districtID;
            HttpClient client = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(url);
            httpGet.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
            httpGet.setHeader(HttpHeaders.ACCEPT, "application/json");
            httpGet.setHeader(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken);

            HttpResponse response = client.execute(httpGet);
            HttpEntity responseEntity = response.getEntity();

            if (responseEntity != null) {
                String responseString = EntityUtils.toString(responseEntity, StandardCharsets.UTF_8);
                return responseString;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(getProvinces("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTQwLjIzOC41NC4xMzYvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODU4NTQwMzAsImV4cCI6MTY4NTg1NDYzMCwibmJmIjoxNjg1ODU0MDMwLCJqdGkiOiIzMzNIaVl6SjlRZTd4RVJoIiwic3ViIjoiODg2ZDkzMjQ3ZjgxNDE5ZDhlYjg2YTk3NDUwY2NkMGUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.G4L-9jzGidLrAfXhmS_TdQSBXzOpvKnjomdSARramHc"));
    }
}
