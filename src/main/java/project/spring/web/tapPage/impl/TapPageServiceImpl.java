package project.spring.web.tapPage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.tapPage.TapPageService;
import project.spring.web.tapPage.TapPageVO;

@Service
public class TapPageServiceImpl implements TapPageService{
	
	@Autowired
	TapPageDAO tapPageDAO;

	@Override
	public List<TapPageVO> getItemInfo(TapPageVO vo) {
			if(vo.getTagMain() / 100 != 1 && vo.getTagMain() / 100 != 6) return tapPageDAO.getItemInfo01(vo);
			else return tapPageDAO.getItemInfo02(vo);
	}

	@Override
	public TapPageVO getAvgCount(TapPageVO vo) {
		System.out.println("getAvgCount 실행");
		return tapPageDAO.getAvgCount(vo);
	}

	@Override
	public List<TapPageVO> getRandom(TapPageVO vo) {
		System.out.println("getRandom 실행");
		return tapPageDAO.getRandom(vo);
	}

	@Override
	public List<TapPageVO> getRandom2(TapPageVO vo) {
		System.out.println("getRandom2 실행");
		return tapPageDAO.getRandom2(vo);
	}
	
	@Override
	public TapPageVO getItemInfoOne(TapPageVO vo) {
			if(vo.getTagMain() / 100 != 1 && vo.getTagMain() / 100 != 6) return tapPageDAO.getItemInfoOne01(vo);
			else return tapPageDAO.getItemInfoOne02(vo);
	}
	
}
