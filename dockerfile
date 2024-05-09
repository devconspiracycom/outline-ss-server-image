FROM golang:1.18 as build
WORKDIR /home
RUN git clone --depth 1 --branch v1.5.0 https://github.com/Jigsaw-Code/outline-ss-server.git
WORKDIR /home/outline-ss-server
RUN CGO_ENABLED=0 GOOS=linux go build .
RUN env
FROM alpine:3.14
COPY --from=build /home/outline-ss-server/outline-ss-server /usr/bin/outline-ss-server
ENTRYPOINT [ "/usr/bin/outline-ss-server" ]