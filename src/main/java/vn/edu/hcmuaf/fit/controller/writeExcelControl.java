package vn.edu.hcmuaf.fit.controller;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.entity.OrderAdmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "writeExcelControl", value = "/admin/doc/writeExcelControl")
public class writeExcelControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<OrderAdmin> list = new AdminDAO().getListOrder();
//        PrintWriter out = response.getWriter();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment;filename=DonHang.xlsx");
        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFSheet sheet = wb.createSheet("total");
        //
        int rowNo = 0;
        Row row = sheet.createRow(rowNo++);
        int cellNum = 0;

        Cell cell = row.createCell(cellNum++);
        cell.setCellValue("Mã đơn");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Họ và tên");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Đơn hàng");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Số điện thoại");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Tổng tiền");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Tình trạng");

        for (OrderAdmin oa : list) {
            cellNum = 0;
            row = sheet.createRow(rowNo++);
            cell = row.createCell(cellNum++);
            cell.setCellValue(oa.getId());

            cell = row.createCell(cellNum++);
            cell.setCellValue(oa.getFullName());

            cell = row.createCell(cellNum++);
            cell.setCellValue(oa.getProducts().toString());

            cell = row.createCell(cellNum++);
            cell.setCellValue(oa.getPhone());

            cell = row.createCell(cellNum++);
            cell.setCellValue(oa.getTotalMoney() + oa.getShippingCost());

            cell = row.createCell(cellNum++);
            cell.setCellValue(oa.getStatus());
        }
        wb.write(response.getOutputStream());
        wb.close();

        request.getRequestDispatcher("table-data-user.jsp").forward(request, response);
//        out.println("<script type=\"text/javascript\">");
//        out.println("alert('Xuất file thành công');");
//        out.println("location='UserAdminControl';");
//        out.println("</script>");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
