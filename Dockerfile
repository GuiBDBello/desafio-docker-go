FROM golang:1.20-alpine3.18
WORKDIR /app
COPY . .
# strip additional debug information from
RUN go build -ldflags '-w -s -extldflags "-static"' -a -o application main.go

FROM scratch
WORKDIR /app
COPY --from=0 /app ./
CMD ["./application"]
