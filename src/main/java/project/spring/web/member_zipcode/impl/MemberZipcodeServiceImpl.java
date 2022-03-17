package project.spring.web.member_zipcode.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.member_zipcode.MemberZipcodeService;
import project.spring.web.member_zipcode.MemberZipcodeVO;

@Service
public class MemberZipcodeServiceImpl implements MemberZipcodeService{

	@Autowired
	MemberZipcodeDAO memberZipcodeDAO;
	
	@Override
	public List<MemberZipcodeVO> getZipcodeAll(MemberZipcodeVO vo) {
		return memberZipcodeDAO.getZipcodeAll(vo);
	}
	
	@Override
	public int getZipcodeAmount(MemberZipcodeVO vo) {
		return memberZipcodeDAO.getZipcodeAmount(vo);
	}

	@Override
	public int insertZipcode(MemberZipcodeVO vo) {
		return memberZipcodeDAO.insertZipcode(vo);
	}

	@Override
	public int updateZipcodeDefaultAddress(MemberZipcodeVO vo) {
		return memberZipcodeDAO.updateZipcodeDefaultAddress(vo);
	}

	@Override
	public MemberZipcodeVO getZipcodeAll2(MemberZipcodeVO vo) {
		return memberZipcodeDAO.getZipcodeAll2(vo);
	}
	
}
