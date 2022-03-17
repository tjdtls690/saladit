package project.spring.web.basket;

import java.util.List;

public interface BasketService {
	List<BasketVO> getBasketList(BasketVO vo);
	
	void getBasketChangeList(BasketVO vo);
	
	void deleteBasketList(BasketVO vo);
	
	int insertBasket(BasketVO vo);
}
