package project.spring.web.paymentSingle.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.paymentSingle.PaymentSingleCouponInfoVO;
import project.spring.web.paymentSingle.PaymentSingleService;

@Service
public class PaymentSingleServiceImpl implements PaymentSingleService{
	
	@Autowired
	PaymentSingleDAO paymentSingleDAO;

	@Override
	public List<PaymentSingleCouponInfoVO> getMyPaymentCoupon(PaymentSingleCouponInfoVO vo) {
		return paymentSingleDAO.getMyPaymentCoupon(vo);
	}
	
	
}
