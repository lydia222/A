DROP TABLE OC_MEMBER PURGE;
DROP SEQUENCE OC_MEMBER_SQ;

CREATE TABLE OC_MEMBER(
NO NUMBER PRIMARY KEY,
ID VARCHAR2(20) UNIQUE NOT NULL,
PW VARCHAR2(20) NOT NULL,
NAME VARCHAR2(20) NOT NULL,
GENDER VARCHAR2(2) NOT NULL,
FACE VARCHAR2(20) NOT NULL,
EMAIL VARCHAR2(30) UNIQUE NOT NULL,
TEL VARCHAR2(15) NOT NULL,
ADDRESS VARCHAR2(200) NOT NULL,
ENABLED VARCHAR2(2) NOT NULL,
CONSTRAINT CHK_ENABLED CHECK(ENABLED IN ('Y', 'N', 'A', 'B')),  --Y:이용중, N:탈퇴, A:ADMIN, B:BLOCK
CONSTRAINT CHK_GENDER CHECK(GENDER IN ('M', 'W'))
);

CREATE SEQUENCE OC_MEMBER_SQ;
SELECT * FROM OC_MEMBER;

DELETE FROM OC_MEMBER;

INSERT INTO OC_MEMBER VALUES(0, 'admin', 'admin1234', '지짐이', 'M', 'img/zze.png', 'zizime1234@gmail.com', '01012345678', '서울', 'A');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test1', 'test1', 'test1', 'M', 'img/img1.png', 'test1@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test2', 'test2', 'test2', 'M', 'img/img2.png', 'test2@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test3', 'test3', 'test3', 'M', 'img/img3.png', 'test3@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test4', 'test4', 'test4', 'M', 'img/img4.png', 'test4@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test5', 'test5', 'test5', 'M', 'img/img5.png', 'test5@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test6', 'test6', 'test6', 'M', 'img/img6.png', 'test6@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test7', 'test7', 'test7', 'M', 'img/img7.png', 'test7@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test8', 'test8', 'test8', 'M', 'img/img8.png', 'test8@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test9', 'test9', 'test9', 'M', 'img/img9.png', 'test9@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test10', 'test10', 'test10', 'M', 'img/img10.png', 'test10@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test11', 'test11', 'test11', 'M', 'img/img1.png', 'test11@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test12', 'test12', 'test12', 'M', 'img/img2.png', 'test12@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test13', 'test13', 'test13', 'M', 'img/img3.png', 'test13@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test14', 'test14', 'test14', 'M', 'img/img4.png', 'test14@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test15', 'test15', 'test15', 'M', 'img/img5.png', 'test15@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test16', 'test16', 'test16', 'M', 'img/img6.png', 'test16@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test17', 'test17', 'test17', 'M', 'img/img7.png', 'test17@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test18', 'test18', 'test18', 'M', 'img/img8.png', 'test18@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test19', 'test19', 'test19', 'M', 'img/img9.png', 'test19@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test20', 'test20', 'test20', 'M', 'img/img10.png', 'test20@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test21', 'test21', 'test21', 'M', 'img/img1.png', 'test21@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test22', 'test22', 'test22', 'M', 'img/img2.png', 'test22@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test23', 'test23', 'test23', 'M', 'img/img3.png', 'test23@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test24', 'test24', 'test24', 'M', 'img/img4.png', 'test24@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test25', 'test25', 'test25', 'M', 'img/img5.png', 'test25@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test26', 'test26', 'test26', 'M', 'img/img6.png', 'test26@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test27', 'test27', 'test27', 'M', 'img/img7.png', 'test27@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test28', 'test28', 'test28', 'M', 'img/img8.png', 'test28@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test29', 'test29', 'test29', 'M', 'img/img9.png', 'test29@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test30', 'test30', 'test30', 'M', 'img/img10.png', 'test30@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test31', 'test31', 'test31', 'M', 'img/img1.png', 'test31@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test32', 'test32', 'test32', 'M', 'img/img2.png', 'test32@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test33', 'test33', 'test33', 'M', 'img/img3.png', 'test33@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test34', 'test34', 'test34', 'M', 'img/img4.png', 'test34@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test35', 'test35', 'test35', 'M', 'img/img5.png', 'test35@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test36', 'test36', 'test36', 'M', 'img/img6.png', 'test36@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test37', 'test37', 'test37', 'M', 'img/img7.png', 'test37@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test38', 'test38', 'test38', 'M', 'img/img8.png', 'test38@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test39', 'test39', 'test39', 'M', 'img/img9.png', 'test39@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test40', 'test40', 'test40', 'M', 'img/img10.png', 'test40@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test41', 'test41', 'test41', 'M', 'img/img1.png', 'test41@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test42', 'test42', 'test42', 'M', 'img/img2.png', 'test42@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test43', 'test43', 'test43', 'M', 'img/img3.png', 'test43@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test44', 'test44', 'test44', 'M', 'img/img4.png', 'test44@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test45', 'test45', 'test45', 'M', 'img/img5.png', 'test45@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test46', 'test46', 'test46', 'M', 'img/img6.png', 'test46@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test47', 'test47', 'test47', 'M', 'img/img7.png', 'test47@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test48', 'test48', 'test48', 'M', 'img/img8.png', 'test48@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test49', 'test49', 'test49', 'M', 'img/img9.png', 'test49@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test50', 'test50', 'test50', 'M', 'img/img10.png', 'tes3t50@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test51', 'test51', 'test51', 'M', 'img/img1.png', 'test51@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test52', 'test52', 'test52', 'M', 'img/img2.png', 'test52@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test53', 'test53', 'test53', 'M', 'img/img3.png', 'test53@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test54', 'test54', 'test54', 'M', 'img/img4.png', 'test54@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test55', 'test55', 'test55', 'M', 'img/img5.png', 'test55@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test56', 'test56', 'test56', 'M', 'img/img6.png', 'test56@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test57', 'test57', 'test57', 'M', 'img/img7.png', 'test57@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test58', 'test58', 'test58', 'M', 'img/img8.png', 'test58@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test59', 'test59', 'test59', 'M', 'img/img9.png', 'test59@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test60', 'test60', 'test60', 'M', 'img/img10.png', 'test60@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test61', 'test61', 'test61', 'M', 'img/img1.png', 'test61@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test62', 'test62', 'test62', 'M', 'img/img2.png', 'test62@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test63', 'test63', 'test63', 'M', 'img/img3.png', 'test63@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test64', 'test64', 'test64', 'M', 'img/img4.png', 'test64@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test65', 'test65', 'test65', 'M', 'img/img5.png', 'test65@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test66', 'test66', 'test66', 'M', 'img/img6.png', 'test66@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test67', 'test67', 'test67', 'M', 'img/img7.png', 'test67@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test68', 'test68', 'test68', 'M', 'img/img8.png', 'test68@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test69', 'test69', 'test69', 'M', 'img/img9.png', 'test69@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test70', 'test70', 'test70', 'M', 'img/img10.png', 'test70@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test71', 'test71', 'test71', 'M', 'img/img1.png', 'test71@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test72', 'test72', 'test72', 'M', 'img/img2.png', 'test72@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test73', 'test73', 'test73', 'M', 'img/img3.png', 'test73@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test74', 'test74', 'test74', 'M', 'img/img4.png', 'test74@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test75', 'test75', 'test75', 'M', 'img/img5.png', 'test75@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test76', 'test76', 'test76', 'M', 'img/img6.png', 'test76@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test77', 'test77', 'test77', 'M', 'img/img7.png', 'test77@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test78', 'test78', 'test78', 'M', 'img/img8.png', 'test78@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test79', 'test79', 'test79', 'M', 'img/img9.png', 'test79@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test80', 'test80', 'test80', 'M', 'img/img10.png', 'test80@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test81', 'test81', 'test81', 'M', 'img/img1.png', 'test81@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test82', 'test82', 'test82', 'M', 'img/img2.png', 'test82@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test83', 'test83', 'test83', 'M', 'img/img3.png', 'test83@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test84', 'test84', 'test84', 'M', 'img/img4.png', 'test84@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test85', 'test85', 'test85', 'M', 'img/img5.png', 'test85@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test86', 'test86', 'test86', 'M', 'img/img6.png', 'test86@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test87', 'test87', 'test87', 'M', 'img/img7.png', 'test87@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test88', 'test88', 'test88', 'M', 'img/img8.png', 'test88@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test89', 'test89', 'test89', 'M', 'img/img9.png', 'test89@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test90', 'test90', 'test90', 'M', 'img/img10.png', 'test90@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test91', 'test91', 'test91', 'M', 'img/img1.png', 'test91@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test92', 'test92', 'test92', 'M', 'img/img2.png', 'test92@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test93', 'test93', 'test93', 'M', 'img/img3.png', 'test93@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test94', 'test94', 'test94', 'M', 'img/img4.png', 'test94@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test95', 'test95', 'test95', 'M', 'img/img5.png', 'test95@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test96', 'test96', 'test96', 'M', 'img/img6.png', 'test96@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test97', 'test97', 'test97', 'M', 'img/img7.png', 'test97@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test98', 'test98', 'test98', 'M', 'img/img8.png', 'test98@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test99', 'test99', 'test99', 'M', 'img/img9.png', 'test99@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test100', 'test100', 'test100', 'M', 'img/img10.png', 'test100@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test101', 'test101', 'test101', 'M', 'img/img1.png', 'test101@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test102', 'test102', 'test102', 'M', 'img/img2.png', 'test102@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test103', 'test103', 'test103', 'M', 'img/img3.png', 'test103@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test104', 'test104', 'test104', 'M', 'img/img4.png', 'test104@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test105', 'test105', 'test105', 'M', 'img/img5.png', 'test105@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test106', 'test106', 'test106', 'M', 'img/img6.png', 'test106@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test107', 'test107', 'test107', 'M', 'img/img7.png', 'test107@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test108', 'test108', 'test108', 'M', 'img/img8.png', 'test108@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test109', 'test109', 'test109', 'M', 'img/img9.png', 'test109@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test110', 'test110', 'test110', 'M', 'img/img10.png', 'test110@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test111', 'test111', 'test111', 'M', 'img/img10.png', 'test111@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test112', 'test112', 'test112', 'M', 'img/img2.png', 'test112@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test113', 'test113', 'test113', 'M', 'img/img3.png', 'test113@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test114', 'test114', 'test114', 'M', 'img/img4.png', 'test114@gmail.com', '01011111111', '서울', 'Y');
INSERT INTO OC_MEMBER VALUES(OC_MEMBER_SQ.NEXTVAL, 'test115', 'test115', 'test115', 'M', 'img/img5.png', 'test115@gmail.com', '01011111111', '서울', 'Y');


UPDATE OC_MEMBER SET ENABLED = 'N' WHERE NO=115;
UPDATE OC_MEMBER SET ENABLED = 'N' WHERE NO=113;
UPDATE OC_MEMBER SET ENABLED = 'N' WHERE NO=111;
UPDATE OC_MEMBER SET ENABLED = 'N' WHERE NO=109;

INSERT INTO OC_MEMBER VALUES(10000, 'ivvve', 'sonyc', '손영철', 'M', 'img/img12.png', 'ivvve@naver.com', '01011111111', '인천', 'Y');
delete from oc_member where no=10000;
SELECT NO, ID, PW, NAME, GENDER, FACE, EMAIL, TEL, ADDRESS, ENABLED
FROM
	(SELECT ROWNUM AS RN, M.*
	FROM (SELECT * FROM OC_MEMBER WHERE ENABLED!='A' ORDER BY NO DESC) M
	WHERE ROWNUM<=20) 
WHERE 11<=RN

SELECT *
FROM 
	(SELECT ROWNUM AS RN, M.*
	FROM (SELECT * FROM OC_MEMBER WHERE ENABLED!='A' ORDER BY NO DESC) M
	WHERE ROWNUM <= 20)
WHERE 11 <= RN


SELECT *
		FROM 
			(SELECT ROWNUM AS RN, M.*
			FROM (SELECT * FROM OC_MEMBER WHERE ENABLED!='A' AND ID LIKE '%'||'test'||'%' ORDER BY NO DESC) M
			WHERE ROWNUM <= 2*10)
		WHERE 2*10-9 <= RN