package project.spring.web.review;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class WriteReviewVO {
	private int seq;
	private int item_code;
	private int subscribe_code;
	private int star;
	private String user_name;
	private String content;
	private LocalDate write_date;
	private String image;
	private String reply;
	private int tagMain;
	
	public int getTagMain() {
		return tagMain;
	}
	public void setTagMain(int tagMain) {
		this.tagMain = tagMain;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getItem_code() {
		return item_code;
	}
	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}
	public int getSubscribe_code() {
		return subscribe_code;
	}
	public void setSubscribe_code(int subscribe_code) {
		this.subscribe_code = subscribe_code;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDate getWrite_date() {
		return write_date;
	}
	public void setWrite_date(LocalDate write_date) {
		this.write_date = write_date;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	@Override
	public String toString() {
		return "WriteReviewVO [seq=" + seq + ", item_code=" + item_code + ", subscribe_code=" + subscribe_code
				+ ", star=" + star + ", user_name=" + user_name + ", content=" + content + ", write_date=" + write_date
				+ ", image=" + image + ", reply=" + reply + "]";
	}

}
