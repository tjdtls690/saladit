package project.spring.web.basket.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.basket.BasketVO;

@Repository
public class BasketDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BasketVO> getBasketList(BasketVO vo) {
		return sqlSessionTemplate.selectList("BasketDAO.getBasketList", vo);
	}
	public void getBasketChangeList(BasketVO vo) {
		sqlSessionTemplate.update("BasketDAO.getBasketChangeList", vo);
	}
	public void deleteBasketList(BasketVO vo) {
		sqlSessionTemplate.delete("BasketDAO.deleteBasketList", vo);
	}
	
	public int insertBasket(BasketVO vo) {
		return sqlSessionTemplate.insert("BasketDAO.insertBasket",vo);
	}
}

