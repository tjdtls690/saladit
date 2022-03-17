package project.spring.web.search;

import java.util.List;

import project.spring.web.tapPage.TapPageVO;

public interface SearchService {
	List<SearchVO> getSearchItem(SearchVO vo);
	// �̸��� ������ �Ƹ� �޼ҵ� ������ �� ���� ������ ����  getSearchItem 
	List<SearchVO> getSearchSubscribe(SearchVO vo);
	
	int getSearchItemNum(SearchVO vo);
	
	int getSearchSubscribeNum(SearchVO vo);
}

