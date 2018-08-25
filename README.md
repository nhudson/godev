# goenv

docker environment for golang development

## Build

To build locally

        $ git clone github.com/nhudson/godev.git
        $ docker build -t godev:latest .

## Usage

The docker image is built for mostly my own personal tastes.  You may want to edit the `zshrc` file and the `Dockerfile` to suit your needs.

This will import your VIM, AWS, GitHub, and SSH environment from your local machine for use in the docker container.

To run you need to issue the following command

           $ docker pull nhudson/godev
           $ docker run -it --rm \
                -v $(dirname $SSH_AUTH_SOCK) \
                -v $HOME/.ssh:/tmp/.ssh:ro \
                -v $HOME/.gitconfig:/root/.gitconfig \
                -v $HOME/.vim:/root/.vim \
                -v $HOME/.vimrc:/root/.vimrc \
                -v $HOME/.aws:/root/.aws \
                -e SSH_AUTH_SOCK:$SSH_AUTH_SOCK \
                nhudson/godev:latest sh

By default the image contains zsh and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) so if you want to customize your zsh shell you can do so in the provided `zshrc` file in the repo.  To enable zsh/oh-my-zsh just run this command.

           $ docker run -it --rm \
                -v $(dirname $SSH_AUTH_SOCK) \
                -v $HOME/.ssh:/tmp/.ssh:ro \
                -v $HOME/.gitconfig:/root/.gitconfig \
                -v $HOME/.vim:/root/.vim \
                -v $HOME/.vimrc:/root/.vimrc \
                -v $HOME/.aws:/root/.aws \
                -e SSH_AUTH_SOCK:$SSH_AUTH_SOCK \
                nhudson/godev:latest /bin/zsh

To make things a bit easier you can create a function to run this inside your shell.  This can work in either `zsh` or `bash`.  The example below is for `zsh`.

        $ cat ~/.zsh/dockerfunc 
            godev () {
                docker run -it --rm \
                    -v $(dirname $SSH_AUTH_SOCK) \
                    -v $HOME/.ssh:/tmp/.ssh:ro \
                    -v $HOME/.gitconfig:/root/.gitconfig \
                    -v $HOME/.vim:/root/.vim \
                    -v $HOME/.vimrc:/root/.vimrc \
                    -v $HOME/.aws:/root/.aws \
                    -e SSH_AUTH_SOCK:$SSH_AUTH_SOCK \
                    --name godev \
                    nhudson/godev:latest /bin/zsh
            }

Just source `~/.zsh/dockerfunc` in your `~/.zshrc` file and reload zsh.

## ToDo

1: Wanting to find a better way to "`go get`" public and private modules into a default image.  For now you either have to add them to the `Dockerfile` or manually once you're in the container.

2: Update base container image to golang 1.11



