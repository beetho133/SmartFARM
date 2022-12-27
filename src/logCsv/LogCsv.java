package logCsv;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import controller.DataController;
import vo.DataVO;

@Component
public class LogCsv {
	
	private static Logger logger = LoggerFactory.getLogger(LogCsv.class);
	
	public void writeLogCsv(DataVO data) {		
		
		String msg = data.getLi()
		+ "," + data.getIt() + "," + data.getIh()
		+ "," + data.getSt() + "," + data.getSh()
		+ "," + data.getPu() + "," + data.getHu() 
		+ "," + data.getHe() + "," + data.getCo();
		
		logger.info(msg);
		
	}

}
