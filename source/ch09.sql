-- Active: 1758675041396@@127.0.0.1@3306@sub_query
/*
	9. 서브쿼리 활용하기
    9.1 서브쿼리란
*/
-- 왜 필요할까?
-- JOIN 만으로는 한 번에 답하기 어려운, 여러 단계의 질의를 거쳐야 하는 문제들도 있음
-- 예: 쇼핑몰에서 판매하는 상품들의 평균 가격보다 비싼 상품은?
-- 두 단계로 나누어 생각할 수 있음
-- 1단계: 전체 상품의 평균 가격을 구함 => AVG() 사용
-- 2단계: 그 평균 가격보다 비싼 상품을 찾음 => WHERE 절 사용

-- 위 두 단계를 하나의 작업 단위로 묶고 싶을 때 사용하는 기술이 바로 서브쿼리

-- 무엇? 하나의 쿼리문 안에 포함된 또 다른 SELECT 쿼리
-- 안쪽 서브쿼리의 실행 결과를 받아 바깥쪽 메인쿼리가 실행됨

-- 서브쿼리 실습: 다음 학생 중 성적이 평균보다 높은 학생은?
-- students
-- ----------------------
-- id  | name    | score
-- ----------------------
-- 1   | 엘리스    | 85
-- 2   | 밥       | 78
-- 3   | 찰리     | 92
-- 4   | 데이브    | 65
-- 5   | 이브     | 88

-- sub_query DB 생성 및 진입
CREATE DATABASE sub_query;
USE sub_query;

-- students 테이블 생성
CREATE TABLE students (
	id INTEGER AUTO_INCREMENT, 	-- 아이디(자동으로 1씩 증가)
	name VARCHAR(30), 			-- 이름
	score INTEGER, 				-- 성적
	PRIMARY KEY (id) 			-- 기본키 지정: id
);

-- students 데이터 삽입
INSERT INTO students (name, score)
VALUES
	('엘리스', 85),
	('밥', 78),
	('찰리', 92),
	('데이브', 65),
	('이브', 88);
    
-- 확인
SELECT DATABASE();
SHOW TABLES;
SELECT * FROM students;

-- 평균 점수보다 더 높은 점수를 받은 학생 조회
SELECT * FROM students WHERE score > (평균점수)

-- 평균 점수 계산
SELECT AVG(score) FROM students;

-- 위 쿼리를 서브쿼리로 사용
-- 메인쿼리
SELECT * FROM students WHERE score > (SELECT AVG(score) FROM students);

-- 서브쿼리의 특징 5가지
-- 1) 중첩 구조
-- 메인쿼리 내부에 중첩하여 작성
SELECT 컬럼명1, 컬럼명2 ... 
FROM 테이블명
WHERE 컬럼명 연산자 (
  서브쿼리
);

-- 2) 메인쿼리와는 독립적으로 실행됨
-- 서브쿼리 우선 실행 후 
-- 그 결과를 받아 메인쿼리가 수행됨

-- 3) 다양한 위치에서 사용 가능
-- SELECT
-- FROM/JOIN
-- WHERE/HAVING 등

-- 4) 단일 값 또는 다중 값을 반환
-- 단일 값 서브쿼리: 특정 값을 반환하는 서브쿼리(1행 1열)
-- 다중 값 서브쿼리: 여러 레코드를 반환하는 서브쿼리(N행 N열)~ IN, ANY, ALL, EXISTS 연산자와 사용

-- 5) 복잡하고 정교한 데이터 분석에 유용
-- 필터링 조건 추출 => WHERE/HAVING 절에서 사용
-- 데이터 집계 결과 추출 => FROM/JOIN 절에서 사용














