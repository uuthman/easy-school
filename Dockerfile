FROM python:3.11-alpine AS build

WORKDIR /app

RUN apk add --update --virtual .build-deps \
    build-base \
    postgresql-dev \
    python3-dev \
    libpq

COPY requirements.txt /app/requirements.txt

RUN pip install -r /app/requirements.txt

FROM python:3.11-alpine

WORKDIR /app

RUN apk add libpq
COPY --from=build /usr/local/lib/python3.11/site-packages/ /usr/local/lib/python3.11/site-packages/

COPY --from=build /usr/local/bin/ /usr/local/bin/

COPY . /app

#ENV PYTHONUNBUFFERED 1

EXPOSE 8000

ENTRYPOINT ["sh", "/app/docker/entrypoint.sh"]