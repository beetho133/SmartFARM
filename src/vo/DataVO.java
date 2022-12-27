package vo;

import java.util.Date;

public class DataVO {
	
	private int num;
	private Date date;
	private int li;
	private int it;
	private int ih;
	private int st;
	private int sh;
	private int pu;
	private int hu;
	private int he;
	private int co;
	
	public DataVO() {
		// TODO Auto-generated constructor stub
	}

	public DataVO(int num, Date date, int li, int it, int ih, int st, int sh, int pu, int hu, int he, int co) {
		super();
		this.num = num;
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
	
	public DataVO(int num, int li, int it, int ih, int st, int sh, int pu, int hu, int he, int co) {
		super();
		this.num = num;
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
	
	public DataVO(Date date, int li, int it, int ih, int st, int sh, int pu, int hu, int he, int co) {
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getLi() {
		return li;
	}

	public void setLi(int li) {
		this.li = li;
	}

	public int getIt() {
		return it;
	}

	public void setIt(int it) {
		this.it = it;
	}

	public int getIh() {
		return ih;
	}

	public void setIh(int ih) {
		this.ih = ih;
	}

	public int getSt() {
		return st;
	}

	public void setSt(int st) {
		this.st = st;
	}

	public int getSh() {
		return sh;
	}

	public void setSh(int sh) {
		this.sh = sh;
	}

	public int getPu() {
		return pu;
	}

	public void setPu(int pu) {
		this.pu = pu;
	}

	public int getHu() {
		return hu;
	}

	public void setHu(int hu) {
		this.hu = hu;
	}

	public int getHe() {
		return he;
	}

	public void setHe(int he) {
		this.he = he;
	}

	public int getCo() {
		return co;
	}

	public void setCo(int co) {
		this.co = co;
	}

	@Override
	public String toString() {
		return "DataVO [num=" + num + ", date=" + date + ", li=" + li + ", it=" + it + ", ih=" + ih + ", st=" + st
				+ ", sh=" + sh + ", pu=" + pu + ", hu=" + hu + ", he=" + he + ", co=" + co + "]";
	}
		
}