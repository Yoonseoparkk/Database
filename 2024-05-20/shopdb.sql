SELECT memberid, membername, memberaddress
FROM shopdb.membertbl
WHERE memberid='sang';

SELECT * FROM productTBL;
select memberName, memberAddress FROM memberTBL;
select * from memberTBL where memberName = '지운이';

INSERT INTO shopdb.membertbl(memberid, membername, memberaddress) VALUEs ('Sk', '상근이', '부산');
한번 insert 한 후 primary key 같은 데이터 추가 불가능

SELECT * FROM shopdb.membertbl

UPDATE shopdb.producttbl
SET amount = 27
WHERE productname = '세탁기';

DELETE FROM shopdb.producttbl
WHERE productname = '세탁기';

INSERT INTO shopdb.producttbl (productname, cost, amount) VALUES ('노트북', 10, 50);
