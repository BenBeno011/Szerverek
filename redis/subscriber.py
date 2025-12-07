import redis

r = redis.Redis()
pubsub = r.pubsub()
pubsub.subscribe("chat")

print("Listening on 'chat' channel...")

for message in pubsub.listen():
    if message["type"] == "message":
        print("Received:", message["data"].decode())
