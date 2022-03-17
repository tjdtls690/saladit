package project.spring.web.member;

import java.time.LocalDate;

public class MemberVO {
	private int memberCode;
	private String email;
	private String password;
	private String name;
	private String nickname;
	private LocalDate birthday;
	private String birthdayTmp;
	private String phone;
	private String gender;
	private String memberType;
	private int smsCheck;

	public String getBirthdayTmp() {
		return birthdayTmp;
	}

	public void setBirthdayTmp(String birthdayTmp) {
		this.birthdayTmp = birthdayTmp;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getSmsCheck() {
		return smsCheck;
	}

	public void setSmsCheck(int smsCheck) {
		this.smsCheck = smsCheck;
	}

	@Override
	public String toString() {
		return "MemberVO [memberCode=" + memberCode + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", nickname=" + nickname + ", birthday=" + birthday + ", birthdayTmp=" + birthdayTmp + ", phone="
				+ phone + ", gender=" + gender + ", memberType=" + memberType + ", smsCheck=" + smsCheck + "]";
	}

}
