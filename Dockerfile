FROM quay.io/projectquay/golang:1.20 as builder
WORKDIR /go/src/app
COPY . .
RUN make build_linux_amd64

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/telegram_bot_on_go .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT ["./telegram_bot_on_go", "start"]
