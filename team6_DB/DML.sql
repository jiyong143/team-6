use webcafe;

insert into `memberstate` values
('이용중'),
('기간정지'),
('탈퇴');

insert into `member` values
('admin',111111,'email@naver.com','01011111111','admin','서울특별시 동대문구 전농동','관리자','이용중','관리자'),
('asd123',222222,'email@gmail.com','01022222222','asd123','서울특별시 강남구 역삼동','고양이','이용중','회원'),
('asd124',333333,'email1@gmail.com','01033333333','asd124','서울특별시 강남구 역삼동','강아지','기간정지','회원'),
('asd125',444444,'email2@gmail.com','01044444444','asd125','서울특별시 강남구 역삼동','초롱이','탈퇴','회원');

insert into `category` values
(1,'카테고리1'),
(2,'카테고리2'),
(3,'카테고리3');

insert into `board` values
(1,'공지게시판1',1),
(2,'자유게시판1',1),
(3,'공지게시판2',2),
(4,'자유게시판2',2),
(5,'공지게시판3',3),
(6,'자유게시판3',3);

insert into `post` values
(1,'제목','내용',now(),0,1,'admin'),
(2,'제목','내용',now(),0,2,'asd123'),
(3,'제목','내용',now(),0,3,'asd124'),
(4,'제목','내용',now(),0,4,'admin'),
(5,'제목','내용',now(),0,5,'asd125'),
(6,'제목','내용',now(),0,6,'asd123');


insert into`comment` values
(1,'댓글이다',1,'admin'),
(2,'댓글이다',2,'admin'),
(3,'댓글이다',3,'admin'),
(4,'댓글이다',4,'admin'),
(5,'댓글이다',5,'admin'),
(6,'댓글이다',6,'admin');

select * from `memberstate`;

select * from `member`;

select * from `category`;

select * from `board`;

select * from `post`;

select * from `comment`;  



