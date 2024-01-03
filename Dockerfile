FROM golang:bookworm AS build

WORKDIR /app/build

COPY . .

RUN mkdir bin

RUN go build -o ./bin/producer .

FROM alpine:latest

COPY --from=build /app/build/bin/producer /app/producer

CMD ["./app/producer"]
