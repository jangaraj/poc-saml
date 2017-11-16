# buildstage
FROM golang:1.9 AS build-env
RUN go get github.com/crewjam/saml && go get github.com/dgrijalva/jwt-go
COPY . /
WORKDIR /
RUN CGO_ENABLED=0 GOOS=linux go build -a -tags "netgo static_build" -installsuffix netgo -ldflags "-w -s" -o /saml main.go

# final stage
FROM alpine
RUN apk add --no-cache ca-certificates
WORKDIR /
EXPOSE 9090
CMD ["saml"]
COPY --from=build-env  /saml /saml
