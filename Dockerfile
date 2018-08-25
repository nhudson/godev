FROM golang:1.11rc2-alpine

ENV GOPATH=/go
ENV PATH=$PATH:$GOPATH/bin

COPY scripts/docker-entrypoint.sh /
COPY scripts/goget.sh /

RUN apk update && \
	apk upgrade --no-cache && \
	apk add --no-cache \
	less \
	groff \
	git \
	python3 \
	openssh-client \
	vim \
	wget \
	zsh && \
	pip3 install --upgrade pip && \
	pip install awscli && \
	rm -fr /var/cache/apk/* && \
	/goget.sh

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

WORKDIR /go

VOLUME $HOME/.vim:$HOME/.vim
VOLUME $HOME/.aws:$HOME/.aws
VOLUME $HOME/.ssh:/tmp/.ssh:ro
VOLUME $HOME/.gitconfig:$HOME/.gitconfig

COPY zshrc /root/.zshrc

ENTRYPOINT ["/docker-entrypoint.sh"]
