FROM alpine:3.5

RUN apk update && apk upgrade && apk --update add \
    bash supervisor py2-pip inotify-tools && \
    pip install supervisor-stdout

COPY supervisord.conf /etc
COPY snapshot_watcher.sh /

CMD ["/usr/bin/supervisord","-n"]
