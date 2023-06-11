package vn.edu.hcmuaf.fit.controller;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.dao.OrderDAO;
import vn.edu.hcmuaf.fit.entity.OrderAdmin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "writeExcelTotalRevenueControl", value = "/admin/doc/writeExcelTotalRevenueControl")
public class writeExcelTotalRevenueControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<OrderAdmin> list = new OrderDAO().getListOrder();
        Locale locale = new Locale("vi", "VN");
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment;filename=TongDoanhThu.xlsx");
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

        for(OrderAdmin oa: list){
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
            cell.setCellValue(oa.getTotalMoney());

            cell = row.createCell(cellNum++);
            cell.setCellValue(oa.getStatus());
        }

        cellNum = 0;
        row = sheet.createRow(rowNo++);
        cell = row.createCell(cellNum++);
        cell.setCellValue("Tổng cộng");

        cell = row.createCell(cellNum++);
        cell.setCellValue(numberFormat.format(new AdminDAO().getRevenue()));

        wb.write(response.getOutputStream());
        wb.close();

        request.getRequestDispatcher("table-data-user.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
