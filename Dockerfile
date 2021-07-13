#FROM golang:1.14-alpine AS build
FROM golang:alpine AS build
LABEL maintainer="Fitzgerald Home Interiors"
ENV GO111MODULE=on \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /storage

#COPY furniture/go.mod furniture/go.mod
COPY ./ ./

RUN go mod download

COPY main.go go.* /storage/

RUN CGO_ENABLED=0 go build -o /bin/storage

FROM scratch
COPY --from=build /bin/storage /bin/storage

ENTRYPOINT ["/bin/storage"]