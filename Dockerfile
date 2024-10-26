# hadolint ignore=DL3007
FROM cupcakearmy/autorestic:latest AS autorestic

FROM alpine:edge
COPY --from=autorestic /usr/bin/autorestic /usr/bin/autorestic
# hadolint ignore=DL3018
RUN apk add --no-cache bash ca-certificates curl fuse rclone restic tzdata
ENTRYPOINT []
CMD ["autorestic"]
