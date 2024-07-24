FROM golang:alpine3.14 as builder
WORKDIR /app

COPY ./src .

RUN go build -ldflags "-s -w" -o main .

FROM scratch
WORKDIR /app

COPY --from=builder /app/main .

CMD ["./main"]