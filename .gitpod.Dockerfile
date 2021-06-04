FROM gitpod/workspace-full:latest

USER root

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y zsh git netcat nmap vim tldr && apt-get autoremove -y && apt-get autoclean -y

USER gitpod

RUN pip3 install pytest==4.4.2 mock pytest-testdox toml
RUN npm i learnpack@0.0.76 -g && learnpack plugins:install learnpack-python

# set the zsh theme
ENV ZSH_THEME cloud

#install NG CLI
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN tldr git
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
