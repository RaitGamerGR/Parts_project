# Используем минимальный образ Go
FROM golang:1.24 AS builder
WORKDIR /app
COPY . .
RUN go build -o my-go-app ./cmd/main.go

# Финальный образ
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/my-go-app .
CMD ["./my-go-app"]
