package blog.utils;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.binary.XSSFBStylesTable;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import blog.entity.Article;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;

public class ExcelUtils {
   
    public static void WriteExcvel(List<Article> articleList,String path,String name) throws Exception {
        XSSFWorkbook xssfWorkbook =new XSSFWorkbook();
       
        //sheet名
        XSSFSheet sheet=xssfWorkbook.createSheet("日志表");
        
        //第一行
        XSSFRow row=sheet.createRow(0);
        row.createCell(0).setCellValue("日志表");
        //合并单元格CellRangeAddress构造参数依次表示起始行，截至行，起始列， 截至列  
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,7)); 
        
        //第二行，表头
        row=sheet.createRow(1);
        row.createCell(0).setCellValue("日志id");
        row.createCell(1).setCellValue("title");
        row.createCell(2).setCellValue("作者");
        row.createCell(3).setCellValue("分类");
        row.createCell(4).setCellValue("时间");
        row.createCell(5).setCellValue("评论量");
        row.createCell(6).setCellValue("阅读量");
        row.createCell(7).setCellValue("内容");
        for(int i=0;i<articleList.size();i++)
        {
            Article article=articleList.get(i);
            row=sheet.createRow(i+2);
            row.createCell(0).setCellValue(article.getId());
            row.createCell(1).setCellValue(article.getTitle());
            row.createCell(2).setCellValue(article.getAuthor());
            row.createCell(3).setCellValue(article.getSort());
            row.createCell(4).setCellValue(article.getTime());
            row.createCell(5).setCellValue(article.getComment());
            row.createCell(6).setCellValue(article.getVisit());
            row.createCell(7).setCellValue(article.getContent());
         
        }
        OutputStream outputStream= new FileOutputStream(path+name);
        xssfWorkbook.write(outputStream);
        outputStream.close();
    }
}
