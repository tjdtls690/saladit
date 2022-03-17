package project.spring.web.paymentSingle;

import java.util.List;

public class PaymentSingleListVO {
	private List<PaymentSingleVO> paymentSingleList;

	public List<PaymentSingleVO> getPaymentSingleList() {
		return paymentSingleList;
	}

	public void setPaymentSingleList(List<PaymentSingleVO> paymentSingleList) {
		this.paymentSingleList = paymentSingleList;
	}

	@Override
	public String toString() {
		return "PaymentSingleList [paymentSingleList=" + paymentSingleList + "]";
	}

}
