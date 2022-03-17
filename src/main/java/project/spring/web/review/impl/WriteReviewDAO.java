package project.spring.web.review.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.review.WriteReviewVO;
import project.spring.web.utill.Criteria;
import project.spring.web.utill.PageMaker;

@Repository
public class WriteReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertReview(WriteReviewVO vo) {
		System.out.println("---> MyBatis로 insertReview() 기능 처리");
		System.out.println(vo.getStar());
		System.out.println(vo.getUser_name());
		System.out.println(vo.getContent());
		sqlSessionTemplate.insert("WriteReviewDAO.insertReview", vo);
	}

	public void updateReview(WriteReviewVO vo) {
		System.out.println("---> MyBatis로 updateReview() 기능 처리");
		sqlSessionTemplate.update("WriteReviewDAO.updateReview", vo);
	}

	public void deleteReview(WriteReviewVO vo) {
		System.out.println("---> MyBatis로 deleteReview() 기능 처리");
		sqlSessionTemplate.delete("WriteReviewDAO.deleteReview", vo);
	}

	public WriteReviewVO getReview(WriteReviewVO vo) {
		System.out.println("---> MyBatis로 getReview() 기능 처리");
		return (WriteReviewVO) sqlSessionTemplate.selectOne("WriteReviewDAO.getReview", vo);
	}

	public List<WriteReviewVO> getReviewList01(WriteReviewVO vo) {
		System.out.println("---> DAO에서 item_code맞는 리뷰 가져오기");
		return sqlSessionTemplate.selectList("WriteReviewDAO.getReviewList01", vo);
	}
	public List<WriteReviewVO> getReviewList02(WriteReviewVO vo) {
		System.out.println("---> DAO에서 subscribe_code맞는 리뷰 가져오기");
		return sqlSessionTemplate.selectList("WriteReviewDAO.getReviewList02", vo);
	}
	
// 페이징 처리
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		System.out.println("--->MyBatis selectBoardList 실행");
	    return sqlSessionTemplate.selectList("WriteReviewDAO.selectBoardList", cri);
	}

	public int countBoardList(PageMaker pageMaker){
		System.out.println("--->MyBatis countBoardList 실행");
	    return sqlSessionTemplate.selectOne("WriteReviewDAO.countBoardList", pageMaker);
	}
}
