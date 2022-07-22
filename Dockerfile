FROM alpine:latest as builder

RUN apk add --update py-pip && \
    pip install mkdocs && \
    mkdir /mkdocs

WORKDIR /mkdocs

FROM builder

ADD . .

EXPOSE 8000

CMD ["mkdocs","serve","--dev-addr","0.0.0.0:8000"]

