FROM golang:1.18 AS builder

WORKDIR /app

COPY ./src .

RUN go mod download

RUN go build -o main /app/main.go

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/main /app

CMD [ "/app/main" ]
