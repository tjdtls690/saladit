package project.spring.web.modal.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.modal.ModalVO;

@Repository
public class ModalDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ModalVO> getModalList(ModalVO vo){
		System.out.println("-->myBatis getModalList");
		return sqlSessionTemplate.selectList("ModalDAO.getModalList", vo);
	}

}
