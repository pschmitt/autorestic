FROM golang:1.20-alpine as builder

WORKDIR /app
COPY go.* .
RUN apk add --no-cache git && \
  git clone https://github.com/cupcakearmy/autorestic.git /app && \
  go mod download && \
  go build

FROM alpine:edge
RUN apk add --no-cache bash ca-certificates curl fuse rclone restic tzdata
COPY --from=builder /app/autorestic /usr/bin/autorestic
ENTRYPOINT []
CMD ["autorestic"]
