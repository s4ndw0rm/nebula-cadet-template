# Lab 01 - Linux I: "Welcome aboard Vega-7"
# A disposable cadet workstation. Built and started with:  ctf start lab01
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      less file nano vim-tiny tree procps ncurses-bin bash-completion gzip \
 && rm -rf /var/lib/apt/lists/*

# Replace the default 'ubuntu' user with our cadet.
RUN (userdel -r ubuntu 2>/dev/null || true) \
 && useradd -m -s /bin/bash -u 1000 cadet

COPY rootfs/ /
RUN chmod 755 /usr/local/bin/inspect-deck /etc/profile.d/99-nebula.sh \
 && bash /opt/nebula/build-scenario.sh \
 && rm -rf /opt/nebula

WORKDIR /home/cadet
CMD ["sleep", "infinity"]
