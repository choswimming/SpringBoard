package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itwillbs.persistence.BoardDAO;
import com.itwllbs.domain.BoardVO;

public class BoardServiceImpl implements BoardService{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	// DAO 객체를 주입
	@Inject
	private BoardDAO bdao;
	
	@Override
	public void regist(BoardVO vo) throws Exception {
		logger.debug(" 연결된 DAO 메서드를 호출 ");
		
		bdao.create(vo);
		
		logger.debug(" 글쓰기 완료! ");
		
		
	}




}
