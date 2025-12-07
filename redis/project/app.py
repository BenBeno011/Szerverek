import redis, time

r = redis.Redis(host="localhost", port=6379)

while True:
    r.set("timestamp", time.time())
    print("Timestamp updated.")
    time.sleep(2)
