package project.spring.web.search;

public class SearchVO {
	private int itemCode;
	private String itemImage;
	private String itemName;
	private String itemSummary;
	private int itemPriceM;
	private int itemPriceMSub;
	private double starAvg;
	private int reviewCount;
	private int tagMain;
	private int tagSub;
	private int itemTagsub;
	private String search;
	// item_Tag_sub �߰�
	
	

	public int getItemTagsub() {
		return itemTagsub;
	}

	public int getTagSub() {
		return tagSub;
	}

	public void setTagSub(int tagSub) {
		this.tagSub = tagSub;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public void setItemTagsub(int itemTagsub) {
		this.itemTagsub = itemTagsub;
	}

	public int getItemCode() {
		return itemCode;
	}

	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
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

	public String getItemSummary() {
		return itemSummary;
	}

	public void setItemSummary(String itemSummary) {
		this.itemSummary = itemSummary;
	}

	public int getItemPriceM() {
		return itemPriceM;
	}

	public void setItemPriceM(int itemPriceM) {
		this.itemPriceM = itemPriceM;
	}

	public int getItemPriceMSub() {
		return itemPriceMSub;
	}

	public void setItemPriceMSub(int itemPriceMSub) {
		this.itemPriceMSub = itemPriceMSub;
	}

	public double getStarAvg() {
		return starAvg;
	}

	public void setStarAvg(double starAvg) {
		this.starAvg = starAvg;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getTagMain() {
		return tagMain;
	}

	public void setTagMain(int tagMain) {
		this.tagMain = tagMain;
	}

	@Override
	public String toString() {
		return "SearchVO [itemCode=" + itemCode + ", itemImage=" + itemImage + ", itemName=" + itemName
				+ ", itemSummary=" + itemSummary + ", itemPriceM=" + itemPriceM + ", itemPriceMSub=" + itemPriceMSub
				+ ", starAvg=" + starAvg + ", reviewCount=" + reviewCount + ", tagMain=" + tagMain + ", tagSub="
				+ tagSub + ", itemTagsub=" + itemTagsub + ", search=" + search + "]";
	}

	

}
