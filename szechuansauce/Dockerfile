# buildstage
FROM golang:1.9 AS build-env
RUN go get -u github.com/govend/govend
COPY . /go/src/github.com/dustin-decker/SzechuanSauce
WORKDIR /go/src/github.com/dustin-decker/SzechuanSauce
RUN govend -v
RUN go install
RUN CGO_ENABLED=0 GOOS=linux go build -a -tags "netgo static_build" -installsuffix netgo -ldflags "-w -s" -o /szechuansauce main.go

# final stage
FROM alpine
RUN apk add --no-cache ca-certificates
WORKDIR /
EXPOSE 9090
CMD ["szechuansauce"]
COPY --from=build-env  /szechuansauce /szechuansauce
