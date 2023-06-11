package vn.edu.hcmuaf.fit.api;

import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "APIServlet", value = "/api")
public class APIServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String authorizationHeader = request.getHeader("Authorization");
        System.out.println(authorizationHeader);
        if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ")) {
            String access_token = authorizationHeader.substring(7);
            System.out.println(access_token);
            String action = request.getParameter("action");

            String result = "";

            if (action.equals("getProvinces")) {
                result = APIHandler.getProvinces(access_token);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(result);
            }else if(action.equals("getDistricts")){
                String provinceId = request.getHeader("ProvinceID");
                System.out.print(provinceId);
                result = APIHandler.getDistricts(access_token, provinceId);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(result);
            }else if(action.equals("getWards")){
                String districtId = request.getHeader("DistrictID");
                result = APIHandler.getWards(access_token, districtId);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(result);
            }else if(action.equals("getLeadTime")){
                StringBuilder requestBody = new StringBuilder();
                BufferedReader reader = request.getReader();
                String line;
                while ((line = reader.readLine()) != null) {
                    requestBody.append(line);
                }
                JSONObject requestJson = new JSONObject(requestBody.toString());
                String to_district_id = requestJson.getString("to_district_id");
                System.out.println(to_district_id);
                String to_ward_id = requestJson.getString("to_ward_id");
                result = APIHandler.leadTime(access_token, to_district_id, to_ward_id);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(result);
            }
        } else {
            // Không có access_token hợp lệ, xử lý lỗi hoặc chuyển hướng đến trang đăng nhập
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String authorizationHeader = request.getHeader("Authorization");
        System.out.println(authorizationHeader);
        if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ")) {
            String access_token = authorizationHeader.substring(7);
            System.out.println(access_token);
            String action = request.getParameter("action");

            String result = "";
            if(action.equals("getLeadTime")){
                StringBuilder requestBody = new StringBuilder();
                BufferedReader reader = request.getReader();
                String line;
                while ((line = reader.readLine()) != null) {
                    requestBody.append(line);
                }
                JSONObject requestJson = new JSONObject(requestBody.toString());
                String to_district_id = requestJson.getString("DistrictID");
                System.out.println(to_district_id);
                String to_ward_id = requestJson.getString("WardID");
                result = APIHandler.leadTime(access_token, to_district_id, to_ward_id);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(result);
            } else if (action.equals("getShippingCosts")) {
                StringBuilder requestBody = new StringBuilder();
                BufferedReader reader = request.getReader();
                String line;
                while ((line = reader.readLine()) != null) {
                    requestBody.append(line);
                }
                JSONObject requestJson = new JSONObject(requestBody.toString());
                String to_district_id = requestJson.getString("DistrictID");
                System.out.println(to_district_id);
                String to_ward_id = requestJson.getString("WardID");
                result = APIHandler.shippingCosts(access_token, to_district_id, to_ward_id);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(result);
            } else if (action.equals("registerTransports")) {
                StringBuilder requestBody = new StringBuilder();
                BufferedReader reader = request.getReader();
                String line;
                while ((line = reader.readLine()) != null) {
                    requestBody.append(line);
                }
                JSONObject requestJson = new JSONObject(requestBody.toString());
                String to_district_id = requestJson.getString("DistrictID");
                System.out.println(to_district_id);
                String to_ward_id = requestJson.getString("WardID");
                result = APIHandler.registerTransports(access_token, to_district_id, to_ward_id);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(result);
            }

        }
    }
}
