package vn.edu.hcmuaf.fit.controller;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "writeExcelBestProductControl", value = "/admin/doc/writeExcelBestProductControl")
public class writeExcelBestProductControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> list = new AdminDAO().getTop5();
        Locale locale = new Locale("vi", "VN");
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment;filename=SanPhamBanChay.xlsx");
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
        cell.setCellValue("Giá tiền");

        for (Product p : list) {
            cellNum = 0;
            row = sheet.createRow(rowNo++);
            cell = row.createCell(cellNum++);
            cell.setCellValue(p.getId());

            cell = row.createCell(cellNum++);
            cell.setCellValue(p.getTitle());

            cell = row.createCell(cellNum++);
            cell.setCellValue(Integer.parseInt(p.getDescription()));

            cell = row.createCell(cellNum++);
            cell.setCellValue(numberFormat.format(p.getDiscount()));

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
