# Stage 1 (első szakasz):build, fordítás
FROM golang:latest AS build

COPY ./app/http-server.go /app/http-server.go

WORKDIR /app

RUN go build http-server.go

# Stage 2 (második szakasz):futattás
FROM golang:latest

WORKDIR /app

COPY --from=build /app/http-server /app/http-server

EXPOSE 8080

CMD ["./http-server"]