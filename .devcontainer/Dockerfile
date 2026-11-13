FROM mcr.microsoft.com/devcontainers/python:3.12

# The Yarn apt repository included in this image has a signing key that apt
# cannot verify, which breaks `apt-get update` and the docker-in-docker
# feature. The course does not use Yarn, so we remove that repository.
USER root
RUN grep -rl "yarnpkg" /etc/apt/sources.list.d/ 2>/dev/null | xargs -r rm -f
