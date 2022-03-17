package project.spring.web.md_recommand.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.md_recommand.MdRecommandVO;

@Repository
public class MdRecommandDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<MdRecommandVO> getMd(MdRecommandVO vo) {
		return sqlSessionTemplate.selectList("MdRecommandDAO.getMd", vo);
	}
}
