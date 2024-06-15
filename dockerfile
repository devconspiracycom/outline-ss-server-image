FROM alpine:latest as build
ARG VERSION
WORKDIR /home
RUN wget https://github.com/Jigsaw-Code/outline-ss-server/releases/download/v${VERSION}/outline-ss-server_${VERSION}_linux_x86_64.tar.gz \
    && tar -xzvf outline-ss-server_${VERSION}_linux_x86_64.tar.gz
FROM alpine:latest
COPY --from=build /home/outline-ss-server /usr/bin/outline-ss-server
ENTRYPOINT [ "/usr/bin/outline-ss-server" ]
