# --------------------------
# Dev Dockerfile env
# --------------------------

FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
ARG username
# Update the system
RUN apt-get update

# Install utils
RUN apt-get install -y ca-certificates git lsb-release mongodb nodejs npm sudo wget net-tools iputils-ping vim curl zsh man
RUN npm install -g nodemon
RUN npm install -g browser-sync

# Do not exclude man pages & other documentation
RUN rm /etc/dpkg/dpkg.cfg.d/excludes
# Reinstall all currently installed packages in order to get the man pages back
RUN apt-get update && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall && \
    rm -r /var/lib/apt/lists/*

RUN useradd -ms /bin/bash $username
RUN echo $username':devpass' | chpasswd
RUN usermod -aG sudo $username
USER $username
WORKDIR /home/$username
# Copy zshrc settings
COPY zshrc /home/$username/.zshrc