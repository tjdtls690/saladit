package project.spring.web.mapping;

public class MappingVO {
	private int item_code;
	private int subscribe_code;
	
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
	@Override
	public String toString() {
		return "MappingVO [item_code=" + item_code + ", subscribe_code=" + subscribe_code + "]";
	}
}
