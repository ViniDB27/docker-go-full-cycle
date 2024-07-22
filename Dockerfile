FROM golang:alpine AS builder

WORKDIR /app

COPY main.go .

RUN go mod init fullcycle
RUN go build -o main .

FROM alpine
WORKDIR /app

COPY --from=builder /app/main .

CMD ["./main"]