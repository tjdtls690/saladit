package project.spring.web.order;

import java.util.List;

import project.spring.web.detail.DetailVO;

public interface OrderService {
	List<DetailVO> getitemInfo(DetailVO vo);
	DetailVO getitemInfoOne(DetailVO vo);
}
