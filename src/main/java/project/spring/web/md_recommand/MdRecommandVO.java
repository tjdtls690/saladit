package project.spring.web.md_recommand;

public class MdRecommandVO {
	private int md_code;
	private int item_code;
	private int item_tag_main;

	public int getMd_code() {
		return md_code;
	}

	public void setMd_code(int md_code) {
		this.md_code = md_code;
	}

	public int getItem_code() {
		return item_code;
	}

	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}

	public int getItem_tag_main() {
		return item_tag_main;
	}

	public void setItem_tag_main(int item_tag_main) {
		this.item_tag_main = item_tag_main;
	}

	@Override
	public String toString() {
		return "MdRecommandVO [md_code=" + md_code + ", item_code=" + item_code + ", item_tag_main=" + item_tag_main
				+ "]";
	}

}
