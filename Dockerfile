FROM golang:1-alpine AS builder

WORKDIR /app

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o go-server

FROM alpine:latest

WORKDIR /root/

COPY --from=0 ./app/go-server ./go-server

EXPOSE 8080

CMD ./go-server
