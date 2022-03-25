FROM  golang:1.18.0-alpine as golang
ADD src/hello.go /go/src/hello.go
RUN go build src/hello.go

FROM scratch
WORKDIR /go
COPY --from=golang /go/hello .
ENTRYPOINT [ "./hello" ]