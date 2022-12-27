package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.DataVO;

public interface DataMapper {
	
	public int dataWrite(DataVO data);
	public int currentNum();
	public DataVO currentData(int num);
	public int dataDel();
	public int currentCount();
	public int oldDataDel();
	public int dataResort();
	public int autoReset(int ai);
	public List<DataVO> realtimeData(@Param("count") int count);

	
}


