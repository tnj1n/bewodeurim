/* 배달기사 후기 테이블 */
DROP TABLE TBL_DRIVER_REVIEW;
CREATE TABLE TBL_DRIVER_REVIEW (
    ID NUMBER CONSTRAINT PK_DRIVER_REVIEW PRIMARY KEY,  /* 후기 테이블의 기본 키 */
    DRIVER_ID NUMBER NOT NULL,  /* 배달기사 테이블과 연결되는 외래 키 */
    MEMBER_ID NUMBER NOT NULL,  /* 후기를 작성한 회원 ID */
    REVIEW_CONTENT VARCHAR2(1000) NOT NULL,  /* 후기 내용 (대용량 텍스트) */
    REVIEW_RATING NUMBER(2, 1) NOT NULL,  /* 별점 (예: 4.5, 5.0) */
    CREATED_DATE DATE DEFAULT SYSDATE, /* 후기 작성 날짜 */
    UPDATED_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT FK_DRIVER_REVIEW FOREIGN KEY (DRIVER_ID)
        REFERENCES TBL_DRIVER(ID),  /* 배달기사 테이블의 ID를 참조 */
    CONSTRAINT FK_DRIVER_REVIEW_MEMBER FOREIGN KEY (MEMBER_ID)
        REFERENCES TBL_MEMBER(ID)  /* 회원 테이블의 ID를 참조 */
);

CREATE SEQUENCE SEQ_DRIVER_REVIEW;