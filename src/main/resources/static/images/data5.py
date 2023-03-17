# -*- coding: utf-8 -*-
import cx_Oracle
import pandas as pd
import matplotlib.pyplot as plt

import matplotlib.font_manager as fm
font_location = 'C:/Windows/Fonts/malgun.ttf' # 원하는 폰트 파일 경로 입력
font_name = fm.FontProperties(fname=font_location).get_name()
plt.rc('font', family=font_name)


host_name = 'localhost'
oracle_port = 1521
service_name = 'xe'
dsn_tns = cx_Oracle.makedsn(host_name, oracle_port, service_name)
conn = cx_Oracle.connect(user='roupang', password='1234', dsn=dsn_tns)

cur = conn.cursor()
cur.execute("SELECT SEARCH_WORD, MEMBER_IDX, USER_BIRTH, to_char(SEARCH_REGIDATE,'HH24') FROM search_log")

data = cur.fetchall()
df = pd.DataFrame(data, columns=['Search Word', 'Member Index', 'User Birth', 'Search Regidate'])


plt.hist(df['Search Word'], bins=50)
plt.xlabel('검색')
plt.ylabel('검색내용')
plt.savefig('search_Word.png')  # 이미지를 파일로 저장

cur.execute("INSERT INTO file_info (file_name) VALUES (:1)", ('search_Word.png',))
conn.commit()
cur.close()
conn.close()

