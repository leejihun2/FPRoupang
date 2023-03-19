import matplotlib.pyplot as plt

sales = {}
with open('part-r-00000상품.txt', 'r', encoding='utf-8') as f:
    for line in f:
        fields = line.strip().split('\t')
        if len(fields) == 2:  
            sales[fields[0]] = int(fields[1])
        elif len(fields) == 3:
            sales[fields[0]] = int(fields[2])

hours = range(24)
hourly_sales = [sales[f"{h:02d}시"] for h in hours]
plt.pie(hourly_sales, labels=[f"{h:02d}시" for h in hours])
plt.title('시간별')
plt.show()
