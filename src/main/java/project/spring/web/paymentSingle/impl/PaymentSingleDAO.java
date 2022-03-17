package project.spring.web.paymentSingle.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.paymentSingle.PaymentSingleCouponInfoVO;

@Repository
public class PaymentSingleDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<PaymentSingleCouponInfoVO> getMyPaymentCoupon(PaymentSingleCouponInfoVO vo){
		return sqlSessionTemplate.selectList("PaymentDAO.paymentGetCoupon", vo);
	}
}
