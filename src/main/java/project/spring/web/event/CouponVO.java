package project.spring.web.event;

public class CouponVO {
	private int coupon_code;
	private String coupon_type;
	private String coupon_explain;
	private int user_code;
	private int coupon_pack;
	public int getCoupon_code() {
		return coupon_code;
	}
	public void setCoupon_code(int coupon_code) {
		this.coupon_code = coupon_code;
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
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public int getCoupon_pack() {
		return coupon_pack;
	}
	public void setCoupon_pack(int coupon_pack) {
		this.coupon_pack = coupon_pack;
	}
	@Override
	public String toString() {
		return "CouponVO [coupon_code=" + coupon_code + ", coupon_type=" + coupon_type + ", coupon_explain="
				+ coupon_explain + ", user_code=" + user_code + "]";
	}
	
}
