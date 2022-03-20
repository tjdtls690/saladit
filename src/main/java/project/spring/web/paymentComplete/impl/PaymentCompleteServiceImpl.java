package project.spring.web.paymentComplete.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Service
public class PaymentCompleteServiceImpl  implements PaymentCompleteService{
	
	@Autowired
	PaymentCompleteDAO paymentCompleteDAO;

	@Override
	public int paymentInfoSave(PaymentMyDetailSideInfoVO vo) {
		return paymentCompleteDAO.paymentInfoSave(vo);
	}

	@Override
	public int paymentMappingItemInfoSave(PaymentMyDetailInfoVO vo) {
		return paymentCompleteDAO.paymentMappingItemInfoSave(vo);
	}

	@Override
	public int deleteItem(PaymentMyDetailInfoVO vo) {
		return paymentCompleteDAO.deleteItem(vo);
	}
	
	
}
