package vn.edu.hcmuaf.fit.api;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

public class APIRegister {

    public static void main(String[] args) {
        JSONObject registrationData = new JSONObject();
        registrationData.put("name", "dangkhoa");
        registrationData.put("email", "20130295@st.hcmuaf.edu.vn");
        registrationData.put("password", "20130295");
        registrationData.put("password_confirmation", "20130295");
        try {
            HttpClient httpClient = HttpClientBuilder.create().build();
            HttpPost request = new HttpPost("http://140.238.54.136/api/auth/register");

            StringEntity params = new StringEntity(registrationData.toString());
            request.addHeader("content-type", "application/json");
            request.setEntity(params);

            HttpResponse response = httpClient.execute(request);

            String responseBody = EntityUtils.toString(response.getEntity());
            System.out.println("Response Body: " + responseBody);


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
