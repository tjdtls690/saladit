package project.spring.web.mapping.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.mapping.MappingVO;

@Repository
public class MappingDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<MappingVO> getItemCodeList(MappingVO vo) {
		return sqlSessionTemplate.selectList("MappingDAO.getItemCodeList", vo);
	}
}
