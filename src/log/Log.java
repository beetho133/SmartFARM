package log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.slf4j.MDC;
import org.springframework.stereotype.Component;

//import ch.qos.logback.classic.sift.MDCBasedDiscriminator;
import controller.DataController;
import vo.DataVO;

@Component
public class Log {
	
//	public Log(){
//		System.setProperty("logfilename", "yyj");
//		System.out.println("ttttttttttttttttttt");
//	}
	
	private static Logger logger = LoggerFactory.getLogger(Log.class);
	
	
	public void writeLog(DataVO data) {
		
		String pu_act = "", hu_act = "", he_act = "", co_act = "";
		
		if(data.getPu() == 0) {
			pu_act = "꺼짐";
		} else {
			pu_act = "켜짐";
		}
		
		if(data.getHu() == 0) {
			hu_act = "꺼짐";
		} else {
			hu_act = "켜짐";
		}
		
		if(data.getHe() == 0) {
			he_act = "꺼짐";
		} else {
			he_act = "켜짐";
		}
		
		if(data.getCo() == 0) {
			co_act = "꺼짐";
		} else {
			co_act = "켜짐";
		}
		
		String msg = "조도 : " + data.getLi() + "lux"
		+ ", 내부온도 : " + data.getIt() + "c" + ", 내부습도 : " + data.getIh() + "%" 
		+ ", 토양온도 : " + data.getSt() + "c" + ", 토양습도 : " + data.getSh() + "%"
		+ ", 펌프 : " + pu_act  + ", 가습 : " + hu_act + ", 발열 : " + he_act + ", 냉각 : " + co_act;
		
		
//		MDC.put("ID", "id");
		logger.info(msg);
	}

}
