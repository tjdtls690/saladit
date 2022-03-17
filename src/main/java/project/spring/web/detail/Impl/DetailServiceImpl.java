package project.spring.web.detail.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.detail.DetailService;
import project.spring.web.detail.DetailVO;

@Service("detailService")
public class DetailServiceImpl implements DetailService {
	@Autowired
	DetailDAO detailDAO;
	
	@Override
	public DetailVO getItem(DetailVO vo) {
//		System.out.println("getAvgCount 실행");
		return detailDAO.getItem(vo);
	}

	@Override
	public DetailVO getInfo(DetailVO vo) {
//		System.out.println("getInfo 실행");
		return detailDAO.getInfo(vo);
	}

	@Override
	public DetailVO getSubItem(DetailVO vo) {
//		System.out.println("getSubItem 실행");
		return detailDAO.getSubItem(vo);
	}

	@Override
	public List<DetailVO> getRandom(DetailVO vo) {
//		System.out.println("getRandom 실행");
		return detailDAO.getRandom(vo);
	}

}
