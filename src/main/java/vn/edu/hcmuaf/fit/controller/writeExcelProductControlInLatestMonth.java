package vn.edu.hcmuaf.fit.controller;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.dao.OrderDAO;
import vn.edu.hcmuaf.fit.entity.OrderAdmin;
import vn.edu.hcmuaf.fit.entity.ProductAdmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "writeExcelProductControlInLatestMonth", value = "/admin/doc/writeExcelProductControlInLatestMonth")
public class writeExcelProductControlInLatestMonth extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductAdmin> list = new AdminDAO().getProductInLatestMonth();
        Locale locale = new Locale("vi", "VN");
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment;filename=SanPhamDuocBanTrongThangMoiNhat.xlsx");
        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFSheet sheet = wb.createSheet("total");
        //
        int rowNo = 0;
        Row row = sheet.createRow(rowNo++);
        int cellNum = 0;

        Cell cell = row.createCell(cellNum++);
        cell.setCellValue("Mã sản phẩm");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Tên sản phẩm");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Số lượng");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Gía tiền");


        for(ProductAdmin pa: list){
            cellNum = 0;
            row = sheet.createRow(rowNo++);
            cell = row.createCell(cellNum++);
            cell.setCellValue(pa.getId());

            cell = row.createCell(cellNum++);
            cell.setCellValue(pa.getName());

            cell = row.createCell(cellNum++);
            cell.setCellValue(pa.getQuantity());

            cell = row.createCell(cellNum++);
            cell.setCellValue(pa.getPrice());

        }

        wb.write(response.getOutputStream());
        wb.close();

        request.getRequestDispatcher("table-data-user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
