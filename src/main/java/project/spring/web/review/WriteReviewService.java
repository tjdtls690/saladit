package project.spring.web.review;

import java.util.List;
import java.util.Map;

import project.spring.web.utill.Criteria;
import project.spring.web.utill.PageMaker;

public interface WriteReviewService {
	void insertReview(WriteReviewVO vo);

	void updateReview(WriteReviewVO vo);

	void deleteReview(WriteReviewVO vo);

	WriteReviewVO getReview(WriteReviewVO vo);

	List<WriteReviewVO> getReviewList(WriteReviewVO vo);

// 페이징 처리
	List<Map<String, Object>> selectBoardList(Criteria cri);
	
	int countBoardListTotal(PageMaker pageMaker);

}
