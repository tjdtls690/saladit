package project.spring.web.member_zipcode.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.member_zipcode.MemberZipcodeVO;

@Repository
public class MemberZipcodeDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<MemberZipcodeVO> getZipcodeAll(MemberZipcodeVO vo){
		return sqlSessionTemplate.selectList("MemberZipcodeDAO.getZipcodeAll", vo);
	}
	
	public MemberZipcodeVO getZipcodeAll2(MemberZipcodeVO vo){
		return sqlSessionTemplate.selectOne("MemberZipcodeDAO.getZipcodeAll2", vo);
	}
	
	public int getZipcodeAmount(MemberZipcodeVO vo) {
		return sqlSessionTemplate.selectOne("MemberZipcodeDAO.getZipcodeAmount", vo);
	}
	
	public int insertZipcode(MemberZipcodeVO vo) {
		return sqlSessionTemplate.insert("MemberZipcodeDAO.insertZipcode", vo);
	}
	
	public int updateZipcodeDefaultAddress(MemberZipcodeVO vo) {
		return sqlSessionTemplate.update("MemberZipcodeDAO.updateZipcodeDefaultAddress", vo);
	}
}
