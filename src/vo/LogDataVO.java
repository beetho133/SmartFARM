package vo;

import java.util.Date;

public class LogDataVO {
	
	private String date;
	private String li;
	private String it;
	private String ih;
	private String st;
	private String sh;
	private String pu;
	private String hu;
	private String he;
	private String co;
	
	public LogDataVO() {
		// TODO Auto-generated constructor stub
	}

	public LogDataVO(String date, String li, String it, String ih, String st, String sh, String pu, String hu,
			String he, String co) {
		super();
		this.date = date;
		this.li = li;
		this.it = it;
		this.ih = ih;
		this.st = st;
		this.sh = sh;
		this.pu = pu;
		this.hu = hu;
		this.he = he;
		this.co = co;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getLi() {
		return li;
	}

	public void setLi(String li) {
		this.li = li;
	}

	public String getIt() {
		return it;
	}

	public void setIt(String it) {
		this.it = it;
	}

	public String getIh() {
		return ih;
	}

	public void setIh(String ih) {
		this.ih = ih;
	}

	public String getSt() {
		return st;
	}

	public void setSt(String st) {
		this.st = st;
	}

	public String getSh() {
		return sh;
	}

	public void setSh(String sh) {
		this.sh = sh;
	}

	public String getPu() {
		return pu;
	}

	public void setPu(String pu) {
		this.pu = pu;
	}

	public String getHu() {
		return hu;
	}

	public void setHu(String hu) {
		this.hu = hu;
	}

	public String getHe() {
		return he;
	}

	public void setHe(String he) {
		this.he = he;
	}

	public String getCo() {
		return co;
	}

	public void setCo(String co) {
		this.co = co;
	}

	@Override
	public String toString() {
		return "LogDataVO [date=" + date + ", li=" + li + ", it=" + it + ", ih=" + ih + ", st=" + st + ", sh=" + sh
				+ ", pu=" + pu + ", hu=" + hu + ", he=" + he + ", co=" + co + "]";
	}
	
	
	

}
