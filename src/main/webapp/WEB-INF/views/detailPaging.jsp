<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
	                               	  <c:forEach var="board" items="${boardList }" varStatus="i">
		                               	  <li data-v-22105fb8="" data-v-f8b893b0="" class="review-item">
		                                     <div data-v-22105fb8="" class="review-item__head">
		                                        <div data-v-22105fb8="" class="head-rating">
		                                           <img data-v-22105fb8=""
		                                              src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png" 
		                                              class="rating-img">
		                                           <div data-v-22105fb8="" class="rating-count">${board.star }</div>
		                                        </div>
		                                        <div data-v-22105fb8="" class="head-summary">
		                                           <div data-v-22105fb8="" class="head-summary-left">
		                                             	<c:if test="${!empty board.image }">
		                                              		<img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_pics.png"
		                                                  		class="summary-photo">
														</c:if>
		                                              <div data-v-22105fb8="" class="summary-text">${board.content }</div>
		                                           </div>
		                                           <c:forEach var="reviewReply" items="${reviewReply }">
			                                           <c:if test="${reviewReply.seq == board.seq}">
			                                           		<img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_reply%402x.png" alt="????????? ??????" class="summary-answer">
		                                           		</c:if>
		                                           </c:forEach>
		                                           <!---->
		                                        </div>
		                                        <div data-v-22105fb8="" class="head-text">
		                                           <div data-v-22105fb8="" class="text-name">${board.user_name }</div>
		                                           <div data-v-22105fb8="" class="text-date">${fn:substring(board.write_date, 0, 10)}</div>
		                                        </div>
		                                     </div>
		                                     <div data-v-22105fb8=""
		                                        class="review-desktop-toggle review-hide">
		                                        <div data-v-22105fb8="" class="review-item__body">
		                                           <div data-v-22105fb8="" class="review-item__comment">${board.content }</div>
		                                           <div data-v-22105fb8="" class="review-item__photos">
		                                           
		                                           
		                                              <c:forEach var="reviewImage" items="${reviewImage[i.index] }" varStatus="j">
				                                           <c:if test="${reviewImage != '0' }">
				                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
				                                                 <div data-v-22105fb8="" class="review-item__photo"
				                                                    style="background-image: url(&quot;${reviewImage}&quot;);"></div>
				                                                 <input type="hidden" value="${reviewImage }">
				                                              </div>
				                                           </c:if>
		                                              </c:forEach>
		                                           </div>
		                                        </div>
		                                        <c:forEach var="reviewReply" items="${reviewReply }">
		                                           <c:if test="${reviewReply.seq == board.seq}">
														<div data-v-22105fb8="" class="review-item__reply">
															<p data-v-22105fb8="" class="review-item__admin-name">
																?????????_?????????</p>
															<p data-v-22105fb8=""
																class="review-item__admin-comment">???????????????.
																?????????????????? (?????? ?????????)??? ????????? ????????? ????????? ???????????? ?????? ????????? ?????? ???????????????.

																${reviewReply.replycontents }</p>
															<p data-v-22105fb8="" class="review-item__date">
																${reviewReply.replydate }</p>
														</div>
													</c:if>
												</c:forEach>
		                                        <!---->
		                                     </div>
		                                  </li>
	                                  </c:forEach>
