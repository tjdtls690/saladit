package project.spring.web.event.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.event.CouponVO;
import project.spring.web.event.EventService;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventDAO eventDAO;
	
	@Override
	public List<CouponVO> getCoupon(CouponVO vo) {
		
		return eventDAO.getCoupon(vo);
	}

	@Override
	public void insertCoupon(CouponVO vo) {
		eventDAO.insertCoupon(vo);

	}
	
	@Override
	public List<CouponVO> getCouponPack(CouponVO vo) {
		return eventDAO.getCouponPack(vo);
	}
	
	@Override
	public CouponVO getCouponDetail(CouponVO vo) {
		return eventDAO.getCouponDetail(vo);
	}

	@Override
	public List<CouponVO> getAllCoupon(CouponVO vo) {
		return eventDAO.getAllCoupon(vo);
	}
	
	@Override
	public List<CouponVO> getUserCoupon(CouponVO vo) {
		return eventDAO.getUserCoupon(vo);
	}
	
}
