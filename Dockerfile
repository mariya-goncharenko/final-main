FROM golang:1.22 AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 go build -o /parcel

FROM alpine:latest

COPY --from=builder /parcel /parcel

COPY tracker.db .

ENTRYPOINT ["/parcel"]