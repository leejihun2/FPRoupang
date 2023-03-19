# -*- coding: utf-8 -*-
import cx_Oracle
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm

font_location = 'C:/Windows/Fonts/malgun.ttf'
font_name = fm.FontProperties(fname=font_location).get_name()
plt.rc('font', family=font_name)

host_name = 'localhost'
oracle_port = 1521
service_name = 'xe'
dsn_tns = cx_Oracle.makedsn(host_name, oracle_port, service_name)
conn = cx_Oracle.connect(user='roupang', password='1234', dsn=dsn_tns)

cur = conn.cursor()
cur.execute("""
    SELECT SEARCH_WORD, COUNT(*) as SEARCH_COUNT
    FROM search_log
    GROUP BY SEARCH_WORD
    ORDER BY SEARCH_COUNT DESC
""")

data = cur.fetchall()
df = pd.DataFrame(data, columns=['Search Word', 'Search Count'])

plt.bar(df['Search Word'], df['Search Count'])
plt.xticks(rotation=90)
plt.xlabel('검색어')
plt.ylabel('검색 횟수')
plt.savefig('Search Count.png')

cur.execute("INSERT INTO file_info (file_name) VALUES (:1)", ('search_Count.png',))
conn.commit()

cur.close()
conn.close()


