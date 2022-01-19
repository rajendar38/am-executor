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
COPY . .
EXPOSE 8080
RUN chmod +x start1.sh
CMD [ "/bin/prometheus-am-executor" , "./start1.sh"]
