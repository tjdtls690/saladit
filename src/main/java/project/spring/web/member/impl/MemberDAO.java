package project.spring.web.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.member.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int checkEmail(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.emailCheck", vo);
	}
	
	public MemberVO getMember(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.getMember", vo);
	}
}