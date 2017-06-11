# https://docs.docker.com/engine/reference/builder/#dockerfile-examples
FROM busybox

LABEL version="1.0"
LABEL description="Greeter"

STOPSIGNAL SIGKILL

ENV GREETING_MESSAGE=Hello!
ENV GREETING_PAUSE=2
VOLUME ["/tmp/greetings/"]

RUN mkdir -p /tmp/greetings

COPY greeter.sh /greeter.sh

RUN chmod u+x /greeter.sh

#ENTRYPOINT ["/greeter.sh"]
CMD ["/greeter.sh"]