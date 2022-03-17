package project.spring.web.detail;

import java.util.List;

public interface DetailService {
	
	DetailVO getItem(DetailVO vo);
	
	DetailVO getInfo(DetailVO vo);

	DetailVO getSubItem(DetailVO vo);
	
	List<DetailVO> getRandom(DetailVO vo);
}
