import redis
import time

r = redis.Redis()

channel = "chat"

while True:
    msg = input("Message to publish: ")
    r.publish(channel, msg)
    print("Sent:", msg)
