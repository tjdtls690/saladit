package project.spring.web.paymentSingle;

import java.util.List;

public interface PaymentSingleService {
	List<PaymentSingleCouponInfoVO> getMyPaymentCoupon(PaymentSingleCouponInfoVO vo);
}
