import psycopg2

# Database connection
conn = psycopg2.connect(
    dbname="brazilian",   # your database name
    user="postgres",      # your postgres username
    password="0000",  # your password
    host="localhost",     # keep this if local
    port="5432"           # default postgres port
)

# Create a cursor
cur = conn.cursor()

# Example queries
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

# Run queries
for i in range(0, len(queries), 2):  # step over comments + query
    comment = queries[i]
    query = queries[i+1]
    print(comment)
    cur.execute(query)
    rows = cur.fetchall()
    for row in rows:
        print(row)
    print("-" * 40)

# Clean up
cur.close()
conn.close()
