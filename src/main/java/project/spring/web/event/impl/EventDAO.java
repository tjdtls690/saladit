package project.spring.web.event.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.event.CouponVO;

@Repository
public class EventDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<CouponVO> getCoupon(CouponVO vo) {
		return sqlSessionTemplate.selectList("EventDAO.getCoupon", vo);
	}
	
	public void insertCoupon(CouponVO vo) {
		sqlSessionTemplate.insert("EventDAO.insertCoupon", vo);
	}
	
	public List<CouponVO> getCouponPack(CouponVO vo) {
		return sqlSessionTemplate.selectList("EventDAO.getCouponPack", vo);
	}
	
	public CouponVO getCouponDetail(CouponVO vo) {
		return sqlSessionTemplate.selectOne("EventDAO.getCouponDetail", vo);
	}
	
	public List<CouponVO> getAllCoupon(CouponVO vo) {
		return sqlSessionTemplate.selectList("EventDAO.getAllCoupon");
	}
	
	public List<CouponVO> getUserCoupon(CouponVO vo) {
		return sqlSessionTemplate.selectList("EventDAO.getUserCoupon");
	}
}
