# 1. Alap image
FROM redis:latest

# 2. Saját konfiguráció bemásolása
COPY redis.conf /usr/local/etc/redis/redis.conf

# 3. Volume az adatoknak
VOLUME /data

# 4. Redis indítása saját configgal
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
