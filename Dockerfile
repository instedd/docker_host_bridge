FROM alpine

RUN apk add --no-cache iproute2
ADD bridge.sh /

ENV INPUT_PORT 80

CMD ["/bridge.sh"]
