FROM golang:1.8-alpine as builder

RUN mkdir /src

RUN cd src

RUN mkdir /somaApp 

ADD /src/soma/. /src/somaApp/

WORKDIR /src/somaApp 

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o somaNumeros .

FROM scratch

COPY --from=builder /src/somaApp/somaNumeros /app/

WORKDIR /app

CMD ["./somaNumeros"]