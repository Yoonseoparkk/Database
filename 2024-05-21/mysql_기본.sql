-- USE  sqldb;
-- SELECT * FROM usertbl;

-- SELECT * FROM usertbl WHERE name = '김경호'; 

-- SELECT userID, Name FROM usertbl WHERE birthYear >= 1970 AND height >= 182;

-- SELECT userID, Name FROM usertbl WHERE birthYear >= 1970 OR height >= 182;

-- SELECT name, height FROM usertbl WHERE height >= 180 AND height <= 183;

-- SELECT name, height FROM usertbl WHERE height BETWEEN 180 AND 183;

-- SELECT name, addr FROM usertbl WHERE addr='경남' OR  addr='전남' OR addr='경북';

-- SELECT name, addr FROM usertbl WHERE addr IN ('경남','전남','경북');

-- SELECT name, height FROM usertbl WHERE name LIKE '김%';

-- SELECT name, height FROM usertbl WHERE name LIKE '_종신';

-- SELECT name, height FROM usertbl WHERE height  > 177;

-- SELECT name, height FROM usertbl 
--    WHERE height > (SELECT height FROM usertbl WHERE Name = '김경호');

-- SELECT name, height FROM usertbl 
--    WHERE height >= (SELECT height FROM usertbl WHERE addr = '경남');

-- SELECT name, height FROM usertbl 
--    WHERE height >= ANY (SELECT height FROM usertbl WHERE addr = '경남');

-- SELECT name, height FROM usertbl 
--    WHERE height >= ALL (SELECT height FROM usertbl WHERE addr = '경남');

-- SELECT name, height FROM usertbl 
--    WHERE height = ANY (SELECT height FROM usertbl WHERE addr = '경남');
--    
-- SELECT name, height FROM usertbl 
--   WHERE height IN (SELECT height FROM usertbl WHERE addr = '경남');

SELECT name, mDate FROM usertbl ORDER BY mDate;
SELECT name, mDate FROM usertbl ORDER BY mDate asc;
SELECT name, mDate FROM usertbl ORDER BY mDate DESC; 

SELECT name, height FROM usertbl ORDER BY height DESC, name ASC;

-- SELECT addr FROM usertbl;

-- SELECT addr FROM usertbl ORDER BY addr;

SELECT DISTINCT addr FROM usertbl;

-- USE employees;
-- SELECT emp_no, hire_date FROM employees 
--    ORDER BY hire_date ASC;

-- USE employees;
-- SELECT emp_no, hire_date FROM employees 
--    ORDER BY hire_date ASC
--    LIMIT 5;

-- SELECT emp_no, hire_date FROM employees 
--    ORDER BY hire_date ASC
--    LIMIT 0, 5;  -- LIMIT 5 OFFSET 0 과 동일

-- USE sqldb;
-- CREATE TABLE buytbl2 (SELECT * FROM buytbl);
-- SELECT * FROM buytbl2;

-- CREATE TABLE buytbl3 (SELECT userID, prodName FROM buytbl);
-- SELECT * FROM buytbl3;

-- SELECT userID, amount FROM buytbl ORDER BY userID;

-- SELECT userID, SUM(amount) FROM buytbl GROUP BY userID;

-- SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수'  
--    FROM buytbl GROUP BY userID;

-- SELECT userID AS '사용자 아이디', SUM(price*amount) AS '총 구매액'  
--    FROM buytbl GROUP BY userID;

-- USE sqldb;
-- SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl ;

-- SELECT userID, AVG(amount) AS '평균 구매 개수' FROM buytbl  GROUP BY userID;

-- SELECT name, MAX(height), MIN(height) FROM usertbl;

-- SELECT name, MAX(height), MIN(height) FROM usertbl GROUP BY Name;

-- SELECT name, height
--    FROM usertbl 
--    WHERE height = (SELECT MAX(height)FROM usertbl) 
--        OR height = (SELECT MIN(height)FROM usertbl) ;

-- SELECT COUNT(*) FROM usertbl;

-- SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM usertbl;

-- USE sqldb;
-- SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
--    FROM buytbl 
--    GROUP BY userID ;

-- SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
--    FROM buytbl 
--    WHERE SUM(price*amount) > 1000 
--    GROUP BY userID ;

-- SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
--    FROM buytbl 
--    GROUP BY userID
--    HAVING SUM(price*amount) > 1000 ;

-- SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
--    FROM buytbl 
--    GROUP BY userID
--    HAVING SUM(price*amount) > 1000 
--    ORDER BY SUM(price*amount) ;

-- SELECT num, groupName, SUM(price * amount) AS '비용' 
--    FROM buytbl
--    GROUP BY  groupName, num
--    WITH ROLLUP;

-- SELECT groupName, SUM(price * amount) AS '비용' 
--    FROM buytbl
--    GROUP BY  groupName
--    WITH ROLLUP;

-- USE sqldb;
-- CREATE TABLE testTbl1 (id  int, userName char(3), age int);
-- INSERT INTO testTbl1 VALUES (1, '홍길동', 25);

-- INSERT INTO testTbl1(id, userName) VALUES (2, '설현');

-- INSERT INTO testTbl1(userName, age, id) VALUES ('하니', 26,  3);

-- USE  sqldb;
-- CREATE TABLE testTbl2 
--   (id  int AUTO_INCREMENT PRIMARY KEY, 
--    userName char(3), 
--    age int );
-- INSERT INTO testTbl2 VALUES (NULL, '지민', 25);
-- INSERT INTO testTbl2 VALUES (NULL, '유나', 22);
-- INSERT INTO testTbl2 VALUES (NULL, '유경', 21);
-- SELECT * FROM testTbl2;

-- SELECT LAST_INSERT_ID(); 

-- ALTER TABLE testTbl2 AUTO_INCREMENT=100;
-- INSERT INTO testTbl2 VALUES (NULL, '찬미', 23);
-- SELECT * FROM testTbl2;

-- USE  sqldb;
-- CREATE TABLE testTbl3 
--   (id  int AUTO_INCREMENT PRIMARY KEY, 
--    userName char(3), 
--    age int );
-- ALTER TABLE testTbl3 AUTO_INCREMENT=1000;
-- SET @@auto_increment_increment=3;
-- INSERT INTO testTbl3 VALUES (NULL, '나연', 20);
-- INSERT INTO testTbl3 VALUES (NULL, '정연', 18);
-- INSERT INTO testTbl3 VALUES (NULL, '모모', 19);
-- SELECT * FROM testTbl3;

-- USE sqldb;
-- CREATE TABLE testTbl4 (id int, Fname varchar(50), Lname varchar(50));
-- INSERT INTO testTbl4 
--   SELECT emp_no, first_name, last_name
--     FROM employees.employees ;

-- USE sqldb;
-- CREATE TABLE testTbl5 
--    (SELECT emp_no, first_name, last_name  FROM employees.employees) ;

-- UPDATE testTbl4
--     SET Lname = '없음'
--     WHERE Fname = 'Kyoichi';

-- USE sqldb;
-- UPDATE buytbl SET price = price * 1.5 ;

-- USE sqldb;
-- DELETE FROM testTbl4 WHERE Fname = 'Aamer';

-- DELETE FROM testTbl4 WHERE Fname = 'Aamer'  LIMIT 5;