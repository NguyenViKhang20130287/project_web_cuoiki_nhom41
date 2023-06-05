package vn.edu.hcmuaf.fit.api;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
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
                System.out.println(districtId);
                result = APIHandler.getWards(access_token, districtId);
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

    }
}
