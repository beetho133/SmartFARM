package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.DataDAO;
import vo.DataVO;
import vo.LogDataVO;

///

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.ColumnPositionMappingStrategy;
import au.com.bytecode.opencsv.bean.CsvToBean;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

///

@Component
public class DataService {
	
	@Autowired
	private DataDAO dao;
	
	private String checkSec = "";
	private int checkCount = 0;
	
	public boolean checkWrite() {
		
		Date now = new Date();
		
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		
		String ct = sdfTime.format(now).toString();
		
		System.out.println("time : " + ct);
		
		System.out.println("시 : " + ct.substring(0,2));
		System.out.println("분 : " + ct.substring(3,5));
		System.out.println("초 : " + ct.substring(6));
		
		String sec = ct.substring(6);
		
		System.out.println("sec : " + sec);
		
		if(checkCount == 0) {
			checkSec = sec;
		}
		
		checkCount += 1;
		
		System.out.println("checkCount : " + checkCount);
		System.out.println("checkSec : " + checkSec);
		System.out.println("sec : " + sec);
		
		if(checkSec.equals(sec)) {
			return false;
		} else {
			checkSec = sec;
			
			checkCount = 1;
			return true;
		}

	}
	
	public boolean checkRest() {
		
		Date now = new Date();
		
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		
		String ct = sdfTime.format(now).toString();
		
		if(ct.equals("23:59:59") || ct.equals("00:00:00") || ct.equals("00:00:01")) {
			return true;
		} else {
			return false;
		}
		
		
		
		
	}

	public int dataWrite(DataVO data) {
		
		System.out.println("service");
		
		dao.dataWrite(data);
		
		return data.getNum();
		
	}
	
	public int currentNum() {
		
		return dao.currentNum();
		
	}
	
	public DataVO currentData(int num) {
		
		return dao.currentData(num);
		
	}
	
	public int DBreset() {
		dao.dataDel();
		
		return dao.autoReset(1);
	}
	
	public int currentCount() {
		return dao.currentCount();
	}
	
	public int DBreset1() {
		
		dao.oldDataDel();
		dao.dataResort();
		
		return dao.autoReset(10);
	}
	
	public DataVO currentDataView() {
		
		return dao.currentData(dao.currentNum());
		
	}
	
	
	//// 실시간 ////
	
	public List<DataVO> realtimeData() {
		
		return dao.realtimeData(dao.currentCount());
		
	}
	
	//// 실시간 ////
	
	//// 분당 평균 ////
	
	private String todayLogFile = "C:\\SmartFARMlogs\\SmartFARM.csv";
 
	public List<LogDataVO> readTodayLog() {
		
		System.out.println("readTodayLog()");
		 
        List<LogDataVO> readData = null;
 
        try {
            CSVReader reader = new CSVReader(new FileReader(todayLogFile));
 
            ColumnPositionMappingStrategy<LogDataVO> start = new ColumnPositionMappingStrategy<LogDataVO>();
            start.setType(LogDataVO.class);
            String[] columns = new String[] {"date", "li", "it", "ih", "st", "sh", "pu", "hu", "he", "co"};
            start.setColumnMapping(columns);
            CsvToBean<LogDataVO> csv = new CsvToBean<LogDataVO>();
            readData = csv.parse(start, reader);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
 
        return readData;
    }
	
	public List<DataVO> minAvg() throws ParseException {
		
		System.out.println("LogMinAvg()");
		
		List<DataVO> LogMinAvgDataList = new ArrayList<DataVO>();
		
		List<LogDataVO> readDataList = readTodayLog();
		
		Iterator<LogDataVO> it = readDataList.iterator();
		
		String checkMin = "";
		
		int checkCount = 0;
		int tempIt = 0;
		int tempSt = 0;
		int tempIh = 0;
		int tempSh = 0;
		
		String tempDate = "";
		
        while (it.hasNext()) {
        	LogDataVO readData = (LogDataVO) it.next();
        	
            StringBuilder sb = new StringBuilder();
            
            sb.append(readData.getDate()).append(" ").append(readData.getLi()).append(" ")
            	.append(readData.getIt()).append(" ").append(readData.getIh()).append(" ")
            	.append(readData.getSt()).append(" ").append(readData.getSh());
            
//            System.out.println(sb.toString());
            
            if(checkCount == 0) {
            	checkMin = readData.getDate().substring(14,16);
            }
            
            
            
            if(!readData.getDate().substring(14,16).equals(checkMin)) {
    			
    			
    			DataVO LogMinAvgData = new DataVO();
    			
    			
    			LogMinAvgData.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tempDate));

//    			System.out.println("tempIt : " + tempIt);
//    			System.out.println("checkCount : " + checkCount);
//    			System.out.println("계산");
    			
    			LogMinAvgData.setIt(tempIt/checkCount);
    			LogMinAvgData.setSt(tempSt/checkCount);
    			LogMinAvgData.setIh(tempIh/checkCount);
    			LogMinAvgData.setSh(tempSh/checkCount);
    			
    			LogMinAvgDataList.add(LogMinAvgData);

    			tempIt = 0;
    			tempSt = 0;
                tempIh = 0;
                tempSh = 0;
    			
    			checkCount = 0;
    			
    			checkMin = readData.getDate().substring(14,16);

    		}
            
            tempIt = tempIt + Integer.parseInt(readData.getIt());
            tempSt = tempSt + Integer.parseInt(readData.getSt());
            tempIh = tempIh + Integer.parseInt(readData.getIh());
            tempSh = tempSh + Integer.parseInt(readData.getSh());            
            
			tempDate = readData.getDate();
            
            checkCount += 1;           
          
        }
        
        for(DataVO tttt : LogMinAvgDataList) {
        	System.out.println(tttt);
        }
		
		return LogMinAvgDataList;
		
	}
   
	
	//// 분당 평균 ////

	
}
