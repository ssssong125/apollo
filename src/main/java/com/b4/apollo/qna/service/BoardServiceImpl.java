package com.b4.apollo.qna.service;

//import com.b4.apollo.qna.model.dao.boardMapper;
import com.b4.apollo.qna.exception.CommonException;
import com.b4.apollo.qna.exception.DataNotFoundException;
import com.b4.apollo.qna.model.dao.BoardMapper;
        import com.b4.apollo.qna.model.dto.Question;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
        import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper boardMapper;


    @Override
    public void deleteBoard(int boardNo) {
        int result = boardMapper.deleteBoard(boardNo);

        if(result < 0) {
            throw new CommonException("게시글삭제실패 ");
        }
    }

    @Override
    public void insertBoard(String boardTitle, String boardContent) {
        Question q = new Question();
        q.setBoardTitle(boardTitle);
        q.setBoardContent(boardContent);
        q.setCreateDate(LocalDateTime.now());
        int result = boardMapper.insertBoard(q);

        if(result < 0) {
            throw new CommonException("게시글 추가 실패 ");
        }
    }

    @Override
    public void updateBoard(Question q, String boardTitle, String boardContent) {
        q.setBoardTitle(boardTitle);
        q.setBoardContent(boardContent);
        q.setCreateDate(LocalDateTime.now());
        int result = boardMapper.updateBoard(q);
    }

    @Override
    public Page<Question> selectList(int pageNum) {
        PageHelper.startPage(pageNum, 10);
        return boardMapper.selectList();
    }


        @Override
        public Question selectBoard ( int bno){
            Optional<Question> question = Optional.ofNullable((Question) this.boardMapper.selectBoard(bno));
            if (question.isPresent()) {
                return question.get();
            } else {
                throw new DataNotFoundException("question not found");
            }
        }
    }

