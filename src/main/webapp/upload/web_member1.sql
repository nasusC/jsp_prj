-- DDL for table web_member
DROP TABLE web_member;

CREATE TABLE web_member(
id varchar2(20),
pass varchar2(100) NOT NULL,
name varchar2(60) NOT NULL,
birth char(10) NOT null,
tel varchar2(13),
tel_flag char(1),
email varchar2(100),
gender char(1),
location char(6),
zipcode char(5),
addr varchar2(100),
addr2 varchar2(100),
input_date DATE DEFAULT sysdate,
ip varchar2(100),
CONSTRAINT pk_webmember PRIMARY key(id)
);

-- 가데이터 추가 (2개~3개)
INSERT INTO web_member(id,pass,name,BIRTH,tel,TEL_FLAG,email,gender,LOCATION,ZIPCODE,addr,addr2)
VALUES ('kim','1234','김현우','1999-01-01','010-1234-5678','Y','kim@naver.com','M','서울','12345','서울시 강남구 역삼동','8층');

INSERT INTO web_member(id,pass,name,BIRTH,tel,TEL_FLAG,email,gender,LOCATION,ZIPCODE,addr,addr2)
VALUES ('kim2','1234','김현우2','1999-01-11','010-1234-5678','Y','kim2@naver.com','M','서울','12345','서울시 강남구 역삼동','8층');

COMMIT;

-- DDL for table web_member_hobby
DROP TABLE WEB_MEMBER_lang;

CREATE TABLE WEB_MEMBER_lang(
id varchar2(20),
lang varchar2(10)
);

INSERT INTO WEB_MEMBER_lang values('kim','Java');
INSERT INTO WEB_MEMBER_lang values('kim','PyThon');
INSERT INTO WEB_MEMBER_lang values('kim','JSP');

COMMIT;

SELECT * FROM WEB_MEMBER wm ;