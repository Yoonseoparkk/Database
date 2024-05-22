import pymysql
import pymysql.cursors

# db에 접속
conn = pymysql.connect(
    host="localhost", user="encore", password="encore1234", database="employees"
)

cur = conn.cursor()
cur = conn.cursor(pymysql.cursors.DictCursor)

sql = """
SELECT salary
FROM salaries
WHERE emp_no = 10005;
"""

cur.execute(sql)
result = cur.fetchall()
# for i in range(5):
#     print(result[i])
print(result[0])


# with open(
#     r"C:\Users\USER\Desktop\database\수업자료\예제소스\employees\employees.sql",
#     encoding="utf-8",
# ) as file:
#     sql = file.read()

# sql = sql.split(";")
# for item in sql:
#     try:
#         print(cur.execute(item))
#     except Exception as e:
#         print(e)

# CREATE DATABASE `shopdb3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;