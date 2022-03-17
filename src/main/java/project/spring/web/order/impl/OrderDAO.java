package project.spring.web.order.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.detail.DetailVO;

@Repository
public class OrderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<DetailVO> getItem(DetailVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.getItem", vo);
	}
	
	public List<DetailVO> getSubscribe(DetailVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.getSub", vo);
	}
	
	public List<DetailVO> getEvent(DetailVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.getEvent", vo);
	}
	
	public DetailVO getItemOne(DetailVO vo){
		return sqlSessionTemplate.selectOne("OrderDAO.getItemOne", vo);
	}
	
	public DetailVO getSubscribeOne(DetailVO vo){
		return sqlSessionTemplate.selectOne("OrderDAO.getSubOne", vo);
	}
}
