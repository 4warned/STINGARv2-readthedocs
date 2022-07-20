FROM alpine:latest as builder

RUN apk add --update python3 python3-dev py-pip musl-dev gcc && \
    pip install --ignore-installed distlib pipenv && \
    pip install mkdocs && \
    pip install mkdocs-macros-plugin && \
    pip install mkdocs-user-defined-values && \
    mkdir /mkdocs

WORKDIR /mkdocs

FROM builder

ADD . .

EXPOSE 8001

CMD ["mkdocs","serve","--dev-addr","0.0.0.0:8001"]

