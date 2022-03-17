package project.spring.web.tapPage;

public class TapPageVO {
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
	
	

	public int getTagSub() {
		return tagSub;
	}

	public void setTagSub(int tagSub) {
		this.tagSub = tagSub;
	}

	public int getTagMain() {
		return tagMain;
	}

	public void setTagMain(int tagMain) {
		this.tagMain = tagMain;
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

	public String getItemPriceM() {
		String str = String.valueOf(itemPriceM);
		String str1 = "";
		char[] ch = str.toCharArray();
		for(int i = 0; i < ch.length; i++) {
			if(i == ch.length - 4) {
				str1 += ch[i] + ",";
				continue;
			}
			str1 += ch[i];
		}
		return str1;
	}

	public void setItemPriceM(int itemPriceM) {
		this.itemPriceM = itemPriceM;
	}

	public String getItemPriceMSub() {
		String str = String.valueOf(itemPriceMSub);
		String str1 = "";
		if(itemPriceMSub != 0) {
			char[] ch = str.toCharArray();
			for(int i = 0; i < ch.length; i++) {
				if(i == ch.length - 4) {
					str1 += ch[i] + ",";
					continue;
				}
				str1 += ch[i];
			}
		}
		return str1;
	}

	public void setItemPriceMSub(int itemPriceMSub) {
		this.itemPriceMSub = itemPriceMSub;
	}

	public String getStarAvg() {
		if(starAvg == 0.0) return "0";
		else return String.valueOf(starAvg);
		
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

	@Override
	public String toString() {
		return "TapPageVO [itemCode=" + itemCode + ", itemImage=" + itemImage + ", itemName=" + itemName
				+ ", itemSummary=" + itemSummary + ", itemPriceM=" + itemPriceM + ", itemPriceMSub=" + itemPriceMSub
				+ ", starAvg=" + starAvg + ", reviewCount=" + reviewCount + ", tagMain=" + tagMain + ", tagSub="
				+ tagSub + "]";
	}

	

}
