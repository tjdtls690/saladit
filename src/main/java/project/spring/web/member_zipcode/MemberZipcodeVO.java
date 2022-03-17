package project.spring.web.member_zipcode;

public class MemberZipcodeVO {
	private int member_zipcode_code;
	private int member_code;
	private String member_zipcode;
	private String member_address;
	private String member_detail_address;
	private String member_shipping_address;
	private String member_default_address;
	private int member_delivery_type;

	public int getMember_zipcode_code() {
		return member_zipcode_code;
	}

	public void setMember_zipcode_code(int member_zipcode_code) {
		this.member_zipcode_code = member_zipcode_code;
	}

	public int getMember_code() {
		return member_code;
	}

	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	public String getMember_zipcode() {
		return member_zipcode;
	}

	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_detail_address() {
		return member_detail_address;
	}

	public void setMember_detail_address(String member_detail_address) {
		this.member_detail_address = member_detail_address;
	}

	public String getMember_shipping_address() {
		return member_shipping_address;
	}

	public void setMember_shipping_address(String member_shipping_address) {
		this.member_shipping_address = member_shipping_address;
	}

	public String getMember_default_address() {
		return member_default_address;
	}

	public void setMember_default_address(String member_default_address) {
		this.member_default_address = member_default_address;
	}

	public int getMember_delivery_type() {
		return member_delivery_type;
	}

	public void setMember_delivery_type(int member_delivery_type) {
		this.member_delivery_type = member_delivery_type;
	}

	@Override
	public String toString() {
		return "MemberZipcodeVO [member_zipcode_code=" + member_zipcode_code + ", member_code=" + member_code
				+ ", member_zipcode=" + member_zipcode + ", member_address=" + member_address
				+ ", member_detail_address=" + member_detail_address + ", member_shipping_address="
				+ member_shipping_address + ", member_default_address=" + member_default_address
				+ ", member_delivery_type=" + member_delivery_type + "]";
	}

}
