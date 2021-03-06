package project.spring.web.admin_main.report.day;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;

@Controller
public class AdminReportDayController {
	
	@Autowired
	private AdminReportDayService adminReportDayService;
	
	// 엑셀로 내보내기
		@RequestMapping(value = "/excelDown.mdo")
		public void excelDown(HttpServletResponse response) throws Exception {
			System.out.println("엑셀 ");
			// 날짜용 메서드
			LocalDate now = LocalDate.now();
			DecimalFormat df = new DecimalFormat("00");
	        Calendar currentCalendar = Calendar.getInstance();
			
	        // 이번 년도	--> 2022
	        int year = now.getYear();
	        //이번달		--> 03
	      	String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
	      	// 오늘 날짜만 --> 23
	        int thisDay = now.getDayOfMonth();
	        // 이번 년도 + 이번달 + 오늘
	        String today = year+"-"+month+"-"+thisDay;
			// 이번주 첫째날
			currentCalendar.add(Calendar.DATE, 2 - currentCalendar.get(Calendar.DAY_OF_WEEK)); 
		    String firstWeekDay = df.format(currentCalendar.get(Calendar.DATE));  
		    // 이번주의 날짜
	        String thisWeek = year+"-"+month+"-"+firstWeekDay;
			
			
			
			
			AdminReportDayVO vo = new AdminReportDayVO();
			vo.setDate(thisWeek);
			List<AdminReportDayVO> list = adminReportDayService.reportDay(vo);
			
			
		    // 워크북 생성
		    Workbook wb = new HSSFWorkbook();
		    Sheet sheet = wb.createSheet("게시판");
		    Row row = null;
		    Cell cell = null;
		    int rowNo = 0;

		    // 테이블 헤더용 스타일
		    CellStyle headStyle = wb.createCellStyle();

		    // 가는 경계선을 가집니다.
		    headStyle.setBorderTop(BorderStyle.THIN);
		    headStyle.setBorderBottom(BorderStyle.THIN);
		    headStyle.setBorderLeft(BorderStyle.THIN);
		    headStyle.setBorderRight(BorderStyle.THIN);

		    // 배경색은 노란색입니다.
		    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		    // 데이터는 가운데 정렬합니다.
		    headStyle.setAlignment(HorizontalAlignment.CENTER);

		    // 데이터용 경계 스타일 테두리만 지정
		    CellStyle bodyStyle = wb.createCellStyle();
		    bodyStyle.setBorderTop(BorderStyle.THIN);
		    bodyStyle.setBorderBottom(BorderStyle.THIN);
		    bodyStyle.setBorderLeft(BorderStyle.THIN);
		    bodyStyle.setBorderRight(BorderStyle.THIN);

		    // 헤더 생성
		    row = sheet.createRow(rowNo++);
		    
		    cell = row.createCell(0);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("날짜");
		    
		    cell = row.createCell(1);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("판매 건수");
		    
		    cell = row.createCell(2);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("원 가");
		    
		    cell = row.createCell(3);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("배송비");
		    
		    cell = row.createCell(4);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("총가격");
		    
		    cell = row.createCell(5);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("쿠폰가");
		    
		    cell = row.createCell(6);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("포인트사용");
		    
		    cell = row.createCell(7);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("할인");
		    
		    cell = row.createCell(8);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("결제 금액");

		    // 데이터 부분 생성
		    
		    
		    for(int i=0; i <list.size(); i++) {
		    	row = sheet.createRow(rowNo++);
		    	cell =row.createCell(0);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getDate());
		    	
		    	cell =row.createCell(1);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getCount());
		    	
		    	cell =row.createCell(2);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getPrice()+"원");
		    	
		    	cell =row.createCell(3);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getDelivery()+"원");
		    	
		    	cell =row.createCell(4);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getPriceSum()+"원");
		    	
		    	cell =row.createCell(5);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getPriceCoupon()+"원");
		    	
		    	cell =row.createCell(6);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getPricepoint()+"원");
		    	
		    	cell =row.createCell(7);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getPriceSail()+"원");
		    	
		    	cell =row.createCell(8);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getPriceFinal()+"원");
		    }
		    

		    // 컨텐츠 타입과 파일명 지정
		    response.setContentType("ms-vnd/excel");
		    response.setHeader("Content-Disposition", "attachment;filename=daily_sales_report.xls");

		    // 엑셀 출력
		    wb.write(response.getOutputStream());
		    wb.close();

		}
		
		@RequestMapping("/pdfDown.mdo")
	   public String pdfDownload(Model model){
			//날짜용 메서드
			LocalDate now = LocalDate.now();
			DecimalFormat df = new DecimalFormat("00");
	        Calendar currentCalendar = Calendar.getInstance();
	        // 이번 년도	--> 2022
	        int year = now.getYear();
	        //이번달		--> 03
	      	String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
			// 이번달 시작일
			String startDay = year+"-"+month+"-"+"01";
			// 이번달 마지막일
			int str = currentCalendar.getActualMaximum(Calendar.DAY_OF_MONTH);
			String endDay = year+"-"+month+"-"+str;
			
			AdminReportDayVO vo = new AdminReportDayVO();
			vo.setDate(startDay);
			vo.setImpl(endDay);
			List<AdminReportDayVO> list2 = adminReportDayService.reportMonth(vo);

		  
//	        List<String> list = new ArrayList<String>();
//	        list.add("회원ID : "+ "2");
//	        list.add("예매번호 : "+ "1");
	      
	       //출력할 뷰 이름 리턴
	       model.addAttribute("list", list2);
	        return "pdf";
	   }
	
}
