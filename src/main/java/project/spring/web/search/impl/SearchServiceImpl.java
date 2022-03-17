package project.spring.web.search.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.search.SearchService;
import project.spring.web.search.SearchVO;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	SearchDAO searchDAO;

	@Override
	public List<SearchVO> getSearchItem(SearchVO vo) {
	
		return searchDAO.getSearchItem(vo);
	}

	@Override
	public List<SearchVO> getSearchSubscribe(SearchVO vo) {
		return searchDAO.getSearchSubscribe(vo);
	}

	@Override
	public int getSearchItemNum(SearchVO vo) {
		return searchDAO.getSearchItemNum(vo);
	}

	@Override
	public int getSearchSubscribeNum(SearchVO vo) {
		return searchDAO.getSearchSubscribeNum(vo);
	}

}
