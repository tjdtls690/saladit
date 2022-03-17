package project.spring.web.paymentSingle;

public class PaymentSingleCouponInfoVO {
	private String user_code;
	private String coupon_code;
	private String coupon_pack;
	private String coupon_type;
	private String coupon_explain;

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public String getCoupon_code() {
		return coupon_code;
	}

	public void setCoupon_code(String coupon_code) {
		this.coupon_code = coupon_code;
	}

	public String getCoupon_pack() {
		return coupon_pack;
	}

	public void setCoupon_pack(String coupon_pack) {
		this.coupon_pack = coupon_pack;
	}

	public String getCoupon_type() {
		return coupon_type;
	}

	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}

	public String getCoupon_explain() {
		return coupon_explain;
	}

	public void setCoupon_explain(String coupon_explain) {
		this.coupon_explain = coupon_explain;
	}

	@Override
	public String toString() {
		return "PaymentSingleCouponInfoVO [user_code=" + user_code + ", coupon_code=" + coupon_code + ", coupon_pack="
				+ coupon_pack + ", coupon_type=" + coupon_type + ", coupon_explain=" + coupon_explain + "]";
	}

}
