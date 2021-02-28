FROM alpine:3

WORKDIR /usr/backup
COPY backup.sh .

CMD ["/bin/ash", "backup.sh"]
