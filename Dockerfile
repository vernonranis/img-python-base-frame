FROM python:3.10.4-alpine3.15

RUN pip install --upgrade pip && \
	mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN apk --no-cache -U upgrade && \
	apk add sudo shadow curl && \
	rm /var/cache/apk/* && \
	addgroup -g 8877 -S dev && adduser -u 8877 -S dev -G dev && \
	echo "dev ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dev && \
	chmod 0440 /etc/sudoers.d/dev && \
	chown -R dev:dev /home/dev && \
	chown -R dev:dev /usr/src/app

USER dev
