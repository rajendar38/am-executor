FROM golang:1.9

RUN go get -u github.com/golang/dep/cmd/dep

WORKDIR /go/src/github.com/discordianfish/prometheus-am-executor

COPY Gopkg.* ./
RUN  dep ensure --vendor-only
COPY .  .
ENV CGO_ENABLED=0
RUN go build . && go install

FROM debian
RUN apt-get update \
&& apt-get install -yq --no-install-recommends \
       ca-certificates \
       curl
ENV CLUSTER_NAME default
COPY --from=0 /go/bin/prometheus-am-executor /bin
COPY start1.sh /usr/start.sh
RUN chmod 700 /usr/start.sh
EXPOSE 8080
CMD [ "/bin/prometheus-am-executor" , "./usr/start.sh"]
