-- CREATE USER SEMI IDENTIFIED BY SEMI;
-- GRANT CONNECT, RESOURCE TO SEMI;
-- GRANT CREATE VIEW TO SEMI;
-- GRANT CREATE SEQUENCE TO SEMI;
-- GRANT CREATE TRIGGER TO SEMI;

-- 상품 테이블
DROP TABLE TBL_ORDER CASCADE CONSTRAINTS;
DROP TABLE TBL_PAYMENT CASCADE CONSTRAINTS;
DROP TABLE TBL_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE TBL_PRODUCT_IMAGE CASCADE CONSTRAINTS;
DROP TABLE TBL_CART CASCADE CONSTRAINTS;
DROP TABLE TBL_BLOG_COMMENT CASCADE CONSTRAINTS;
DROP TABLE TBL_BLOG_BOARD CASCADE CONSTRAINTS;
DROP TABLE TBL_QUESTION_REPLY CASCADE CONSTRAINTS;
DROP TABLE TBL_QUESTION CASCADE CONSTRAINTS;
DROP TABLE TBL_USER CASCADE CONSTRAINTS;
DROP TABLE TBL_CONTACT CASCADE CONSTRAINTS;
DROP TABLE TBL_PRODUCT CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_USER_NO;
-- DROP SEQUENCE SEQ_ORDER_NO;
DROP SEQUENCE SEQ_PAYMENT_NO;
DROP SEQUENCE SEQ_FILE_NO;
DROP SEQUENCE SEQ_PRODUCT_NO;
DROP SEQUENCE SEQ_CART_NO;
DROP SEQUENCE SEQ_BLOG_NO;
DROP SEQUENCE SEQ_QNA_NO;
DROP SEQUENCE SEQ_REP_NO;
DROP SEQUENCE SEQ_COMMENT_NO;
DROP SEQUENCE SEQ_CONTACT_NO;
-- 상품 테이블
CREATE TABLE TBL_PRODUCT (
    "PRODUCT_NO"	NUMBER		NOT NULL,
    "PRODUCT_NAME"	VARCHAR2(50)		NOT NULL,
    "PRODUCT_PRICE"	NUMBER		NOT NULL,
    "PRODUCT_DESC"	VARCHAR2(4000)		NOT NULL,
    "PRODUCT_QTY"	NUMBER		NOT NULL,
    "CATEGORY_CODE"	VARCHAR(30)		NOT NULL
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

                              CATEGORY_CODE	VARCHAR(30)		NOT NULL,
                              CATEGORY_NAME	VARCHAR(50)		NOT NULL,
                            CATEGORY VARCHAR(10) NOT NULL

);
-- 장바구니 테이블
CREATE TABLE TBL_CART (
    CART_NO NUMBER NOT NULL,
    PRODUCT_NO NUMBER NOT NULL,
    USER_ID	VARCHAR(50) NOT NULL,
    PRODUCT_COUNT NUMBER NOT NULL,
    REG_DATE DATE NOT NULL,
    CHECK_STATUS CHAR(1) DEFAULT 'Y',
    PURCHASE_STATUS CHAR(1) DEFAULT 'N'
);
COMMENT ON COLUMN TBL_CART.CART_NO IS '장바구니 번호';
COMMENT ON COLUMN TBL_CART.PRODUCT_NO IS '상품 번호';
COMMENT ON COLUMN TBL_CART.USER_ID IS '유저 아이디';
COMMENT ON COLUMN TBL_CART.PRODUCT_COUNT IS '구매 수량';
COMMENT ON COLUMN TBL_CART.REG_DATE IS '등록일';
COMMENT ON COLUMN TBL_CART.CHECK_STATUS IS '체크 상태';
COMMENT ON COLUMN TBL_CART.PURCHASE_STATUS IS '구매 상태';
-- 장바구니 번호 시퀀스
CREATE SEQUENCE SEQ_CART_NO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
-- 회원정보 테이블
CREATE TABLE TBL_USER (
    "USER_NO"   NUMBER          NOT NULL,
    "USER_ID"	VARCHAR(50)		NOT NULL,
    "USER_PWD"	VARCHAR(50)		NOT NULL,
    "USER_NAME"	VARCHAR(20)		NOT NULL,
    "USER_TEL"	VARCHAR(20)		NOT NULL,
    "ADDRESS"	VARCHAR(200)		NOT NULL,
    "USER_EMAIL"	VARCHAR(50)		NOT NULL,
    "USER_ROLE"	VARCHAR(10) 	,
    "USER_ACTIVE"	CHAR(1)		,
    "USER_ENTDATE"	DATE		NOT NULL,
    "USER_POINT"	NUMBER		NOT NULL
);

CREATE SEQUENCE SEQ_USER_NO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
-- 결제 테이블
CREATE TABLE TBL_PAYMENT (
    PAYMENT_NO NUMBER NOT NULL,
    USER_ID VARCHAR(50) NOT NULL,
    USED_POINT NUMBER NOT NULL,
    PAYMENT_AMOUNT NUMBER NOT NULL,
    PAYMENT_METHOD VARCHAR(20) NOT NULL,
    RECEIVER_NAME VARCHAR2(20) NOT NULL,
    RECEIVER_TEL VARCHAR2(20) NOT NULL,
    ADDRESS VARCHAR2(200) NOT NULL,
    PAYMENT_DATE DATE NOT NULL,
    SHIPPING_STATUS VARCHAR2(30) NOT NULL,
    DELIVERY_REQUIRES VARCHAR2(1000)
);
COMMENT ON COLUMN TBL_PAYMENT.PAYMENT_NO IS '결제 번호';
COMMENT ON COLUMN TBL_PAYMENT.USER_ID IS '유저 아이디';
COMMENT ON COLUMN TBL_PAYMENT.USED_POINT IS '사용 포인트';
COMMENT ON COLUMN TBL_PAYMENT.PAYMENT_AMOUNT IS '결제 금액';
COMMENT ON COLUMN TBL_PAYMENT.PAYMENT_METHOD IS '결제 방식';
COMMENT ON COLUMN TBL_PAYMENT.RECEIVER_NAME IS '수취인';
COMMENT ON COLUMN TBL_PAYMENT.RECEIVER_TEL IS '연락처';
COMMENT ON COLUMN TBL_PAYMENT.ADDRESS IS '배송지 주소';
COMMENT ON COLUMN TBL_PAYMENT.PAYMENT_DATE IS '주문 날짜';
COMMENT ON COLUMN TBL_PAYMENT.SHIPPING_STATUS IS '배송 상태';
COMMENT ON COLUMN TBL_PAYMENT.DELIVERY_REQUIRES IS '배송 요청사항';
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
    "BLOG_CONTENT"	VARCHAR2(3000)	NOT NULL,
    "BLOG_POSTDATE"	DATE		NOT NULL,
    "BLOG_COUNT" NUMBER DEFAULT 0,
    "BLOG_STATUS" CHAR(2 BYTE) DEFAULT 'Y',
    "FILE_NAME" VARCHAR2(300) NOT NULL,
    "FILE_PATH" VARCHAR2(300) NOT NULL
);
-- 블로그 게시글 번호 시퀀스
CREATE SEQUENCE SEQ_BLOG_NO
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
    "THUMBNAIL"	CHAR(2)		NOT NULL,
    "PRODUCT_NO"	NUMBER		NOT NULL,
    IMG_PATH VARCHAR(200) NOT NULL
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
    REPLY_DATE	DATE	NOT NULL,
    REPLY_STATUS CHAR(2) DEFAULT 'Y',
    REPLY_COUNT NUMBER	 DEFAULT 0

);
--주문 테이블
CREATE TABLE TBL_ORDER (
    PAYMENT_NO NUMBER NOT NULL,
    CART_NO NUMBER NOT NULL
);
COMMENT ON COLUMN TBL_ORDER.PAYMENT_NO IS '결제 번호';
COMMENT ON COLUMN TBL_ORDER.CART_NO IS '장바구니 번호';
-- 문의 테이블
CREATE TABLE TBL_CONTACT (
    "CONTACT_NO" NUMBER   NOT NULL,
    "CONTACT_NAME"	VARCHAR(10)		NOT NULL,
    "CONTACT_EMAIL"	VARCHAR(50)		NOT NULL,
    "CONTACT_TITLE"	VARCHAR(50)		NOT NULL,
    "CONTACT_CONTENT"	VARCHAR(2000) NOT NULL
);

CREATE SEQUENCE SEQ_CONTACT_NO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
-- 블로그 댓글 테이블
CREATE TABLE "TBL_BLOG_COMMENT" (
    COMMENT_NO	NUMBER		NOT NULL,
    COMMENT_CONTENT	VARCHAR(200)		NOT NULL,
    COMMENT_POSTDATE	DATE		NOT NULL,
    BLOG_NO	NUMBER		NOT NULL,
    USER_ID	VARCHAR(50)		NOT NULL,
    COMMENT_STATUS CHAR(2) DEFAULT 'Y'
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
ALTER TABLE TBL_CATEGORY ADD CONSTRAINT PK_CATEGORY_CODE PRIMARY KEY (CATEGORY_CODE);
ALTER TABLE TBL_CART ADD CONSTRAINT PK_CART_NO PRIMARY KEY (CART_NO);
ALTER TABLE TBL_PAYMENT ADD CONSTRAINT PK_PAYMENT_NO PRIMARY KEY (PAYMENT_NO);
ALTER TABLE TBL_USER ADD CONSTRAINT PK_USER_ID PRIMARY KEY (USER_ID);
ALTER TABLE TBL_BLOG_BOARD ADD CONSTRAINT PK_BLOG_NO PRIMARY KEY (BLOG_NO);
ALTER TABLE TBL_PRODUCT_IMAGE ADD CONSTRAINT PK_FILE_NO PRIMARY KEY (FILE_NO);
ALTER TABLE TBL_QUESTION ADD CONSTRAINT PK_QNA_NO PRIMARY KEY (BOARD_NO);
ALTER TABLE TBL_QUESTION_REPLY ADD CONSTRAINT PK_REPLY_NO PRIMARY KEY (REPLY_NO);
ALTER TABLE TBL_BLOG_COMMENT ADD CONSTRAINT PK_COMMENT_NO PRIMARY KEY (COMMENT_NO);

ALTER TABLE TBL_PRODUCT ADD CONSTRAINT FK_CATEGORY_CODE FOREIGN KEY (CATEGORY_CODE) REFERENCES "TBL_CATEGORY"(CATEGORY_CODE);

ALTER TABLE TBL_CART ADD CONSTRAINT FK_TBL_CART_PRODUCT_NO FOREIGN KEY (PRODUCT_NO) REFERENCES "TBL_PRODUCT"(PRODUCT_NO);
ALTER TABLE TBL_CART ADD CONSTRAINT FK_TBL_CART_USER_ID FOREIGN KEY (USER_ID) REFERENCES "TBL_USER"(USER_ID);
ALTER TABLE TBL_CART ADD CONSTRAINT CK_TBL_CART_CHECK_STATUS CHECK(CHECK_STATUS IN ('Y', 'N'));

ALTER TABLE TBL_ORDER ADD CONSTRAINT FK_TBL_ORDER_PAYMENT_NO FOREIGN KEY (PAYMENT_NO) REFERENCES TBL_PAYMENT(PAYMENT_NO);
ALTER TABLE TBL_ORDER ADD CONSTRAINT FK_TBL_ORDER_CART_NO FOREIGN KEY (CART_NO) REFERENCES TBL_CART(CART_NO);

ALTER TABLE TBL_PAYMENT ADD CONSTRAINT FK_TBL_PAYMENT_USER_ID FOREIGN KEY (USER_ID) REFERENCES TBL_USER(USER_ID);

ALTER TABLE TBL_USER ADD CONSTRAINT CK_USER_ROLE CHECK(USER_ROLE IN('USER', 'ADMIN'));
ALTER TABLE TBL_USER ADD CONSTRAINT CK_USER_ACTIVE CHECK(USER_ACTIVE IN('Y', 'N'));

ALTER TABLE TBL_BLOG_BOARD ADD CONSTRAINT FK_USER_ID_3 FOREIGN KEY (USER_ID) REFERENCES "TBL_USER"(USER_ID);

ALTER TABLE TBL_PRODUCT_IMAGE ADD CONSTRAINT FK_PRODUCT_NO_2 FOREIGN KEY (PRODUCT_NO) REFERENCES "TBL_PRODUCT"(PRODUCT_NO) ON DELETE CASCADE;

ALTER TABLE TBL_QUESTION ADD CONSTRAINT FK_USER_ID_5 FOREIGN KEY (USER_ID) REFERENCES "TBL_USER"(USER_ID);

ALTER TABLE TBL_BLOG_COMMENT ADD CONSTRAINT FK_USER_ID_6 FOREIGN KEY (USER_ID) REFERENCES "TBL_USER"(USER_ID);
ALTER TABLE TBL_BLOG_COMMENT ADD CONSTRAINT FK_BLOG_NO_2 FOREIGN KEY (BLOG_NO) REFERENCES "TBL_BLOG_BOARD"(BLOG_NO);

ALTER TABLE TBL_QUESTION_REPLY ADD CONSTRAINT FK_USER_ID_7 FOREIGN KEY (USER_ID) REFERENCES "TBL_USER"(USER_ID);
ALTER TABLE TBL_QUESTION_REPLY ADD CONSTRAINT FK_QNA_NO FOREIGN KEY (BOARD_NO) REFERENCES "TBL_QUESTION"(BOARD_NO);

-- 데이터
INSERT INTO TBL_USER
VALUES(SEQ_USER_NO.NEXTVAL,'admin', 'admin', '관리자', '010-3456-9890', '서울시 가산동 가산로 101동 308호', 'admin@gmail.com', 'ADMIN', 'Y', SYSDATE, 0);

INSERT INTO TBL_USER
VALUES(SEQ_USER_NO.NEXTVAL, 'user01', 'pass01', '홍길동', '010-3456-9891', '서울시 금산구', 'hong@gmail.com', 'USER', 'Y', SYSDATE, 1000);

INSERT INTO TBL_USER
VALUES(SEQ_USER_NO.NEXTVAL, 'user02', 'pass02', '유재석', '010-3456-9881', '서울시 구로구', 'yu@gmail.com', 'USER', 'Y', SYSDATE, 1000);

INSERT INTO TBL_CATEGORY
VALUES('C1','Vn','STRING');

INSERT INTO TBL_CATEGORY
VALUES('C2','Va','STRING');

INSERT INTO TBL_CATEGORY
VALUES('C3','Vc','STRING');

INSERT INTO TBL_CATEGORY
VALUES('C4','Cb','STRING');

INSERT INTO TBL_CATEGORY
VALUES('C5','Gtr','STRING');

INSERT INTO TBL_CATEGORY
VALUES('C6','Har','STRING');

INSERT INTO TBL_CATEGORY
VALUES('C7','Fl','WIND');

INSERT INTO TBL_CATEGORY
VALUES('C8','Tp','WIND');

INSERT INTO TBL_CATEGORY
VALUES('C9','Hn','WIND');

INSERT INTO TBL_CATEGORY
VALUES('C10','Pf','CLAVIER');



INSERT INTO TBL_PRODUCT
VALUES(99, 'Gadda', 60000, 'Italy', 20, 'C1');

INSERT INTO TBL_PRODUCT
VALUES(100, 'test', 10000, 'Italy', 5, 'C3');

-- 카트 실험용
INSERT INTO TBL_CART
VALUES(SEQ_CART_NO.NEXTVAL, 99, 'user01', 1, SYSDATE, 'Y', 'N');

INSERT INTO TBL_CART
VALUES(SEQ_CART_NO.NEXTVAL, 100, 'user01', 5, SYSDATE, 'Y', 'N');
COMMIT ;

-- 다중 쿼리 예시
--BEGIN
--INSERT INTO TBL_PRODUCT
--VALUES(100, 'Gadda', 60000, 'Italy', 1, 'C1');
--INSERT INTO TBL_PRODUCT
--VALUES(101, 'Gadda', 60000, 'Italy', 1, 'C1');
--END;

-- 별칭 예시
-- COMMENT ON COLUMN STUDENT_DEL.STUDENT_NO IS '학생번호';

--시퀀스 예시
-- CREATE SEQUENCE SEQ_STUDENT_NO
--     START WITH 20220001
--     INCREMENT BY 1
--     MAXVALUE 20229999
--     NOCYCLE
--     NOCACHE;

-- 뷰 테이블 예시
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

/*포인트 적립, 사용 트리거*/
CREATE OR REPLACE TRIGGER TRG_POINT
    AFTER INSERT ON TBL_PAYMENT
    FOR EACH ROW
BEGIN
    UPDATE TBL_USER A
    SET A.USER_POINT = A.USER_POINT - :NEW.USED_POINT + ROUND(:NEW.PAYMENT_AMOUNT * 0.01)
    WHERE USER_ID = :NEW.USER_ID;
END;
/