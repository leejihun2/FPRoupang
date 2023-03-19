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
    SELECT to_char(SEARCH_REGIDATE, 'HH24') as SEARCH_HOUR, SEARCH_WORD, COUNT(*) as SEARCH_COUNT
    FROM search_log
    GROUP BY to_char(SEARCH_REGIDATE, 'HH24'), SEARCH_WORD
    ORDER BY SEARCH_HOUR, SEARCH_COUNT DESC
""")

data = cur.fetchall()
df = pd.DataFrame(data, columns=['Search Hour', 'Search Word', 'Search Count'])

search_words = df['Search Word'].unique()

for word in search_words:
    fig, ax = plt.subplots(figsize=(12, 6))
    grp = df[df['Search Word'] == word]
    ax = grp.plot(ax=ax, kind='bar', x='Search Hour', y='Search Count')
    plt.xlabel('검색 시간대')
    plt.ylabel('검색 횟수')
    plt.title(f'{word} 검색 횟수')
    plt.xticks(rotation=0)
    plt.savefig(f'Search Count by Hour for {word}.png')

    cur.execute("INSERT INTO file_info (file_name) VALUES (:1)", (f'search_Count_by_Hour_for_{word}.png',))
    conn.commit()

cur.close()
conn.close()
