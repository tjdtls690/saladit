package project.spring.web.review.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.review.WriteReviewService;
import project.spring.web.review.WriteReviewVO;
import project.spring.web.utill.Criteria;
import project.spring.web.utill.PageMaker;

@Service
public class WriteReviewServiceImpl implements WriteReviewService{
	
	@Autowired
	WriteReviewDAO writeReviewDAO;

	@Override
	public void insertReview(WriteReviewVO vo) {
		writeReviewDAO.insertReview(vo);
	}

	@Override
	public void updateReview(WriteReviewVO vo) {
		writeReviewDAO.updateReview(vo);
	}

	@Override
	public void deleteReview(WriteReviewVO vo) {
		writeReviewDAO.deleteReview(vo);
	}

	@Override
	public WriteReviewVO getReview(WriteReviewVO vo) {
		return writeReviewDAO.getReview(vo);
	}
	
	@Override
	public List<WriteReviewVO> getReviewList(WriteReviewVO vo) {
		System.out.println(vo.getTagMain());
		System.out.println(vo.getItem_code());
		if(vo.getTagMain() / 100 != 1 && vo.getTagMain() / 100 != 6) return writeReviewDAO.getReviewList01(vo);
		return writeReviewDAO.getReviewList02(vo);
	}
// 페이징 처리	
	@Override
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
	    return writeReviewDAO.selectBoardList(cri);
	}

	@Override
	public int countBoardListTotal(PageMaker pageMaker) {
		System.out.println("countBoardListTotal serviceImpl");
		return writeReviewDAO.countBoardList(pageMaker);

	}
	
}
