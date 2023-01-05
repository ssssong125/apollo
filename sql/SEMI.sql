-- CREATE USER SEMI IDENTIFIED BY SEMI;
-- GRANT CONNECT, RESOURCE TO SEMI;
-- GRANT CREATE VIEW TO SEMI;
-- GRANT CREATE SEQUENCE TO SEMI;
-- GRANT CREATE TRIGGER TO SEMI;

-- 상품 테이블
DROP TABLE TBL_ORDER;
DROP TABLE TBL_PAYMENT;
DROP TABLE TBL_CATEGORY;
DROP TABLE TBL_PRODUCT_IMAGE;
DROP TABLE TBL_CART;
DROP TABLE TBL_BLOG_COMMENT;
DROP TABLE TBL_BLOG_IMAGE;
DROP TABLE TBL_BLOG_BOARD;
DROP TABLE TBL_QUESTION_REPLY;
DROP TABLE TBL_QUESTION;
DROP TABLE TBL_USER;
DROP TABLE TBL_CONTACT;
DROP TABLE TBL_PRODUCT;

DROP SEQUENCE SEQ_ORDER_NO;
DROP SEQUENCE SEQ_PAYMENT_NO;
DROP SEQUENCE SEQ_FILE_NO;
DROP SEQUENCE SEQ_PRODUCT_NO;
DROP SEQUENCE SEQ_CART_NO;
DROP SEQUENCE SEQ_BLOG_NO;
DROP SEQUENCE SEQ_BLOG_IMG_NO;
DROP SEQUENCE SEQ_QNA_NO;
DROP SEQUENCE SEQ_COMMENT_NO;

-- 상품 테이블 
CREATE TABLE TBL_PRODUCT (
                               "PRODUCT_NO"	NUMBER		NOT NULL,
                               "PRODUCT_NAME"	VARCHAR2(50)		NOT NULL,
                               "PRODUCT_PRICE"	NUMBER		NOT NULL,
                               "PRODUCT_DESC"	LONG		NOT NULL,
                               "PRODUCT_QTY"	NUMBER		NOT NULL,
                               "CATEGORY_CODE"	CHAR(3)		NOT NULL
);

-- 상품번호 시퀀스
CREATE SEQUENCE SEQ_PRODUCT_NO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100
    NOCYCLE
    NOCACHE;

-- 카테고리 테이블
CREATE TABLE TBL_CATEGORY (
                                "CATEGORY_CODE"	VARCHAR(30)		NOT NULL,
                                "CATEGORY_NAME"	VARCHAR(50)		NOT NULL
);

-- 장바구니 테이블
CREATE TABLE TBL_CART (
    CART_NO NUMBER		NOT NULL,
    PRODUCT_NO NUMBER		NOT NULL,
    USER_ID	VARCHAR(50)		NOT NULL,
    PRODUCT_COUNT	NUMBER		NOT NULL,
    REG_DATE DATE NOT NULL
);
COMMENT ON COLUMN TBL_CART.CART_NO IS '장바구니 번호';
COMMENT ON COLUMN TBL_CART.PRODUCT_NO IS '상품 번호';
COMMENT ON COLUMN TBL_CART.USER_ID IS '유저 아이디';
COMMENT ON COLUMN TBL_CART.PRODUCT_COUNT IS '구매 수량';
COMMENT ON COLUMN TBL_CART.REG_DATE IS '등록일';

-- 장바구니 번호 시퀀스
CREATE SEQUENCE SEQ_CART_NO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;

-- 회원정보 테이블
CREATE TABLE TBL_USER (
                            "USER_ID"	VARCHAR(50)		NOT NULL,
                            "USER_PWD"	VARCHAR(50)		NOT NULL,
                            "USER_NAME"	VARCHAR(20)		NOT NULL,
                            "USER_TEL"	VARCHAR(20)		NOT NULL,
                            "ADDRESS"	VARCHAR(50)		NOT NULL,
                            "USER_EMAIL"	VARCHAR(50)		NOT NULL,
                            "USER_ROLE"	CHAR(1)		,
                            "USER_ACTIVE"	CHAR(1)		,
                            "USER_ENTDATE"	DATE		NOT NULL,
                            "USER_POINT"	NUMBER		NOT NULL
);

-- 결제 테이블
CREATE TABLE TBL_PAYMENT (
    PAYMENT_NO NUMBER NOT NULL,
    USER_ID VARCHAR(50) NOT NULL,
    PAYMENT_METHOD VARCHAR(20) NOT NULL,
    PAYMENT_AMOUNT NUMBER NOT NULL
);
COMMENT ON COLUMN TBL_PAYMENT.PAYMENT_NO IS '결제 번호';
COMMENT ON COLUMN TBL_PAYMENT.USER_ID IS '유저 아이디';
COMMENT ON COLUMN TBL_PAYMENT.PAYMENT_METHOD IS '결제 방식';
COMMENT ON COLUMN TBL_PAYMENT.PAYMENT_AMOUNT IS '결제 금액';

-- 결제 번호 시퀀스
CREATE SEQUENCE SEQ_PAYMENT_NO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;

-- 블로그 게시판 테이블
CREATE TABLE "TBL_BLOG_BOARD" (
                                  "BLOG_NO"	NUMBER		NOT NULL,
                                  "USER_ID"	VARCHAR(50)		NOT NULL,
                                  "BLOG_TITLE"	VARCHAR2(200)		NOT NULL,
                                  "BLOG_CONTENT"	LONG		NOT NULL,
                                  "BLOG_POSTDATE"	DATE		NOT NULL,
                                  "BLOG_VIEWCOUNT"	NUMBER		NULL
);

-- 블로그 게시글 번호 시퀀스
CREATE SEQUENCE SEQ_BLOG_NO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;

-- 블로그 이미지 테이블
CREATE TABLE "TBL_BLOG_IMAGE" (
                                  "BLOG_IMG_NO"	NUMBER		NOT NULL,
                                  "ORIGIN_FILE"	VARCHAR(300)		NOT NULL,
                                  "STORED_FILE"	VARCHAR(300)		NOT NULL,
                                  "BLOG_THUMB"	VARCHAR(300)		NOT NULL,
                                  "BLOG_NO"	NUMBER		NOT NULL,
                                  "USER_ID"	VARCHAR(50)		NOT NULL
);

-- 블로그 이미지 번호 시퀀스
CREATE SEQUENCE SEQ_BLOG_IMG_NO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;

-- 상품 이미지 테이블
CREATE TABLE "TBL_PRODUCT_IMAGE" (
                                     "FILE_NO"	NUMBER		NOT NULL,
                                     "ORIGIN_NAME"	VARCHAR(300)		NOT NULL,
                                     "STORED_NAME"	VARCHAR(300)		NOT NULL,
                                     "THUMBNAIL"	CHAR(1)		NOT NULL,
                                     "PRODUCT_NO"	NUMBER		NOT NULL
);

-- 상품 이미지 번호 시퀀스
CREATE SEQUENCE SEQ_FILE_NO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 300
    NOCYCLE
    NOCACHE;

-- Q&A 게시글 번호 시퀀스
CREATE SEQUENCE SEQ_QNA_NO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
    
-- Q&A 게시판 테이블
CREATE TABLE "TBL_QUESTION" (
                                BOARD_NO	NUMBER	NOT NULL,
                                USER_ID	VARCHAR(50)	NOT NULL,
                                BOARD_TITLE	VARCHAR(100)	NOT NULL,
                                BOARD_CONTENT	VARCHAR(300)	NOT NULL,
                                CREATE_DATE	DATE	NULL,
                                COUNT	NUMBER	 DEFAULT 0,
                                STATUS CHAR(2 BYTE) DEFAULT 'Y'
);

-- 댓글 번호 시퀀스
CREATE SEQUENCE SEQ_REP_NO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;

-- 댓글 질문 댓글 테이블 
CREATE TABLE TBL_QUESTION_REPLY (
                                    REPLY_NO	NUMBER	NOT NULL,
                                    BOARD_NO	NUMBER	NOT NULL,
                                    USER_ID	VARCHAR(50)	NOT NULL,
                                    REPLY_CONTENT	VARCHAR(300)	NOT NULL,
                                    REPLY_CREATE_DATE	DATE	NOT NULL,
                                    REPLY_MODDATE	DATE	NOT NULL
);

-- 주문 번호 시퀀스
CREATE SEQUENCE SEQ_ORDER_NO
    START WITH 1
    MAXVALUE 999
    MINVALUE 1
    CYCLE
    CACHE 10
    NOORDER
;

--/* 시퀀스 초기화 Procedure */
--CREATE OR REPLACE PROCEDURE SZP_ORDER_NO_RESET(SEQ_ORDER_NO IN VARCHAR2)
--    IS
--    L_VAL NUMBER;
--BEGIN
--EXECUTE IMMEDIATE 'SELECT '|| SEQ_ORDER_NO ||'.NEXTVAL FROM DUAL' INTO L_VAL;
--EXECUTE IMMEDIATE 'ALTER SEQUENCE '|| SEQ_ORDER_NO ||' INCREMENT BY -'|| L_VAL ||' MINVALUE 0';
--EXECUTE IMMEDIATE 'SELECT '|| SEQ_ORDER_NO ||'.NEXTVAL FROM DUAL' INTO L_VAL;
--EXECUTE IMMEDIATE 'ALTER SEQUENCE '|| SEQ_ORDER_NO ||' INCREMENT BY 1 MINVALUE 0';
--END;

--프로시저를 오라클 job에 등록 
--DECLARE
--X NUMBER;
--BEGIN
--    SYS.DBMS_JOB.SUBMIT
--(
--            job => X
--        , what =>
--                'BEGIN
--                        SZP_ORDER_NO_RESET(''SEQ_ORDER_NO'');
--                 END;'
--        , next_date => to_date('12-27-2022 00:00:00', 'mm/dd/yyyy hh24:mi:ss')
--        , interval => 'TRUNC(SYSDATE+1)'
--        , no_parse => FALSE
--        );
--    SYS.DBMS_OUTPUT.PUT_LINE('Job Number is : '|| to_char(X));
--END;

-- 날짜를 포함한 시퀀스 값을 가져오는 함수
--CREATE OR REPLACE FUNCTION ZBF_GET_ORDER_NO(
--    p_type in varchar2
--) RETURN VARCHAR2
--AS
--    v_returnValue VARCHAR2(180);
--BEGIN
--BEGIN
--select TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(SEQ_ORDER_NO.nextval, 3, 0)
--into v_returnValue
--from dual;

--EXCEPTION
--        WHEN NO_DATA_FOUND THEN
--            v_returnValue := ' ';
--WHEN OTHERS THEN
--            v_returnValue := ' ';
--END;
--
--RETURN v_returnValue;
--END;

---- 체크
-- select ZBF_GET_ORDER_NO('now') from DUAL;

--주문 테이블
CREATE TABLE TBL_ORDER (
    ORDER_NO NUMBER NOT NULL,
    PAYMENT_NO NUMBER NOT NULL,
    ORDER_DATE DATE NOT NULL,
    RECEIVER_NAME VARCHAR(20) NOT NULL,
    RECEIVER_TEL VARCHAR(20) NOT NULL,
    ADDRESS_ZIPCODE VARCHAR(10) NOT NULL,
    ADDRESS	VARCHAR(100) NOT NULL,
    ADDRESS_DETAIL	VARCHAR(100) NOT NULL,
    SHIPPING_STATUS	VARCHAR(20) NOT NULL
);
COMMENT ON COLUMN TBL_ORDER.ORDER_NO IS '주문 번호';
COMMENT ON COLUMN TBL_ORDER.PAYMENT_NO IS '결제 번호';
COMMENT ON COLUMN TBL_ORDER.ORDER_DATE IS '주문 날짜';
COMMENT ON COLUMN TBL_ORDER.RECEIVER_NAME IS '수령인 이름';
COMMENT ON COLUMN TBL_ORDER.RECEIVER_TEL IS '수령인 연락처';
COMMENT ON COLUMN TBL_ORDER.ADDRESS_ZIPCODE IS '우편 번호';
COMMENT ON COLUMN TBL_ORDER.ADDRESS IS '주소';
COMMENT ON COLUMN TBL_ORDER.ADDRESS_DETAIL IS '상세 주소';
COMMENT ON COLUMN TBL_ORDER.SHIPPING_STATUS IS '배송 상태';

-- 문의 테이블 
CREATE TABLE TBL_CONTACT (
                               "NAME"	VARCHAR(10)		NOT NULL,
                               "EMAIL"	VARCHAR(50)		NOT NULL,
                               "SUBJECT"	VARCHAR(50)		NOT NULL,
                               "CONTENT"	VARCHAR(500)		NOT NULL
);

-- 블로그 댓글 테이블 
CREATE TABLE "TBL_BLOG_COMMENT" (
                                    COMMENT_NO	NUMBER		NOT NULL,
                                    COMMENT_CONTENT	VARCHAR(200)		NOT NULL,
                                    COMMENT_POSTDATE	DATE		NOT NULL,
                                    BLOG_NO	NUMBER		NOT NULL,
                                    USER_ID	VARCHAR(50)		NOT NULL
);

-- 블로그 코멘트 번호 시퀀스
CREATE SEQUENCE SEQ_COMMENT_NO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;

-- 제약 조건
ALTER TABLE TBL_PRODUCT ADD CONSTRAINT PK_PRODUCT_NO PRIMARY KEY (PRODUCT_NO);
ALTER TABLE TBL_PRODUCT ADD CONSTRAINT FK_CATEGORY_CODE FOREIGN KEY (CATEGORY_CODE) REFERENCES "TBL_CATEGORY"(CATEGORY_CODE);

ALTER TABLE TBL_CATEGORY ADD CONSTRAINT PK_CATEGORY_CODE PRIMARY KEY (CATEGORY_CODE);

ALTER TABLE TBL_CART ADD CONSTRAINT PK_CART_NO PRIMARY KEY (CART_NO);
ALTER TABLE TBL_CART ADD CONSTRAINT FK_PRODUCT_NO FOREIGN KEY (PRODUCT_NO) REFERENCES "TBL_PRODUCT"(PRODUCT_NO);
ALTER TABLE TBL_CART ADD CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES "TBL_USER"(USER_ID);

ALTER TABLE TBL_PAYMENT ADD CONSTRAINT PK_PAYMENT_NO PRIMARY KEY (PAYMENT_NO);
ALTER TABLE TBL_PAYMENT ADD CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES "TBL_USER"(USER_ID);

ALTER TABLE TBL_USER ADD CONSTRAINT PK_USER_ID PRIMARY KEY (USER_ID);
ALTER TABLE TBL_USER ADD CONSTRAINT CK_USER_ROLE CHECK(USER_ROLE IN('Y', 'N'));
ALTER TABLE TBL_USER ADD CONSTRAINT CK_USER_ACTIVE CHECK(USER_ACTIVE IN('Y', 'N'));

ALTER TABLE TBL_BLOG_BOARD ADD CONSTRAINT PK_BLOG_NO PRIMARY KEY (BLOG_NO);
ALTER TABLE TBL_BLOG_BOARD ADD CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES "TBL_USER"(USER_ID);

ALTER TABLE TBL_BLOG_IMAGE ADD CONSTRAINT PK_BLOG_IMG_NO PRIMARY KEY (BLOG_IMG_NO);
ALTER TABLE TBL_BLOG_IMAGE ADD CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES "TBL_USER"(USER_ID);
ALTER TABLE TBL_BLOG_IMAGE ADD CONSTRAINT FK_BLOG_NO FOREIGN KEY (BLOG_NO) REFERENCES "TBL_BLOG_BOARD"(BLOG_NO);

ALTER TABLE TBL_PRODUCT_IMAGE ADD CONSTRAINT PK_FILE_NO PRIMARY KEY (FILE_NO);
ALTER TABLE TBL_PRODUCT_IMAGE ADD CONSTRAINT FK_PRODUCT_NO FOREIGN KEY (PRODUCT_NO) REFERENCES "TBL_PRODUCT"(PRODUCT_NO);

ALTER TABLE TBL_QUESTION ADD CONSTRAINT PK_QNA_NO PRIMARY KEY (BOARD_NO);
ALTER TABLE TBL_QUESTION ADD CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES "TBL_USER"(USER_ID);

ALTER TABLE TBL_ORDER ADD CONSTRAINT PK_ORDER_NO PRIMARY KEY (ORDER_NO);
ALTER TABLE TBL_ORDER ADD CONSTRAINT FK_PAYMENT_NO FOREIGN KEY (PAYMENT_NO) REFERENCES "TBL_PAYMENT"(PAYMENT_NO);

ALTER TABLE TBL_CONTACT ADD CONSTRAINT PK_NAME PRIMARY KEY ("NAME");

ALTER TABLE TBL_BLOG_COMMENT ADD CONSTRAINT PK_COMMENT_NO PRIMARY KEY (COMMENT_NO);
ALTER TABLE TBL_BLOG_COMMENT ADD CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES "TBL_USER"(USER_ID);
ALTER TABLE TBL_BLOG_COMMENT ADD CONSTRAINT FK_BLOG_NO FOREIGN KEY (BLOG_NO) REFERENCES "TBL_BLOG_BOARD"(BLOG_NO);

ALTER TABLE TBL_QUESTION_REPLY ADD CONSTRAINT PK_REPLY_NO PRIMARY KEY (REPLY_NO);
ALTER TABLE TBL_QUESTION_REPLY ADD CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES "TBL_USER"(USER_ID);
ALTER TABLE TBL_QUESTION_REPLY ADD CONSTRAINT FK_QNA_NO FOREIGN KEY (BOARD_NO) REFERENCES "TBL_QUESTION"(BOARD_NO);

INSERT INTO TBL_USER
VALUES('admin', 'admin', '관리자', '010-3456-9890', '서울시 가산동', 'admin@gmail.com', 'Y', 'Y', SYSDATE, 0);

INSERT INTO TBL_USER
VALUES('user01', 'pass01', '홍길동', '010-3456-9891', '서울시 금산구', 'hong@gmail.com', 'Y', 'Y', SYSDATE, 1000);

INSERT INTO TBL_USER
VALUES('user02', 'pass02', '유재석', '010-3456-9881', '서울시 구로구', 'yu@gmail.com', 'Y', 'Y', SYSDATE, 1000);

INSERT INTO TBL_CATEGORY
VALUES('C1','Vn');

INSERT INTO TBL_CATEGORY
VALUES('C2','Va');

INSERT INTO TBL_CATEGORY
VALUES('C3','Cl');

INSERT INTO TBL_PRODUCT
VALUES(1, 'Gadda', 60000, 'Italy', 1, 'C1');

INSERT INTO TBL_PRODUCT
VALUES(99, 'test', 10000, 'Italy', 3, 'C3');

INSERT INTO TBL_CART
VALUES(SEQ_CART_NO.NEXTVAL, 1, 'user01', 1, SYSDATE);

INSERT INTO TBL_CART
VALUES(SEQ_CART_NO.NEXTVAL, 99, 'user01', 3, SYSDATE);
COMMIT ;

-- 다중 쿼리 예시
--BEGIN
--INSERT INTO TBL_PRODUCT
--VALUES(100, 'Gadda', 60000, 'Italy', 1, 'C1');
--INSERT INTO TBL_PRODUCT
--VALUES(101, 'Gadda', 60000, 'Italy', 1, 'C1');
--END;

-- 별칭
-- 예시
-- COMMENT ON COLUMN STUDENT_DEL.STUDENT_NO IS '학생번호';

--시퀀스
-- CREATE SEQUENCE SEQ_STUDENT_NO
--     START WITH 20220001
--     INCREMENT BY 1
--     MAXVALUE 20229999
--     NOCYCLE
--     NOCACHE;

-- 뷰 테이블
-- CREATE OR REPLACE VIEW VIEW_GRADE_CHECK
-- AS
-- SELECT
--     D.LECTURE_NAME LECTURE_NAME,
--     B.PROF_NAME PROF_NAME,
--     A.STUDENT_NO STUDENT_NO,
--     C.STUDENT_NAME STUDENT_NAME,
--     A.ATT_SCORE ATT_SCORE,
--     A.ASS_SCORE ASS_SCORE,
--     A.MID_SCORE MID_SCORE,
--     A.FIN_SCORE FIN_SCORE,
--     A.GRADE GRADE
-- FROM GRADE A
--          JOIN PROFESSOR B
--               ON A.PROF_NO = B.PROF_NO
--          JOIN STUDENT C
--               ON A.STUDENT_NO = C.STUDENT_NO
--          JOIN LECTURE D
--               ON A.LECTURE_NO = D.LECTURE_NO;

-- 트리거
-- CREATE OR REPLACE TRIGGER TRG_ENROLL
--     AFTER INSERT ON ENROLLMENT
--     FOR EACH ROW
-- BEGIN
-- UPDATE LECTURE
-- SET CURR_NO = CURR_NO + 1
-- WHERE LECTURE_NO = :NEW.LECTURE_NO;
-- END;
-- /

-- 출력 실험 
