package project.spring.web.tapPage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.tapPage.TapPageVO;

@Repository
public class TapPageDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<TapPageVO> getItemInfo01(TapPageVO vo){
		 return sqlSessionTemplate.selectList("TapPageDAO.getItemInfoList01", vo);
	}
	
	public List<TapPageVO> getItemInfo02(TapPageVO vo){
		return sqlSessionTemplate.selectList("TapPageDAO.getItemInfoList02", vo);
	}
	
	public TapPageVO getAvgCount(TapPageVO vo) {
		return sqlSessionTemplate.selectOne("TapPageDAO.getAvgCount",vo);
	}
//	슬라이드용 랜덤 정보 추출	
	public List<TapPageVO> getRandom(TapPageVO vo) {
		return sqlSessionTemplate.selectList("TapPageDAO.getRandom",vo);
	}
	public List<TapPageVO> getRandom2(TapPageVO vo) {
		return sqlSessionTemplate.selectList("TapPageDAO.getRandom2",vo);
	}
	public TapPageVO getItemInfoOne01(TapPageVO vo) {
		return sqlSessionTemplate.selectOne("TapPageDAO.getItemInfoOne01",vo);
	}
	public TapPageVO getItemInfoOne02(TapPageVO vo) {
		return sqlSessionTemplate.selectOne("TapPageDAO.getItemInfoOne02",vo);
	}
}
