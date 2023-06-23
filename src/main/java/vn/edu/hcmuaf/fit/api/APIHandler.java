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
    private final static String from_district_id = "3695";
    private final static String from_ward_id = "90737";

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

    public static String getWards(String accessToken, String districtID) {
        try {
            String url = "http://140.238.54.136/api/ward?token=" + accessToken + "&districtID=" + districtID;
            HttpClient client = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(url);
            httpGet.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
            httpGet.setHeader(HttpHeaders.ACCEPT, "application/json");

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

    public static String leadTime(String accessToken, String to_district_id, String to_ward_id) {
        try {
            String url = "http://140.238.54.136/api/leadTime?token=" + accessToken;
            HttpClient client = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost(url);

            httpPost.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
            httpPost.setHeader(HttpHeaders.ACCEPT, "application/json");

            JSONObject requestJson = new JSONObject();
            requestJson.put("from_district_id", from_district_id);
            requestJson.put("from_ward_id", from_ward_id);
            requestJson.put("to_district_id", to_district_id);
            requestJson.put("to_ward_id", to_ward_id);
            requestJson.put("height", "100");
            requestJson.put("length", "100");
            requestJson.put("width", "100");
            requestJson.put("weight", "100");

            StringEntity requestBody = new StringEntity(requestJson.toString());
            httpPost.setEntity(requestBody);

            HttpResponse response = client.execute(httpPost);
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

    public static String shippingCosts(String accessToken, String to_district_id, String to_ward_id) {
        try {
            String url = "http://140.238.54.136/api/calculateFee?token=" + accessToken;
            HttpClient client = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost(url);

            // Thiết lập header
            httpPost.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
            httpPost.setHeader(HttpHeaders.ACCEPT, "application/json");

            // Tạo đối tượng JSON để chứa thông tin yêu cầu
            JSONObject requestJson = new JSONObject();
            requestJson.put("from_district_id", from_district_id);
            requestJson.put("from_ward_id", from_ward_id);
            requestJson.put("to_district_id", to_district_id);
            requestJson.put("to_ward_id", to_ward_id);
            requestJson.put("height", "100");
            requestJson.put("length", "100");
            requestJson.put("width", "100");
            requestJson.put("weight", "100");

            // Gán dữ liệu yêu cầu vào body của POST request
            StringEntity requestBody = new StringEntity(requestJson.toString());
            httpPost.setEntity(requestBody);

            // Gửi yêu cầu POST
            HttpResponse response = client.execute(httpPost);
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

    public static String registerTransports(String accessToken, String to_district_id, String to_ward_id) {
        try {
            String url = "http://140.238.54.136/api/registerTransport?token=" + accessToken;
            HttpClient client = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost(url);

            httpPost.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
            httpPost.setHeader(HttpHeaders.ACCEPT, "application/json");

            JSONObject requestJson = new JSONObject();
            requestJson.put("from_district_id", from_district_id);
            requestJson.put("from_ward_id", from_ward_id);
            requestJson.put("to_district_id", to_district_id);
            requestJson.put("to_ward_id", to_ward_id);
            requestJson.put("height", "100");
            requestJson.put("length", "100");
            requestJson.put("width", "100");
            requestJson.put("weight", "100");

            StringEntity requestBody = new StringEntity(requestJson.toString());
            httpPost.setEntity(requestBody);

            HttpResponse response = client.execute(httpPost);
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

    public static String getAllTransports(String accessToken) {
        try {
            String url = "http://140.238.54.136/api/allTransports?token=" + accessToken;
            HttpClient client = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(url);
            httpGet.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
            httpGet.setHeader(HttpHeaders.ACCEPT, "application/json");

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
    }
}
