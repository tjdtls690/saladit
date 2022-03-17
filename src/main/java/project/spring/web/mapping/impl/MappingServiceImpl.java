package project.spring.web.mapping.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.mapping.MappingService;
import project.spring.web.mapping.MappingVO;

@Service
public class MappingServiceImpl implements MappingService {
	
	@Autowired
	MappingDAO mappingDAO;
	@Override
	public List<MappingVO> getItemCodeList(MappingVO vo) {
		return mappingDAO.getItemCodeList(vo);
	}

}
