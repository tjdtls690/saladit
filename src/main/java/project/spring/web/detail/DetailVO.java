package project.spring.web.detail;

public class DetailVO {
	private int item_code;
	private int item_tag_main;
	private int item_tag_sub;
	private int item_tag_event;
	private String item_name;
	private String item_summary;
	private String item_explain;
	private int item_price_m;
	private int item_price_m_sub;
	private int item_price_l;
	private int item_price_l_sub;
	private String item_nut;
	private String item_image;
	private String item_info_image;
	private String item_delinfo_image;
	private String item_info;
	
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
	public int getItem_tag_sub() {
		return item_tag_sub;
	}
	public void setItem_tag_sub(int item_tag_sub) {
		this.item_tag_sub = item_tag_sub;
	}
	public int getItem_tag_event() {
		return item_tag_event;
	}
	public void setItem_tag_event(int item_tag_event) {
		this.item_tag_event = item_tag_event;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_summary() {
		return item_summary;
	}
	public void setItem_summary(String item_summary) {
		this.item_summary = item_summary;
	}
	public String getItem_explain() {
		return item_explain;
	}
	public void setItem_explain(String item_explain) {
		this.item_explain = item_explain;
	}
	public String getItem_price_m() {
		return getItemPriceM();
	}
	public void setItem_price_m(int item_price_m) {
		this.item_price_m = item_price_m;
	}
	
	public String getItem_price_m_sub() {
		return getItemPriceMSub();
	}
	
	public void setItem_price_m_sub(int item_price_m_sub) {
		this.item_price_m_sub = item_price_m_sub;
	}
	public String getItem_price_l() {
		return getItemPriceL();
	}
	public void setItem_price_l(int item_price_l) {
		this.item_price_l = item_price_l;
	}
	public String getItem_price_l_sub() {
		return getItemPriceLSub();
	}
	public void setItem_price_l_sub(int item_price_l_sub) {
		this.item_price_l_sub = item_price_l_sub;
	}
	public String getItem_nut() {
		return item_nut;
	}
	public void setItem_nut(String item_nut) {
		this.item_nut = item_nut;
	}
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	public String getItem_info_image() {
		return item_info_image;
	}
	public void setItem_info_image(String item_info_image) {
		this.item_info_image = item_info_image;
	}
	public String getItem_delinfo_image() {
		return item_delinfo_image;
	}
	public void setItem_delinfo_image(String item_delinfo_image) {
		this.item_delinfo_image = item_delinfo_image;
	}
	
	public String getItem_info() {
		return item_info;
	}
	public void setItem_info(String item_info) {
		this.item_info = item_info;
	}
	//----------가격에 , 찍기------------------------------------------------------------	
	public String getItemPriceMSub() {
	      String str = String.valueOf(item_price_m_sub);
	      String str1 = "";
	      if(item_price_m_sub != 0) {
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
	public String getItemPriceM() {
	      String str = String.valueOf(item_price_m);
	      String str1 = "";
	      if(item_price_m!= 0) {
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
	public String getItemPriceL() {
	      String str = String.valueOf(item_price_l);
	      String str1 = "";
	      if(item_price_l!= 0) {
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
	public String getItemPriceLSub() {
	      String str = String.valueOf(item_price_l_sub);
	      String str1 = "";
	      if(item_price_l_sub != 0) {
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
//----------------------------------------------------------------------
}
