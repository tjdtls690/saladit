package project.spring.web.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.detail.DetailVO;
import project.spring.web.order.OrderService;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderDAO orderDAO;

	@Override
	public List<DetailVO> getitemInfo(DetailVO vo) {
		if(vo.getItem_tag_main() != 100 && vo.getItem_tag_main() != 600 && vo.getItem_tag_main() != 1) {
			return orderDAO.getItem(vo);
		}else if(vo.getItem_tag_main() == 1){
			return orderDAO.getEvent(vo);
		}else {
			return orderDAO.getSubscribe(vo);
		}
	}

	@Override
	public DetailVO getitemInfoOne(DetailVO vo) {
		if(vo.getItem_tag_main() != 100 && vo.getItem_tag_main() != 600) {
			return orderDAO.getItemOne(vo);
		}else {
			return orderDAO.getSubscribeOne(vo);
		}
	}
	
	
}
