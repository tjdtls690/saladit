package project.spring.web.tapPage;

import java.util.List;

public interface TapPageService {
	List<TapPageVO> getItemInfo(TapPageVO vo);
	TapPageVO getItemInfoOne(TapPageVO vo);
	
	TapPageVO getAvgCount(TapPageVO vo);
//	슬라이드용 이미지 랜덤 정보 추출
	List<TapPageVO> getRandom(TapPageVO vo);
	List<TapPageVO> getRandom2(TapPageVO vo);
}
