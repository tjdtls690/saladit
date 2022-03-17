package project.spring.web.modal.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.modal.ModalService;
import project.spring.web.modal.ModalVO;

@Service("modalService")
public class ModalServiceImpl implements ModalService {
	
	@Autowired
	ModalDAO modalDAO;
	
	@Override
	public List<ModalVO> getModalList(ModalVO vo) {
		System.out.println("getModalList 실행");
		return modalDAO.getModalList(vo);
	}

}
