ARG REGISTRY_PREFIX=""
FROM ${REGISTRY_PREFIX}golang:alpine as builder
RUN go install -v github.com/syepes/network_exporter@latest
RUN cd /go/pkg/mod/github.com/syepes/network_exporter* && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM ${REGISTRY_PREFIX}alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY --from=builder /go/pkg/mod/github.com/syepes/network_exporter*/app network_exporter
CMD /app/network_exporter
EXPOSE 9427
