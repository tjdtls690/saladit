package project.spring.web.basket;

public class BasketVO {
	private int seq;			//
	private String itemImage;	//
	private String itemName;	//
	private int tagMain;		//
	private int tagSub;
	private int amount;			// 개수
	private int price;			//
	private int priceSub;		//
	private int userCode;		//
	private int itemCode;		//
	private int subTotal;		// 개수x가격
	private String itemSize;
	
	
	public String getItemSize() {
		return itemSize;
	}
	public void setItemSize(String itemSize) {
		this.itemSize = itemSize;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getItemImage() {
		return itemImage;
	}
	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getTagMain() {
		return tagMain;
	}
	public void setTagMain(int tagMain) {
		this.tagMain = tagMain;
	}
	public int getTagSub() {
		return tagSub;
	}
	public void setTagSub(int tagSub) {
		this.tagSub = tagSub;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPriceSub() {
		return priceSub;
	}
	public void setPriceSub(int priceSub) {
		this.priceSub = priceSub;
	}

	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public int getItemCode() {
		return itemCode;
	}
	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}
	public int getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(int subTotal) {
		this.subTotal = subTotal;
	}
	
	@Override
	public String toString() {
		return "BasketVO [seq=" + seq + ", itemImage=" + itemImage + ", itemName=" + itemName + ", tagMain=" + tagMain
				+ ", tagSub=" + tagSub + ", amount=" + amount + ", price=" + price + ", priceSub=" + priceSub
				+ ", userCode=" + userCode + ", itemCode=" + itemCode + ", subTotal=" + subTotal + ", itemSize="
				+ itemSize + "]";
	}


}
