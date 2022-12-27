package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import log.Log;
import logCsv.LogCsv;
import service.DataService;
import vo.DataVO;

@Controller
public class DataController {
		
	@Autowired
	private DataService service;
	
	@Autowired
	private Log log;
	
	@Autowired
	private LogCsv logCsv;
	
//	private String checkSec = "";
//	private int checkCount = 0;
	
	@RequestMapping("/dataWrite.do")
	@ResponseBody
	private void dataWrite(DataVO data, HttpServletResponse response) {
		
		///////////////////////
		
		System.out.println(data.toString());
//		
//		Date now = new Date();
//		
//		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
//		
//		String ct = sdfTime.format(now).toString();
//		
//		System.out.println("time : " + ct);
//		
//		System.out.println("시 : " + ct.substring(0,2));
//		System.out.println("분 : " + ct.substring(3,5));
//		System.out.println("초 : " + ct.substring(6));
//		
//		String sec = ct.substring(6);
//		
//		System.out.println("sec : " + sec);
//		
//		System.out.print("pu : " + data.getPu());
//		System.out.print("hu : " + data.getHu());
//		System.out.print("he : " + data.getHe());
//		System.out.print("co : " + data.getCo());
		
		///////////////////////////////////////////////
		
//		if(ct.substring(3,5).equals("00")) {
//			System.out.println("00분");
//		}
//		
//		if(ct.substring(6).equals("00")) {
//			System.out.println("00초");
//		}
		
		try {
			
//			if(ct.equals("23:59:59") || ct.equals("00:00:00") || ct.equals("00:00:01")) {
//				System.out.println("00시");
//				System.out.println(service.DBreset());
//			}
			
			if(service.checkRest()) {
				System.out.println("00시");
				System.out.println(service.DBreset());
			}
			
//			if(ct.equals("01:42:00") || ct.equals("01:42:01") || ct.equals("01:42:02")) {
//				System.out.println("00시");
//				System.out.println(service.DBreset());
//			}
			
//			if(service.currentCount() >= 10) {
//				System.out.println("초과");
//				System.out.println(service.DBreset1());
//			}
			
			
			
			
//			if(checkCount == 0) {
//				checkSec = sec;
//			}
//			
//			checkCount += 1;
//			
//			System.out.println("checkCount : " + checkCount);
//			System.out.println("checkSec : " + checkSec);
//			System.out.println("sec : " + sec);
			
			if(service.checkWrite()) {
				
				service.dataWrite(data);
				
				log.writeLog(data);
				logCsv.writeLogCsv(data);
				
//				checkSec = sec;
//				
//				checkCount = 1;
				
			}
			
			
//			if(ct.substring(7).equals("0") || ct.substring(7).equals("5")) {
//				System.out.println("5초마다");
//				log.writeLog(data);
//				logCsv.writeLogCsv(data);
//			}
			
			//response.sendRedirect("dataViewForm.do");
			//response.sendRedirect("test.do");

			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("글쓰기 결과 실패");
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping("/dataViewForm.do")
	private ModelAndView dataViewForm() {
		
		ModelAndView mv = new ModelAndView("data_view");
		
		// mv.addObject("data", data);
		
//		int currentNum = service.currentNum();
//		
//		DataVO currentData = service.currentData(currentNum);
//		
//		mv.addObject("currentData", currentData);
		
		return mv;
		
	}
	
	@RequestMapping("/currentDataView.do")
	@ResponseBody
	public String currentDataView() throws UnsupportedEncodingException {
		
		System.out.println("currentDataView.do");
		
		Gson gson = new Gson();
				
		String result = URLEncoder.encode(gson.toJson(service.currentDataView()), "utf-8");
		
		return result;
		
	}
	
	@RequestMapping("/realtimeDataForm.do")
	private ModelAndView realtimeDataForm(String sub) {
		
		ModelAndView mv = new ModelAndView("realtime_data");
		
		mv.addObject("sub", sub);
		
		return mv;
		
	}

	
	@RequestMapping("/realtimeData.do")
	@ResponseBody
	private String realtimeData() {	
		
		Gson gson = new Gson();
		return gson.toJson(service.realtimeData());
		
	}
	
	@RequestMapping("/minAvgForm.do")
	private ModelAndView minAvgForm(String sub) {	
		
		ModelAndView mv = new ModelAndView("min_avg");
		
		mv.addObject("sub", sub);
		
		return mv;
		
	}
	
	@RequestMapping("/minAvg.do")
	@ResponseBody
	private String minAvg() throws ParseException {	
		
		Gson gson = new Gson();
		return gson.toJson(service.minAvg());
		
	}
	
	////////////
	
	@RequestMapping("/test.do")
	private String test(DataVO data) {		
		
		
		return "test";
		
	}
	
	@RequestMapping("/csvTest.do")
	private String csvTest() throws ParseException {		
		
		service.minAvg();
		
		return "csv_test";
		
	}
	
}
