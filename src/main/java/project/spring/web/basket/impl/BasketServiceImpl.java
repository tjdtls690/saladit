package project.spring.web.basket.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.basket.BasketService;
import project.spring.web.basket.BasketVO;

@Service("BasketService")
public class BasketServiceImpl implements BasketService {
	
	@Autowired
	BasketDAO basketDAO;
	
	@Override
	public List<BasketVO> getBasketList(BasketVO vo) {
		return basketDAO.getBasketList(vo);
	}
	
	@Override
	public void getBasketChangeList(BasketVO vo) {
		basketDAO.getBasketChangeList(vo);
	}
	
	@Override
	public void deleteBasketList(BasketVO vo) {
		basketDAO.deleteBasketList(vo);
	}

	@Override
	public int insertBasket(BasketVO vo) {
		System.out.println("--> insertBasket");
	
		return basketDAO.insertBasket(vo);
	}
}
