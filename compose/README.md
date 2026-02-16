# Docker Compose példa



## Hogyan futtasd?

 - Projekt könyvtár létrehozása:

   - Hozd létre a mappastruktúrát, és másold be a fájlokat a megfelelő helyekre.


 - Docker Compose futtatása:

   - docker compose -p firstproject up --build-arg HTTP_PROXY=http://10.0.0.2:3128 --build-arg HTTPS_PROXY=http://10.0.0.2:3128
   - docker compose -p firstproject up -d
### Eredmény:

   - A Node.js alkalmazás csatlakozik a MySQL adatbázishoz.

   - A konzolban láthatod a MySQL aktuális idejét (NOW() lekérdezés eredményét).



### Magyarázat

  - app-network: A konténerek egy közös hálózatban vannak, így az app konténer az db nevű hosztnévvel elérheti az adatbázist.

  - depends_on: Biztosítja, hogy a db konténer elinduljon az app előtt.

  - MYSQL_ROOT_PASSWORD és MYSQL_DATABASE: A MySQL alapvető konfigurációját határozzák meg.

  - Node.js kapcsolat: Környezeti változókat használunk a MySQL konfigurációhoz, ami rugalmassá teszi a rendszert.




### További használat

 - A Docker Compose automatikusan használja a Dockerfile-t, ha a docker-compose.yml fájlban a szolgáltatás definiálásakor a build paraméter van megadva.

 - A build paraméter kezeli, hogy a Compose hol találja a Dockerfile-t, és hogyan készítse el a képet.

 - Alapértelmezett viselkedés:
   Ha a docker-compose.yml fájlban megadod a build paramétert egy útvonallal, a Compose alapértelmezés szerint az adott útvonalon lévő Dockerfile-t fogja használni.
   Ha nem adsz meg egyedi Dockerfile nevet vagy útvonalat, akkor a Compose az alapértelmezett nevű Dockerfile-t (az adott könyvtárban) használja.

```
services:
  app:
    build: .
    ports:
      - "3000:3000"
```


 - build: .: A Docker Compose az aktuális könyvtárban (.) keresi a Dockerfile-t, és azt használja az image elkészítéséhez.

 - Egyedi Dockerfile megadása

 - Ha a Dockerfile nem az alapértelmezett nevű vagy helyű, akkor ezt a docker-compose.yml fájlban explicit módon megadhatod:

```
services:
  app:
    build:
      context: ./app
      dockerfile: CustomDockerfile
    ports:
      - "3000:3000"
```


 - context: Meghatározza azt a könyvtárat, amelyet a Docker build folyamat használ (pl. ./app).

 - dockerfile: Meghatározza a Dockerfile egyedi nevét vagy elérési útját (pl. CustomDockerfile).


 - Mi történik, ha nincs build?

 - Ha nincs build paraméter, akkor a Compose egy előre létrehozott képet fog keresni a docker-compose.yml fájlban a image kulcsnál megadott név alapján:

```
services:
  app:
    image: node:14
    ports:
      - "3000:3000"
```



### Összefoglalás

 - A Dockerfile automatikusan használva lesz, ha:

   - Megadod a build paramétert.

   - A megfelelő helyen és névvel található.

   - Ha egyedi helyen vagy névvel van, explicit meg kell adnod a build paraméterben.


:)

