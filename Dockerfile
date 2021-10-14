FROM golang:1.17.2-alpine3.14 as build
COPY ./rocks.go /go/rocks.go
RUN go build rocks.go

FROM scratch
COPY --from=build /go/rocks /app/rocks
CMD ["/app/rocks"]
