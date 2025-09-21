import psycopg2

# database connection
conn = psycopg2.connect(
    dbname="brazilian",   
    user="postgres",     
    password="0000",  
    host="localhost",     
    port="5432"          
)

# create a cursor
cur = conn.cursor()

# example queries like from previous task 4 
queries = [
    "-- 1. First 10 customers",
    "SELECT * FROM customers LIMIT 10;",
    
    "-- 2. Orders placed in 2018",
    """SELECT * FROM orders
       WHERE order_purchase_timestamp >= '2018-01-01'
         AND order_purchase_timestamp < '2019-01-01'
       ORDER BY order_purchase_timestamp ASC
       LIMIT 10;""",

    "-- 3. Number of orders per status",
    "SELECT order_status, COUNT(*) FROM orders GROUP BY order_status;"
]

# running  queries
for i in range(0, len(queries), 2):  # step over comments + query
    comment = queries[i]
    query = queries[i+1]
    print(comment)
    cur.execute(query)
    rows = cur.fetchall()
    for row in rows:
        print(row)
    print("-" * 40)

# cleaning up
cur.close()
conn.close()
