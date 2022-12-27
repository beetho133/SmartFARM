package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.DataMapper;
import vo.DataVO;

@Component
public class DataDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	public int dataWrite(DataVO data){
		DataMapper mapper = template.getMapper(DataMapper.class);
		return mapper.dataWrite(data);
	}
	
	public int currentNum() {
		DataMapper mapper = template.getMapper(DataMapper.class);
		return mapper.currentNum();
	}
	
	public DataVO currentData(int num) {
		DataMapper mapper = template.getMapper(DataMapper.class);
		return mapper.currentData(num);
	}
	
	public int dataDel() {
		DataMapper mapper = template.getMapper(DataMapper.class);
		return mapper.dataDel();
	}
	
	public int currentCount() {
		DataMapper mapper = template.getMapper(DataMapper.class);
		return mapper.currentCount();
	}
	
	public int oldDataDel() {
		DataMapper mapper = template.getMapper(DataMapper.class);
		return mapper.oldDataDel();
	}
	
	public int dataResort() {
		DataMapper mapper = template.getMapper(DataMapper.class);
		return mapper.dataResort();
	}

	public int autoReset(int ai) {
		DataMapper mapper = template.getMapper(DataMapper.class);
		return mapper.autoReset(ai);
	}
	
	public List<DataVO> realtimeData(int count) {
		DataMapper mapper = template.getMapper(DataMapper.class);
		return mapper.realtimeData(count);
	}
	
}
