package project.spring.web.search.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.search.SearchVO;

@Repository
public class SearchDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<SearchVO> getSearchItem(SearchVO vo){
		return sqlSessionTemplate.selectList("SearchDAO.getSearchItem", vo);
	}
	
	public List<SearchVO> getSearchSubscribe(SearchVO vo){
		return sqlSessionTemplate.selectList("SearchDAO.getSearchSubscribe", vo);
	}
	
	public int getSearchItemNum(SearchVO vo){
		return sqlSessionTemplate.selectOne("SearchDAO.getSearchItemNum", vo);
	}
	
	public int getSearchSubscribeNum(SearchVO vo){
		return sqlSessionTemplate.selectOne("SearchDAO.getSearchSubscribeNum", vo);
	}
}
