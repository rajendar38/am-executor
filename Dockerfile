FROM golang:1.9

RUN go get -u github.com/golang/dep/cmd/dep

WORKDIR /go/src/github.com/discordianfish/prometheus-am-executor

COPY Gopkg.* ./
RUN  dep ensure --vendor-only
COPY .  .
ENV CGO_ENABLED=0
RUN go build . && go install

FROM alpine:3.6
RUN apk add --update ca-certificates && adduser -D user
USER user
COPY --from=0 /go/bin/prometheus-am-executor /bin

EXPOSE 8080
ENTRYPOINT [ "/bin/prometheus-am-executor" ]
